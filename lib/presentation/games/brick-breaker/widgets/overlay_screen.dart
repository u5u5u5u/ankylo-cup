import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ankylo_cup/theme/app_theme.dart';

class OverlayScreen extends StatelessWidget {
  const OverlayScreen({
    super.key,
    required this.title,
    required this.subtitle,
    this.showExitButton = false,
    this.onAgainPressed,
    this.onExitPressed,
  });

  final String title;
  final String subtitle;
  final bool showExitButton;
  final VoidCallback? onAgainPressed;
  final VoidCallback? onExitPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ).animate().slideY(duration: 750.ms, begin: -3, end: 0),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headlineSmall,
          )
              .animate(onPlay: (controller) => controller.repeat())
              .fadeIn(duration: 1.seconds)
              .then()
              .fadeOut(duration: 1.seconds),
          if (showExitButton) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onAgainPressed,
                  child: const Text('again', style: TextStyle(fontSize: 32)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 24),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onExitPressed,
                  child: const Text('exit', style: TextStyle(fontSize: 32)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 24),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
