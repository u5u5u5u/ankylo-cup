import 'package:flutter/material.dart';

class RoomSearchScreen extends StatefulWidget {
  @override
  _RoomSearchScreenState createState() => _RoomSearchScreenState();
}

class _RoomSearchScreenState extends State<RoomSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _roomInfo = '';

  void _searchRoom() {
    setState(() {
      _roomInfo = 'Room ID: ${_controller.text}'; // Replace with actual search logic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ルーム検索'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'ルームIDを入力してください',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchRoom,
              child: Text('検索'),
            ),
            SizedBox(height: 16.0),
            Text(_roomInfo),
          ],
        ),
      ),
    );
  }
}
