import 'package:ankylo_cup/presentation/games/blackjack/components/card.dart';

class Hand {
  final List<Card> _cards = [];

  void addCard(Card card) {
    _cards.add(card);
  }

  int get value {
    int total = 0;
    int aces = 0;
    for (var card in _cards) {
      total += card.value;
      if (card.rank == 'A') {
        aces++;
      }
    }
    while (total > 21 && aces > 0) {
      total -= 10;
      aces--;
    }
    return total;
  }

  bool get isBusted => value > 21;

  List<Card> get cards => _cards;
}
