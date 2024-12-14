//import 'package:ankylo_cup/presentation/home/home_screen.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/widgets/game_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart'; // Add this line
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:ankylo_cup/presentation/page/title/title_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  // );

  runApp(ProviderScope(child: MiniGamesApp()));
}

class MiniGamesApp extends StatelessWidget {
  const MiniGamesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Games App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TitleScreen(),
    );
  }
}
