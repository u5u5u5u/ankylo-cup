class GameState {
  final int currentPlayer;
  final List<int> playerScores;
  final List<int> currentDiceValues;
  final String gameMessage;
  final bool isReady;
  final bool isRolling;
  final bool isShaking;

  GameState({
    required this.currentPlayer,
    required this.playerScores,
    required this.currentDiceValues,
    required this.gameMessage,
    required this.isReady,
    required this.isRolling,
    required this.isShaking,
  });

  GameState copyWith({
    int? currentPlayer,
    List<int>? playerScores,
    List<int>? currentDiceValues,
    String? gameMessage,
    bool? isReady,
    bool? isRolling,
    bool? isShaking,
  }) {
    return GameState(
      currentPlayer: currentPlayer ?? this.currentPlayer,
      playerScores: playerScores ?? this.playerScores,
      currentDiceValues: currentDiceValues ?? this.currentDiceValues,
      gameMessage: gameMessage ?? this.gameMessage,
      isReady: isReady ?? this.isReady,
      isRolling: isRolling ?? this.isRolling,
      isShaking: isShaking ?? this.isShaking,
    );
  }

  factory GameState.initial() {
    return GameState(
      currentPlayer: 1,
      playerScores: [0, 0],
      currentDiceValues: [1, 1, 1],
      gameMessage: "プレイヤー1の番です",
      isReady: false,
      isRolling: false,
      isShaking: false,
    );
  }
}
