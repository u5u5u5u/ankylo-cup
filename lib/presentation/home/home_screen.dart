import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/game_app.dart';
import 'package:ankylo_cup/presentation/games/chinchiro/chinchiro_screen.dart';
import 'package:ankylo_cup/presentation/account/account_screen.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: const Color.fromARGB(200, 127, 65, 192),
        automaticallyImplyLeading: false,
        actions: [
          if (user != null)
            IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL!),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
            )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildGameTile(context, 'ブロック崩し', GameApp(), true),
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

  void _showGameModeDialog(BuildContext context, Widget game) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
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
