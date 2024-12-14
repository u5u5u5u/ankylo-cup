import 'package:flutter/material.dart';
import 'package:ankylo_cup/presentation/games/blackjack/components/deck.dart';
import 'package:ankylo_cup/presentation/games/blackjack/components/hand.dart';

class BlackjackScreen extends StatefulWidget {
  @override
  _BlackjackScreenState createState() => _BlackjackScreenState();
}

class _BlackjackScreenState extends State<BlackjackScreen> {
  late Deck _deck;
  late Hand _playerHand;
  late Hand _dealerHand;

  @override
  void initState() {
    super.initState();
    _deck = Deck();
    _playerHand = Hand();
    _dealerHand = Hand();
    _startGame();
  }

  void _startGame() {
    _deck.shuffle();
    _playerHand.addCard(_deck.drawCard());
    _playerHand.addCard(_deck.drawCard());
    _dealerHand.addCard(_deck.drawCard());
    _dealerHand.addCard(_deck.drawCard());
  }

  void _hit() {
    setState(() {
      _playerHand.addCard(_deck.drawCard());
      if (_playerHand.isBusted) {
        _showResult('You Busted! Dealer Wins!');
      }
    });
  }

  void _stand() {
    setState(() {
      while (_dealerHand.value < 17) {
        _dealerHand.addCard(_deck.drawCard());
      }
      if (_dealerHand.isBusted || _playerHand.value > _dealerHand.value) {
        _showResult('You Win!');
      } else if (_playerHand.value < _dealerHand.value) {
        _showResult('Dealer Wins!');
      } else {
        _showResult('It\'s a Tie!');
      }
    });
  }

  void _showResult(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(result),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _deck = Deck();
                  _playerHand = Hand();
                  _dealerHand = Hand();
                  _startGame();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blackjack'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Dealer\'s Hand: ${_dealerHand.value}'),
          _dealerHand.isBusted ? Text('Busted!') : Container(),
          _dealerHand.isBusted
              ? Container()
              : _dealerHand.cards.first.buildCard(),
          _dealerHand.isBusted
              ? Container()
              : _dealerHand.cards.last.buildCard(),
          SizedBox(height: 20),
          Text('Your Hand: ${_playerHand.value}'),
          _playerHand.isBusted ? Text('Busted!') : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                _playerHand.cards.map((card) => card.buildCard()).toList(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _hit,
                child: Text('Hit'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _stand,
                child: Text('Stand'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
