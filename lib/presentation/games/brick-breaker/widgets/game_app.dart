import 'package:ankylo_cup/presentation/games/brick-breaker/brick_breaker.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/config.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/overlay_screen.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/score_card.dart';
import 'package:ankylo_cup/presentation/page/select_mode/select_mode_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ankylo_cup/theme/app_theme.dart';
import 'package:ankylo_cup/services/score_services.dart';

class BrickBreakerGameScreen extends StatefulWidget {
  const BrickBreakerGameScreen({super.key});

  @override
  State<BrickBreakerGameScreen> createState() => _BrickBreakerGameScreenState();
}

class _BrickBreakerGameScreenState extends State<BrickBreakerGameScreen> {
  late final BrickBreaker game;
  late final ValueNotifier<int> scoreNotifier;

  @override
  void initState() {
    super.initState();
    game = BrickBreaker();
    scoreNotifier = game.score;
  }

  void _exitGame() async {
    try {
      print('Score: ${scoreNotifier.value}');
      final response = await ScoreService().recordScore(scoreNotifier.value);
    } catch (e) {
      print('Failed to record score: $e');
    } finally {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectModeScreen()),
      );
    }
  }

  void _againGame() async {
    try {
      final response = await ScoreService().recordScore(scoreNotifier.value);
    } catch (e) {
      print('Failed to record score: $e');
    } finally {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BrickBreakerGameScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: AppTheme.theme.textTheme,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 108, 51, 170),
                Color.fromARGB(255, 10, 57, 167),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    ScoreCard(score: scoreNotifier),
                    Expanded(
                      child: FittedBox(
                        child: SizedBox(
                          width: gameWidth,
                          height: gameHeight,
                          child: GameWidget(
                            game: game,
                            overlayBuilderMap: {
                              PlayState.welcome.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'TAP TO PLAY',
                                    subtitle: 'Use arrow keys or swipe',
                                  ),
                              PlayState.gameOver.name: (context, game) =>
                                  OverlayScreen(
                                    title: 'G A M E   O V E R',
                                    subtitle: 'Tap to Play Again',
                                    showExitButton: true,
                                    onExitPressed: _exitGame,
                                    onAgainPressed: _againGame,
                                  ),
                              PlayState.won.name: (context, game) =>
                                  OverlayScreen(
                                    title: 'Y O U   W O N ! ! !',
                                    subtitle: 'Tap to Play Again',
                                    showExitButton: true,
                                    onExitPressed: _exitGame,
                                    onAgainPressed: _againGame,
                                  ),
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
