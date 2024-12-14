import 'dart:async';
import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Add this import

import '../components/components.dart';
import 'config.dart';

enum PlayState { welcome, playing, gameOver, won }

class BrickBreaker extends FlameGame
    with HasCollisionDetection, KeyboardEvents, TapDetector {
  BrickBreaker()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final ValueNotifier<int> score = ValueNotifier(0);
  final rand = math.Random();
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
      case PlayState.won:
        overlays.add(playState.name);
      case PlayState.playing:
        overlays.remove(PlayState.welcome.name);
        overlays.remove(PlayState.gameOver.name);
        overlays.remove(PlayState.won.name);
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());

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
      }
    });
  }

  void startGame() {
    if (playState == PlayState.playing) return;

    world.removeAll(world.children.query<Ball>());
    world.removeAll(world.children.query<Bat>());
    world.removeAll(world.children.query<Brick>());

    playState = PlayState.playing;
    score.value = 0;
    brickHealth = 10;

    world.add(Ball(
        difficultyModifier: difficultyModifier,
        radius: ballRadius,
        position: size / 2,
        velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2)
            .normalized()
          ..scale(height / 3)));

    world.add(Bat(
        size: Vector2(batWidth, batHeight),
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95)));

    for (var i = brickRows; i >= 1; i--) {
      for (var j = 0; j < brickColumns; j++) {
        world.add(Brick(
          position: Vector2(
            (j + 0.5) * brickWidth + (j + 1) * brickGutter,
            (i + 2.0) * brickHeight + i * brickGutter,
          ),
          color: brickColors[9],
          health: brickHealth,
          maxhealth: brickHealth,
        ));
      }
      brickHealth = (brickHealth * 1.3).toInt();
    }
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
  Color backgroundColor() => const Color(0xfff2e8cf);
}
