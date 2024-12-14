import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/games/blackjack/widgets/blackjack_screen.dart';

class BlackjackGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blackjack Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlackjackScreen(),
    );
  }
}
