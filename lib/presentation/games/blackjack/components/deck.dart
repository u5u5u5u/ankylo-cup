import 'dart:math';
import 'package:ankylo_cup/presentation/games/blackjack/components/card.dart';

class Deck {
  final List<Card> _cards = [];

  Deck() {
    const suits = ['♠', '♥', '♦', '♣'];
    const ranks = [
      {'rank': 'A', 'value': 11},
      {'rank': '2', 'value': 2},
      {'rank': '3', 'value': 3},
      {'rank': '4', 'value': 4},
      {'rank': '5', 'value': 5},
      {'rank': '6', 'value': 6},
      {'rank': '7', 'value': 7},
      {'rank': '8', 'value': 8},
      {'rank': '9', 'value': 9},
      {'rank': '10', 'value': 10},
      {'rank': 'J', 'value': 10},
      {'rank': 'Q', 'value': 10},
      {'rank': 'K', 'value': 10},
    ];

    for (var suit in suits) {
      for (var rank in ranks) {
        _cards.add(Card(suit, rank['rank'] as String, rank['value'] as int));
      }
    }
  }

  void shuffle() {
    _cards.shuffle(Random());
  }

  Card drawCard() {
    return _cards.removeLast();
  }
}
