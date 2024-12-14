import 'package:flutter/material.dart';

class SelectModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('モード選択'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectScreen()),
                );
              },
              child: Text('ソロプレイ'),
            ),
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

class SelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ソロプレイ'),
      ),
      body: Center(
        child: Text('ソロプレイ画面を実装してください'),
      ),
    );
  }
}

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーム作成および検索'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RoomDetailScreen(roomId: 'dummyRoomId')),
                );
              },
              child: Text('ルーム作成'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomSearchScreen()),
                );
              },
              child: Text('ルーム検索'),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomDetailScreen extends StatelessWidget {
  final String roomId;

  RoomDetailScreen({required this.roomId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーム詳細: $roomId'),
      ),
      body: Center(
        child: Text('ルームID: $roomId'),
      ),
    );
  }
}

class RoomSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーム検索'),
      ),
      body: Center(
        child: Text('ルーム検索機能を実装してください'),
      ),
    );
  }
}
