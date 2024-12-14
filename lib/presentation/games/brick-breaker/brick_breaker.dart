import 'dart:async';
import 'dart:math' as math;
import 'package:ankylo_cup/presentation/games/brick-breaker/components/ball.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/bat.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/brick.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/play_area.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Add this import

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

  void stageCreate(int stage) {
    world.removeAll(world.children.query<Brick>());
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
    if (stage == 1) {
      brickWidth = (gameWidth - (brickGutter * (stage1[0].length + 1))) /
          stage1[0].length;
      for (var i = stage1.length - 1; i >= 0; i--) {
        for (var j = 0; j < stage1[i].length; j++) {
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
    } else if (stage == 2) {
      brickWidth = (gameWidth - (brickGutter * (stage2[0].length + 1))) /
          stage2[0].length;
      for (var i = stage2.length - 1; i >= 0; i--) {
        for (var j = 0; j < stage2[i].length; j++) {
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
    } else if (stage == 3) {
      brickWidth = (gameWidth - (brickGutter * (stage3[0].length + 1))) /
          stage3[0].length;
      for (var i = stage3.length - 1; i >= 0; i--) {
        for (var j = 0; j < stage3[i].length; j++) {
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
  }

  void startGame() {
    if (playState == PlayState.playing) return;

    world.removeAll(world.children.query<Ball>());
    world.removeAll(world.children.query<Bat>());
    world.removeAll(world.children.query<Brick>());

    playState = PlayState.playing;
    score.value = 0;
    brickHealth = 10;
    stageNumber = 1;

    stageCreate(stageNumber);
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
