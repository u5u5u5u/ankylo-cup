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
        backgroundColor: const Color.fromARGB(200, 127, 65, 192),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildGameTile(context, 'ブロック崩し', GameApp(), false),
          _buildGameTile(context, 'チンチロ', ChinchiroGameScreen(), true),
          _buildGameTile(context, 'Coming Soon ...', Container(), true),
          _buildGameTile(context, 'Coming Soon ...', Container(), false),
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
        color: const Color.fromARGB(200, 203, 189, 247),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
