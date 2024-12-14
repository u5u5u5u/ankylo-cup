import 'package:flutter/material.dart';

class Card {
  final String suit;
  final String rank;
  final int value;

  Card(this.suit, this.rank, this.value);

  Widget buildCard() {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(rank, style: TextStyle(fontSize: 24)),
          Text(suit, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
