import 'package:flutter/material.dart';

class timeSelector extends StatelessWidget {
  final int time;
  final bool isSelected;
  final VoidCallback onSelect;

  const timeSelector({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
          ),
        ),
        height: 40,
        width: 50,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            time.toString(),
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
