import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    super.key,
    required this.score,
    required this.lifeRemain,
  });

  final ValueNotifier<int> score;
  final ValueNotifier<int> lifeRemain;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: score,
          builder: (context, score, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Text(
                'Score: $score'.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize! *
                              0.8,
                      color: Color.fromARGB(255, 230, 178, 236),
                    ),
              ),
            );
          },
        ),
        const Text('/', style: TextStyle(color: Color.fromARGB(255, 230, 178, 236))),
        ValueListenableBuilder<int>(
          valueListenable: lifeRemain,
          builder: (context, lifeRemain, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Text(
                'Life $lifeRemain'.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize! *
                              0.8,
                      color: Color.fromARGB(255, 230, 178, 236),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
