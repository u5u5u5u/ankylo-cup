import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    super.key,
    required this.score,
  });

  final ValueNotifier<int> score;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: score,
      builder: (context, score, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 18),
          child: Text(
            'Score: $score'.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 230, 178, 236),
            ),
          ),
        );
      },
    );
  }
}
