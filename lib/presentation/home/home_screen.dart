import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ゲームを選択'),
      ),
      body: GameSelectionScreen(),
    );
  }
}

class GameSelectionScreen extends StatelessWidget {
  final List<String> games = [
    'ゲーム1',
    'ゲーム2',
    'ゲーム3',
    'ゲーム4',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(games[index]),
          onTap: () {
            // ゲーム選択時の処理をここに追加
          },
        );
      },
    );
  }
}