import 'package:ankylo_cup/presentation/games/blackjack/blackjack.dart';
import 'package:ankylo_cup/presentation/games/hockey/widgets/game_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/game_app.dart';
import 'package:ankylo_cup/presentation/games/chinchiro/chinchiro_screen.dart';
import 'package:ankylo_cup/presentation/page/account/account_screen.dart';
import 'package:ankylo_cup/presentation/page/room/room_screen.dart';

class SelectGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ゲーム選択'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildGameTile(context, 'ブロック崩し', BrickBreakerGameScreen(), false),
          _buildGameTile(context, 'チンチロ', ChinchiroGameScreen(), true),
          _buildGameTile(context, 'ホッケー', HockeyGameScreen(), true),
          _buildGameTile(context, 'ブラックジャック', BlackjackGame(), false),
        ],
      ),
    );
  }

  Widget _buildGameTile(BuildContext context, String title, Widget game,
      bool supportsMultiplayer) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => game),
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
