import 'package:ankylo_cup/presentation/games/brick-breaker/brick_breaker.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/bat.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/brick.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/play_area.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  Ball({
    required this.velocity,
    required super.position,
    required double radius,
    required this.difficultyModifier,
  }) : super(
            radius: radius,
            anchor: Anchor.center,
            paint: Paint()
              ..color = const Color(0xff1e6091)
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  final Vector2 velocity;
  final double difficultyModifier;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    // Check for collisions with the PlayArea boundaries
    if (position.y <= 0) {
      velocity.y = -velocity.y;
      position.y = 0; // Prevent ball from going out of bounds
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
            game.playState = PlayState.gameOver;
          }));
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Bat) {
      velocity.y = -velocity.y;
      velocity.x = velocity.x +
          (position.x - other.position.x) / other.size.x * game.width;
    } else if (other is Brick) {
      if (position.y < other.position.y - other.size.y / 2) {
        velocity.y = -velocity.y;
      } else if (position.y > other.position.y + other.size.y / 2) {
        velocity.y = -velocity.y;
      } else if (position.x < other.position.x) {
        velocity.x = -velocity.x;
      } else if (position.x > other.position.x) {
        velocity.x = -velocity.x;
      }
      velocity.setFrom(velocity * difficultyModifier);
    }
  }
}
