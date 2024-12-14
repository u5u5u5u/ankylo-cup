import 'package:ankylo_cup/services/user_services.dart';
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
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Check if the user already exists
    bool userExists = await checkUserExists(credential);
    await UserService().createUser();
    if (userExists) {
      // Sign in the existing user
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      // Sign up the new user
      
      return await signUpWithGoogle(credential);
    }
  }

  Future<bool> checkUserExists(AuthCredential credential) async {
    try {
      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return authResult.user != null;
    } catch (e) {
      // If sign in fails, it means the user does not exist
      return false;
    }
  }

  Future<UserCredential> signUpWithGoogle(AuthCredential credential) async {
    // Sign up the new user
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // Create a new user in the database
    await UserService().createUser();
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
        onTap: signInWithGoogle,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).primaryColor, width: 1),
          borderRadius: BorderRadius.circular(20), // Set border radius here
            ),
            color: Theme.of(context).cardColor,
            child: Center(
            child: Text(
          'Sign in with Google',
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).primaryColor),
            )),
          ),
        ),
          ),
        ]),
      ),
    );
  }
}
