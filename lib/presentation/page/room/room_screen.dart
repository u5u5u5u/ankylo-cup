import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/page/room/room_search_screen.dart';
import 'package:ankylo_cup/presentation/page/room/room_create_screen.dart';

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
                      builder: (context) => RoomCreateScreen()),
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
