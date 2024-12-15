import 'package:ankylo_cup/presentation/games/hockey/config.dart';
import 'package:ankylo_cup/presentation/games/hockey/hockey.dart';
import 'package:ankylo_cup/presentation/games/hockey/widgets/overlay_screen.dart';
import 'package:ankylo_cup/presentation/games/hockey/widgets/score_card.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ankylo_cup/services/score_services.dart';
import 'package:ankylo_cup/presentation/page/select_mode/select_mode_screen.dart';

class HockeyGameScreen extends StatefulWidget {
  const HockeyGameScreen({super.key});

  @override
  State<HockeyGameScreen> createState() => _HockeyGameScreenState();
}

class _HockeyGameScreenState extends State<HockeyGameScreen> {
  late final Hockey game;

  @override
  void initState() {
    super.initState();
    game = Hockey();
  }

  Future<void> _exitGame() async {
    try {
      print('Score: ${game.score.value}');
      await ScoreService().recordScore(game.score.value);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hockey', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop()),
        ),
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
                    ScoreCard(
                      score: game.score,
                      lifeRemain: game.lifeRemain,
                    ),
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
                                    subtitle: 'Tilting the device to move',
                                  ),
                              PlayState.gameOver.name: (context, game) =>
                                  OverlayScreen(
                                    title: 'G A M E   O V E R',
                                    subtitle: 'Tap to Play Again',
                                    showExitButton: true,
                                    onExitPressed: _exitGame,
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
