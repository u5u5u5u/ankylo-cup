import 'package:flutter/material.dart';

const brickColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
  Colors.brown,
  Colors.grey,
  Colors.black,
];

const gameWidth = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidth * 0.02;
const batWidth = gameWidth * 0.25;
const batHeight = ballRadius * 5;
const batStep = gameWidth * 0.05;
const brickRows = 5;
const brickColumns = 8;
const brickGutter = gameWidth * 0.015;
const brickWidth =
    (gameWidth - (brickGutter * (brickColumns + 1))) / brickColumns;
const brickHeight = gameHeight * 0.03;
var brickHealth = 10;
const difficultyModifier = 1.02;
