import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/page/select_game/select_game_screen.dart';
import 'package:ankylo_cup/presentation/page/room/room_screen.dart';

class SelectModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('モード選択'),
        backgroundColor: const Color.fromARGB(200, 127, 65, 192),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectGameScreen()),
                );
              },
              child: Text('ソロプレイ'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomScreen()),
                );
              },
              child: Text('マルチプレイ'),
            ),
          ],
        ),
      ),
    );
  }
}
