import 'package:ankylo_cup/presentation/games/brick-breaker/brick_breaker.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/ball.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/components/bat.dart';
import 'package:ankylo_cup/presentation/games/brick-breaker/config.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Brick extends RectangleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {
  int health;
  int maxhealth;
  late TextComponent healthText;

  Brick(
      {required super.position,
      required Color color,
      required this.health,
      required this.maxhealth})
      : super(
          size: Vector2(brickWidth, brickHeight),
          anchor: Anchor.center,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
          children: [RectangleHitbox()],
        ) {
    healthText = TextComponent(
      text: health.toString(),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      anchor: Anchor.center,
      position: Vector2(brickWidth / 2, brickHeight / 2),
    );
    add(healthText);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    health -= 10;
    healthText.text = health.toString();
    if (health <= 0) {
      game.score.value += maxhealth ~/ 3;
      removeFromParent();
    }
    game.score.value++;

    if (game.world.children.query<Brick>().length == 1) {
      game.playState = PlayState.won;
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}

class DoubleScoreBrick extends Brick {
  DoubleScoreBrick({required super.position, required super.color})
      : super(
          health: brickHealth,
          maxhealth: brickHealth,
        );

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    health -= 10;
    healthText.text = health.toString();
    if (health <= 0) {
      game.score.value += maxhealth ~/ 1.5;
      removeFromParent();
    }
    game.score.value += 2;
  }
}

class TripleHealthBrick extends Brick {
  TripleHealthBrick({required super.position, required super.color})
      : super(
          health: brickHealth * 3, // 体力を3倍に設定
          maxhealth: brickHealth * 3,
        );
}
