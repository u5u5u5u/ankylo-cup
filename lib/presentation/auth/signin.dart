import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // FirebaseAuthインスタンスを取得
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // GoogleSignInインスタンスを取得
  // scopeにはAPIを通して操作できるユーザのリソースを指定する、以下のページを参照
  // https://developers.google.com/identity/protocols/oauth2/scopes?hl=ja#fcm
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    // 例えば、Google Calendarの情報を操作するには、ここに範囲を記載する
    // https://www.googleapis.com/auth/calendar.readonly,
    // https://www.googleapis.com/auth/calendar.events,
  ]);

  // ログインしたユーザー情報を保持する変数
  User? _user;

  // Googleサインインメソッド
  Future<User?> signInWithGoogle() async {
    try {
      print("Starting Google Sign-In process");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      print("Google User: $googleUser");

      if (googleUser == null) {
        print("Google Sign-In was canceled");
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print("Google Authentication: $googleAuth");

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      print("Firebase User: $user");
      setState(() {
        _user = user;
      });
      return user;
    } catch (e) {
      print("Error during Google Sign In: $e");
      return null;
    }
  }

  // サインアウトメソッド
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Google Sign In'),
      ),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: signInWithGoogle,
                child: Text('Sign in with Google'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Signed in as ${_user!.displayName}'),
                  Text('Email: ${_user!.email}'),
                  _user!.photoURL != null
                      ? Image.network(_user!.photoURL!)
                      : Container(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: signOut,
                    child: Text('Sign out'),
                  ),
                ],
              ),
      ),
    );
  }
}
