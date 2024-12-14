import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/game_app.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildGameTile(context, 'ブロック崩し', GameApp(), true),
          _buildGameTile(context, 'Game 2', GameApp(), false),
          _buildGameTile(context, 'Game 3', GameApp(), true),
          _buildGameTile(context, 'Game 4', GameApp(), false),
        ],
      ),
    );
  }

  Widget _buildGameTile(BuildContext context, String title, Widget game,
      bool supportsMultiplayer) {
    return GestureDetector(
      onTap: () {
        if (supportsMultiplayer) {
          _showGameModeDialog(context, game);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => game),
          );
        }
      },
      child: Card(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showGameModeDialog(BuildContext context, Widget game) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('モード選択'),
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleDialogOption(
                    child: Text('ソロ', style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => game),
                      );
                    },
                  ),
                  SimpleDialogOption(
                    child: Text('マルチ', style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => game),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
