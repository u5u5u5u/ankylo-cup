import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ankylo_cup/presentation/page/select_game/select_game_screen.dart';
import 'package:ankylo_cup/presentation/page/room/room_screen.dart';
import 'package:ankylo_cup/presentation/page/account/account_screen.dart';

class SelectModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('モード選択'),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          if (user != null && user.photoURL != null)
            IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountScreen(user: user)),
                );
              },
            ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectGameScreen()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Card(
                  color: Theme.of(context).cardColor,
                  child: Center(
                    child: Text(
                      'ソロ',
                      style: TextStyle(
                        fontSize: 50,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomScreen()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Card(
                  color: Theme.of(context).cardColor,
                  child: Center(
                    child: Text(
                      'マルチ',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
