import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/games/blackjack/widgets/blackjack_screen.dart';
import 'package:ankylo_cup/theme/app_theme.dart';

class BlackjackGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlackjackScreen(),
    );
  }
}
