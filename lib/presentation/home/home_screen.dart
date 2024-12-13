import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ankylo_cup/presentation/auth/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Auth()),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            // 背景の動的グラデーションアニメーション
            const AnimatedGradientBackground(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // アプリ名のフェードインとスライドアニメーション
                  const Text(
                    'Mini Game Collection',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 2.seconds)
                      .then()
                      .slideY(begin: -0.3, end: 0.0)
                      .scaleXY(begin: 0.8, end: 1.0),
                  const SizedBox(height: 50),
                  // "Tap to Start" の滑らかな波アニメーション
                  const Text(
                    'Tap to Start',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                      letterSpacing: 2,
                    ),
                  )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .moveY(
                        duration: 1.seconds,
                        begin: -15,
                        end: 15,
                        curve: Curves.easeInOut,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key});

  @override
  _AnimatedGradientBackgroundState createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Color> _colors;
  late Alignment _begin;
  late Alignment _end;

  @override
  void initState() {
    super.initState();

    _colors = [Colors.deepPurple, Colors.indigo, Colors.black];
    _begin = Alignment.topLeft;
    _end = Alignment.bottomRight;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )
      ..addListener(() {
        setState(() {
          // アニメーションに合わせてグラデーションの変更
          double progress = _controller.value;
          if (progress < 0.5) {
            _colors = [Colors.deepPurple, Colors.indigo, Colors.black];
            _begin = Alignment.topLeft;
            _end = Alignment.bottomRight;
          } else {
            _colors = [Colors.purple, Colors.blue, Colors.black];
            _begin = Alignment.bottomRight;
            _end = Alignment.topLeft;
          }
        });
      })
      ..repeat(reverse: true); // アニメーションを繰り返す

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // コントローラーの破棄
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(seconds: 1),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _colors,
              begin: _begin,
              end: _end,
            ),
          ),
        );
      },
    );
  }
}
