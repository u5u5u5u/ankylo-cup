import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント情報'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ユーザー名: John Doe',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'メールアドレス: john.doe@example.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ログアウト処理をここに追加
                Navigator.of(context).pop();
              },
              child: Text('ログアウト'),
            ),
          ],
        ),
      ),
    );
  }
}