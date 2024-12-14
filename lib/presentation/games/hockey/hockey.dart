import 'dart:async';
import 'dart:math' as math;

import 'package:ankylo_cup/presentation/games/hockey/components/ball.dart';
import 'package:ankylo_cup/presentation/games/hockey/components/bat.dart';
import 'package:ankylo_cup/presentation/games/hockey/components/bat2.dart';
import 'package:ankylo_cup/presentation/games/hockey/components/play_area.dart';
import 'package:ankylo_cup/presentation/games/hockey/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Add this import

enum PlayState { welcome, playing, gameOver }

class Hockey extends FlameGame with HasCollisionDetection, TapDetector {
  Hockey()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final ValueNotifier<int> score = ValueNotifier(0);
  final ValueNotifier<int> lifeRemain = ValueNotifier(life);
  final rand = math.Random();
  double ballSpeed = 1.0;
  double get width => size.x;
  double get height => size.y;

  late PlayState _playState;
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  PlayState get playState => _playState;

  set playState(PlayState playState) {
    _playState = playState;
    switch (playState) {
      case PlayState.welcome:
      case PlayState.gameOver:
        overlays.add(playState.name);
      case PlayState.playing:
        overlays.remove(PlayState.welcome.name);
        overlays.remove(PlayState.gameOver.name);
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea()); // 修正

    playState = PlayState.welcome;
    _accelerometerSubscription = accelerometerEventStream(
      samplingPeriod: SensorInterval.gameInterval,
    ).listen((event) {
      if (playState == PlayState.playing) {
        final bats = world.children.query<Bat>();
        if (bats.isNotEmpty) {
          final bat = bats.first;
          final tilt = event.x;
          final newX = (bat.position.x - tilt * 5)
              .clamp(batWidth / 2, width - batWidth / 2);
          bat.position = Vector2(newX.toDouble(), bat.position.y);
        }
        final bats2 = world.children.query<Bat2>();
        if (bats2.isNotEmpty) {
          final bat2 = bats2.first;
          final tilt2 = event.y - 0.1;
          final newX2 = (bat2.position.x - tilt2 * 5)
              .clamp(batWidth / 2, width - batWidth / 2);
          bat2.position = Vector2(newX2.toDouble(), bat2.position.y);
        }
      }
    });
  }

  void startGame() {
    if (playState == PlayState.playing) return;

    world.removeAll(world.children.query<Ball>());
    world.removeAll(world.children.query<Bat>());
    world.removeAll(world.children.query<Bat2>());

    playState = PlayState.playing;
    score.value = 0;
    lifeRemain.value = life;

    world.add(Ball(
        difficultyModifier: difficultyModifier,
        radius: ballRadius,
        position: size / 2,
        velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2)
            .normalized()
          ..scale(height / 3),
        ballSpeed: ballSpeed));

    world.add(Bat(
        size: Vector2(batWidth, batHeight),
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95)));

    world.add(Bat2(
        size: Vector2(batWidth, batHeight),
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.05)));
  }

  Future<void> putBall() async {
    await Future.delayed(const Duration(seconds: 3));
    world.add(Ball(
        difficultyModifier: difficultyModifier,
        radius: ballRadius,
        position: size / 2,
        velocity: Vector2((rand.nextDouble() - 0.5) * width,
                (rand.nextBool() ? 1 : -1) * height * 0.2)
            .normalized()
          ..scale(height / 2),
        ballSpeed: ballSpeed)
      ..ballSpeed = 1.0 + (ballSpeed - 1.0) * 0.7);
  }

  @override
  void onTap() {
    super.onTap();
    startGame();
  }

  @override
  void onRemove() {
    // Cancel accelerometer subscription
    _accelerometerSubscription.cancel();
    super.onRemove();
  }

  @override
  Color backgroundColor() => const Color.fromARGB(255, 196, 255, 196);
}
