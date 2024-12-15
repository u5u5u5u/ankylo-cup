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
        title: Text('Games', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildGameTile(context, 'Brick\nBreaker', BrickBreakerGameScreen(),
              false, 'images/brick_breaker.png'),
          _buildGameTile(context, 'Chin\nchiro', ChinchiroGameScreen(), true,
              'images/chinchiro.png'),
          _buildGameTile(
              context, 'Hockey', HockeyGameScreen(), true, 'images/hockey.png'),
          _buildGameTile(context, 'Black\nJack', BlackjackGame(), false,
              'images/blackjack.png'),
        ],
      ),
    );
  }

  Widget _buildGameTile(BuildContext context, String title, Widget game,
      bool supportsMultiplayer, String imagePath) {
    print('imagePath: $imagePath');
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => game),
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
