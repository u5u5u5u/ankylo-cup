import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ankylo_cup/services/score_services.dart';
import 'package:ankylo_cup/proto/score.pb.dart';

class RankingScreen extends StatefulWidget {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  int _selectedGameId = 1;
  List<TopScoreEntry> _topScores = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTopScores();
  }

  Future<void> _fetchTopScores() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await ScoreService().getTop10ScoresByGame(_selectedGameId);
      setState(() {
        _topScores = response.scores;
      });
    } catch (e) {
      print('Failed to fetch top scores: $e');
      _generateDummyData();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 10', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<int>(
              value: _selectedGameId,
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Brick Breaker',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                DropdownMenuItem(
                    value: 2,
                    child: Text('Chinchiro',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                DropdownMenuItem(
                    value: 3,
                    child: Text('Hockey',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
                DropdownMenuItem(
                    value: 4,
                    child: Text('Blackjack',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
              ],
              dropdownColor: Theme.of(context).cardColor,
              onChanged: (value) {
                setState(() {
                  _selectedGameId = value!;
                  _fetchTopScores();
                });
              },
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Table(
                      defaultColumnWidth: IntrinsicColumnWidth(),
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('User ID',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Score',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        for (var scoreEntry in _topScores)
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(scoreEntry.userId,
                                    style: TextStyle(fontSize: 18)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(scoreEntry.score.toString(),
                                    style: TextStyle(fontSize: 18)),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _generateDummyData() {
    setState(() {
      _topScores = List.generate(10, (index) {
        return TopScoreEntry()
          ..userId = 'user$index'
          ..score = (10 - index) * Random(index).nextInt(100);
      });
      _isLoading = false;
      _topScores.sort((a, b) => b.score.compareTo(a.score));
    });
  }
}
