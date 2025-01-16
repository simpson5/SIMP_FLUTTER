import 'package:flutter/material.dart';

class timerCard extends StatelessWidget {
  final int time;

  const timerCard({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6),
              ),
              height: 160,
              width: 110,
            ),
          ),
          Positioned(
            top: -5,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              ),
              height: 160,
              width: 120,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            height: 160,
            width: 130,
            child: Center(
              child: Text(
                time.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 70,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
