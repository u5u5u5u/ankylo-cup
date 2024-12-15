import 'package:flutter/material.dart';

class Card {
  final String suit;
  final String rank;
  final int value;

  Card(this.suit, this.rank, this.value);

  Widget buildCard() {
    return Container(
      margin: EdgeInsets.all(6.0), // マージンを大きくする
      padding: EdgeInsets.all(12.0), // パディングを大きくする
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(rank, style: TextStyle(fontSize: 24)), // フォントサイズを大きくする
          Text(suit, style: TextStyle(fontSize: 24)), // フォントサイズを大きくする
        ],
      ),
    );
  }
}
