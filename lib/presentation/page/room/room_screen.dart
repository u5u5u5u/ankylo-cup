import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/page/room/room_search_screen.dart';
import 'package:ankylo_cup/presentation/page/room/room_create_screen.dart';

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room', style: TextStyle(color: Colors.white)),
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
                    child: Text('create',
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
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
                      'search',
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
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
