import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class GameEngine extends Game with TapDetector {
  late Sprite pressedButton;
  late Sprite unpressedButton;
  final buttonPosition = Vector2(200, 120);
  final buttonSize = Vector2(120, 30);
  bool isPressed = false;

  late SpriteAnimation runningRobot;

  final robotPosition = Vector2(240, 50);
  final robotSize = Vector2(48, 60);

  @override
  void onTapDown(TapDownInfo event) {
    final buttonArea = buttonPosition & buttonSize;
    isPressed = buttonArea.contains(event.eventPosition.game.toOffset());
  }

  @override
  void onTapUp(TapUpInfo event) {
    isPressed = false;
  }

  @override
  void onTapCancel() {
    isPressed = false;
  }

  @override
  Future<void> onLoad() async {
    unpressedButton = await loadSprite(
      'button.png',
      srcPosition: Vector2.zero(), // this is zero by default
      srcSize: Vector2(60, 20),
    );

    pressedButton = await loadSprite(
      'button.png',
      srcPosition: Vector2(0, 20),
      srcSize: Vector2(60, 20),
    );
    runningRobot = await loadSpriteAnimation(
        'robot.png',
        SpriteAnimationData.sequenced(
            amount: 8, textureSize: Vector2(16, 18), stepTime: 0.1));
  }

  @override
  void update(double dt) {
    if (isPressed) {
      runningRobot.update(dt);
    }
  }

  @override
  void render(Canvas canvas) {
    runningRobot
        .getSprite()
        .render(canvas, position: robotPosition, size: robotSize);

    final button = isPressed ? pressedButton : unpressedButton;
    button.render(canvas, position: buttonPosition, size: buttonSize);
  }

  @override
  Color backgroundColor() => const Color(0xFF222222);
}
