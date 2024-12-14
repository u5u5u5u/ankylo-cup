import 'dart:math';
import 'package:ankylo_cup/presentation/games/chinchiro/chinchiro_screen_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ankylo_cup/services/score_services.dart';
import 'package:ankylo_cup/presentation/page/select_mode/select_mode_screen.dart';

class ChinchiroGameScreen extends ConsumerStatefulWidget {
  const ChinchiroGameScreen({Key? key}) : super(key: key);

  @override
  ChinchiroGameScreenState createState() => ChinchiroGameScreenState();
}

class ChinchiroGameScreenState extends ConsumerState<ChinchiroGameScreen>
    with TickerProviderStateMixin {
  late AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  Future<void> _exitGame(int score) async {
    try {
      await ScoreService().recordScore(score);
    } catch (e) {
      print('Failed to record score: $e');
    } finally {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectModeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);

    // サイコロが振られているときに回転アニメーションを開始/停止
    if (gameState.isShaking && !rotationController.isAnimating) {
      rotationController.repeat();
    } else if (!gameState.isShaking && rotationController.isAnimating) {
      rotationController.stop();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('チンチロ'),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              gameState.gameMessage,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Dice(
                        value: gameState.currentDiceValues[0],
                        rotationController: rotationController,
                        angleOffset: pi / 4,
                        isInitial: !gameState.isShaking,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Dice(
                        value: gameState.currentDiceValues[1],
                        rotationController: rotationController,
                        angleOffset: pi / 2,
                        isInitial: !gameState.isShaking,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Dice(
                        value: gameState.currentDiceValues[2],
                        rotationController: rotationController,
                        angleOffset: 3 * pi / 4,
                        isInitial: !gameState.isShaking,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Player 1 Score: ${gameState.playerScores[0]}',
                style: const TextStyle(fontSize: 18)),
            Text('Player 2 Score: ${gameState.playerScores[1]}',
                style: const TextStyle(fontSize: 18)),
            if (gameState.gameMessage.contains("Wins") ||
                gameState.gameMessage.contains("Draw")) ...[
              ElevatedButton(
                onPressed: gameNotifier.resetGame,
                child: const Text('Play Again'),
              ),
              ElevatedButton(
                onPressed: () => _exitGame(
                    gameState.playerScores[gameState.currentPlayer - 1]),
                child: const Text('exit', style: TextStyle(fontSize: 32)),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 24),
                ),
              ),
            ],
            if (!gameState.isReady)
              ElevatedButton(
                onPressed: gameNotifier.startTurn,
                child: const Text('again', style: TextStyle(fontSize: 32)),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 24),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final int value;
  final AnimationController rotationController;
  final double angleOffset;
  final bool isInitial;

  const Dice({
    super.key,
    required this.value,
    required this.rotationController,
    required this.angleOffset,
    required this.isInitial,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rotationController,
      builder: (context, child) {
        // サイコロが振られているときのみ回転
        final angle = rotationController.isAnimating
            ? rotationController.value * 2 * pi
            : 0;
        return Transform.rotate(
          angle: angle.toDouble(),
          child: Transform.rotate(
            angle: isInitial ? 0 : angleOffset,
            child: Center(
              child: Transform.rotate(
                angle: isInitial ? 0 : -angleOffset,
                child: Text(
                  _getDiceFace(value),
                  style: const TextStyle(
                      fontSize: 128,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getDiceFace(int value) {
    switch (value) {
      case 1:
        return '⚀';
      case 2:
        return '⚁';
      case 3:
        return '⚂';
      case 4:
        return '⚃';
      case 5:
        return '⚄';
      case 6:
        return '⚅';
      default:
        return '';
    }
  }
}
