import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/page/room/room_search_screen.dart';
import 'package:ankylo_cup/presentation/page/room/room_create_screen.dart';

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーム'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomCreateScreen()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Card(
                  color: Theme.of(context).cardColor,
                  child: Center(
                    child: Text(
                      '作成',
                      style: TextStyle(fontSize: 24),
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
                  MaterialPageRoute(builder: (context) => RoomSearchScreen()),
                );
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Card(
                  color: Theme.of(context).cardColor,
                  child: Center(
                    child: Text(
                      '検索',
                      style: TextStyle(fontSize: 24),
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
