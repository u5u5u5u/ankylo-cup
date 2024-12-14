import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ankylo_cup/presentation/page/select_mode/select_mode_screen.dart'; // Add this import

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return; // サインインがキャンセルされた場合
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    setState(() {
      _user = userCredential.user;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SelectModeScreen()),
    );
    // Once signed in, return the UserCredential
    UserCredential userCredential = await _auth.signInWithCredential(credential);

    // JWT トークンを取得して print
    final idToken = await userCredential.user?.getIdToken();
    final accessToken = await userCredential.user?.getIdToken();
    print('ID Token: $idToken');
    print('Access Token: $accessToken');
    return userCredential;
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
      body: Center(
          child: ElevatedButton(
        onPressed: signInWithGoogle,
        child: Text('Sign in with Google'),
      )),
    );
  }
}
