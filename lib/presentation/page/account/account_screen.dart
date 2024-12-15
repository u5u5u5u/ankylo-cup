import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatelessWidget {
  final User? user;

  AccountScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account', style: TextStyle(color: Colors.white)),
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
        child: user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL ?? ''),
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  Text(user!.displayName ?? '', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 10),
                  Text(user!.email ?? ''),
                  SizedBox(height: 10),
                  Text(user!.uid, style: TextStyle(fontSize: 10)),
                ],
              )
            : Text('No user information available'),
      ),
    );
  }
}
