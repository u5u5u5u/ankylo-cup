import 'package:ankylo_cup/services/room_services.dart';
import 'package:flutter/material.dart';
import 'package:ankylo_cup/theme/app_theme.dart';

class RoomSearchScreen extends StatefulWidget {
  @override
  _RoomSearchScreenState createState() => _RoomSearchScreenState();
}

class _RoomSearchScreenState extends State<RoomSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _roomInfo = '';
  bool _isLoading = false;

  void _searchRoom() async {
    setState(() {
      _roomInfo = 'Room ID: ${_controller.text}';
      _isLoading = true;
    });

    try {
      int roomId = int.parse(_controller.text);
      final response = await RoomServices().joinRoom(roomId);
      print('Response: ${response}');
      setState(() {
        _roomInfo = 'Successfully joined the room';
      });
    } catch (e) {
      setState(() {
        _roomInfo = 'Failed to join the room: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search', style: TextStyle(color: Colors.white)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Please enter Room ID',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 50.0,
              child: ElevatedButton(
                onPressed: _searchRoom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
                    SizedBox(width: 8.0),
                    Text(
                      'search',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(_roomInfo, style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
