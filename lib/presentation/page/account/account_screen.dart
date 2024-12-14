import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatelessWidget {
  final User? user;

  AccountScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Information'),
        backgroundColor: const Color.fromARGB(200, 127, 65, 192),
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
                  Text('Name: ${user!.displayName ?? ''}'),
                  Text('Email: ${user!.email ?? ''}'),
                  Text('UID: ${user!.uid}'),
                ],
              )
            : Text('No user information available'),
      ),
    );
  }
}
