import 'dart:async';
import 'dart:math';

import 'package:ankylo_cup/presentation/games/chinchiro/Chinchiro_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

final gameProvider = StateNotifierProvider<GameNotifier, GameState>(
  (ref) => GameNotifier(),
);

class GameNotifier extends StateNotifier<GameState> {
  Timer? shakeTimer;

  GameNotifier() : super(GameState.initial()) {
    accelerometerEventStream(
      samplingPeriod: SensorInterval.gameInterval,
    ).listen((AccelerometerEvent event) {
      if (!state.isReady ||
          state.gameMessage.contains("Wins") ||
          state.gameMessage.contains("Draw")) return;

      double currentMagnitude =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

      if (currentMagnitude > 15.0) {
        _handleShake();
      } else if (state.isShaking) {
        _handleShakeStop();
      }
    });
  }

  void _handleShake() {
    if (!state.isShaking && !state.isRolling) {
      state = state.copyWith(isShaking: true, isRolling: true);
    }
    _rollDice();

    shakeTimer?.cancel();
    shakeTimer = Timer(const Duration(seconds: 1), () {
      if (state.isShaking) {
        state = state.copyWith(isShaking: false);
        _endTurn();
      }
    });
  }

  void _handleShakeStop() {
    if (shakeTimer == null || !shakeTimer!.isActive) {
      shakeTimer = Timer(const Duration(seconds: 1), () {
        if (state.isShaking && state.isRolling) {
          state = state.copyWith(isShaking: false);
          _endTurn();
        }
      });
    }
  }

  void _rollDice() {
    state = state.copyWith(
      currentDiceValues: List.generate(3, (index) => Random().nextInt(6) + 1),
    );
  }

  void _endTurn() {
    int score = _calculateScore(state.currentDiceValues);
    List<int> updatedScores = List.from(state.playerScores);
    updatedScores[state.currentPlayer - 1] = score;

    if (state.currentPlayer == 1) {
      state = state.copyWith(
        currentPlayer: 2,
        playerScores: updatedScores,
        gameMessage: "Player 2's Turn: Press Ready to Start!",
        isReady: false,
        isRolling: false,
      );
    } else {
      _determineWinner(updatedScores);
    }
  }

  int _calculateScore(List<int> dice) {
    dice.sort();
    if (dice[0] == 4 && dice[1] == 5 && dice[2] == 6) {
      return 50;
    } else if (dice[0] == 1 && dice[1] == 2 && dice[2] == 3) {
      return -50;
    } else if (dice[0] == dice[1] && dice[1] == dice[2]) {
      return 100 + dice[0];
    } else if (dice[0] == dice[1]) {
      return dice[2];
    } else if (dice[1] == dice[2]) {
      return dice[0];
    } else {
      return 0;
    }
  }

  void _determineWinner(List<int> scores) {
    String winnerMessage;
    if (scores[0] > scores[1]) {
      winnerMessage = "Player 1 Wins!";
    } else if (scores[0] < scores[1]) {
      winnerMessage = "Player 2 Wins!";
    } else {
      winnerMessage = "It's a Draw!";
    }

    state = state.copyWith(
      playerScores: scores,
      gameMessage: winnerMessage,
    );
  }

  void resetGame() {
    state = GameState.initial();
  }

  void startTurn() {
    state = state.copyWith(
      isReady: true,
      gameMessage: "プレイヤー${state.currentPlayer}の番です",
      currentDiceValues: [1, 1, 1], // Reset dice values to initial state
    );
  }

  @override
  void dispose() {
    shakeTimer?.cancel();
    super.dispose();
  }
}
