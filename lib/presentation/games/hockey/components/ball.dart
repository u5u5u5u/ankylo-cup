import 'package:ankylo_cup/presentation/games/hockey/components/bat.dart';
import 'package:ankylo_cup/presentation/games/hockey/components/bat2.dart';
import 'package:ankylo_cup/presentation/games/hockey/components/play_area.dart';
import 'package:ankylo_cup/presentation/games/hockey/config.dart';
import 'package:ankylo_cup/presentation/games/hockey/hockey.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<Hockey> {
  Ball({
    required this.velocity,
    required super.position,
    required double radius,
    required this.difficultyModifier,
    required this.ballSpeed,
  }) : super(
            radius: radius,
            anchor: Anchor.center,
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  final Vector2 velocity;
  final double difficultyModifier;
  double ballSpeed;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    // Check for collisions with the PlayArea boundaries
    if (position.y <= 0) {
      add(RemoveEffect(
          delay: 0.35,
          onComplete: () {
            if (game.lifeRemain.value >= 2) {
              game.lifeRemain.value--;
              game.putBall();
            } else {
              game.lifeRemain.value--;
              game.playState = PlayState.gameOver;
            }
          }));
    } else if (position.x <= 0) {
      velocity.x = -velocity.x;
      position.x = 0; // Prevent ball from going out of bounds
    } else if (position.x >= game.width) {
      velocity.x = -velocity.x;
      position.x = game.width; // Prevent ball from going out of bounds
    } else if (position.y >= game.height) {
      add(RemoveEffect(
          delay: 0.35,
          onComplete: () {
            if (game.lifeRemain.value >= 2) {
              game.lifeRemain.value--;
              game.putBall();
            } else {
              game.lifeRemain.value--;
              game.playState = PlayState.gameOver;
            }
          }));
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Bat || other is Bat2) {
      game.score.value += (10 * ballSpeed).toInt();
      ballSpeed =
          (ballSpeed * difficultyModifier).clamp(1.0, maxSpeedMultiplier);
      velocity.y = -velocity.y;
      velocity.x = velocity.x +
          (position.x - other.position.x) / other.size.x * game.width;
    }
  }
}
