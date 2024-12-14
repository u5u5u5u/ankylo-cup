import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/game_app.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Game'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _buildGameTile(context, 'Game 1', GameApp()),
          _buildGameTile(context, 'Game 2', GameApp()),
          _buildGameTile(context, 'Game 3', GameApp()),
          _buildGameTile(context, 'Game 4', GameApp()),
        ],
      ),
    );
  }

  Widget _buildGameTile(BuildContext context, String title, Widget game) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => game),
        );
      },
      child: Card(
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}