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
  bool _isStand = false;

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
    _isStand = false;
  }

  void _hit() {
    setState(() {
      _playerHand.addCard(_deck.drawCard());
      if (_playerHand.isBusted) {
        _showResult('You Busted! Dealer Wins!');
      }
    });
  }

  Future<void> _stand() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _isStand = true;
    });
    while (_dealerHand.value < 17) {
      await Future.delayed(Duration(milliseconds: 750));
      setState(() {
        _dealerHand.addCard(_deck.drawCard());
      });
    }
    await Future.delayed(Duration(milliseconds: 750));
    if (_dealerHand.isBusted || _playerHand.value > _dealerHand.value) {
      _showResult('You Win!');
    } else if (_playerHand.value < _dealerHand.value) {
      _showResult('Dealer Wins!');
    } else {
      _showResult('It\'s a Tie!');
    }
  }

  void _showResult(String result) {
    showDialog(
      context: context,
      barrierDismissible: false,
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
            TextButton(
              child: Text('Back to Game Selection'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // ゲーム選択画面に戻る
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
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              'Dealer\'s Hand: ${_isStand ? _dealerHand.value : _dealerHand.cards.first.value}'),
          _dealerHand.isBusted ? Text('Busted!') : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _dealerHand.cards.asMap().entries.map((entry) {
              int idx = entry.key;
              var card = entry.value;
              if (!_isStand && idx == 1) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.fromLTRB(21, 12, 21, 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('?', style: TextStyle(fontSize: 24)),
                      Text('?', style: TextStyle(fontSize: 24)),
                    ],
                  ),
                );
              } else {
                return card.buildCard();
              }
            }).toList(),
          ),
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
