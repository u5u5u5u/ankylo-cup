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
const brickGutter = gameWidth * 0.015;
var brickWidth = 0.0;
const brickHeight = gameHeight * 0.03;
var brickHealth = 10;
const difficultyModifier = 1.0;
var stageNumber = 1;

const stage1 = [
  [0, 2, 1, 3, 3, 1, 2, 0],
  [1, 2, 3, 1, 1, 3, 2, 1],
  [1, 2, 1, 3, 3, 1, 2, 1],
  [1, 2, 3, 1, 1, 3, 2, 1],
  [0, 2, 1, 3, 3, 1, 2, 0]
];

const stage2 = [
  [1, 2, 2, 2, 2, 2, 2, 2, 1],
  [2, 0, 0, 3, 3, 3, 0, 0, 2],
  [1, 1, 1, 3, 3, 3, 1, 1, 1],
  [1, 1, 1, 3, 3, 3, 1, 1, 1],
  [1, 0, 0, 1, 1, 1, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1]
];

const stage3 = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
];
