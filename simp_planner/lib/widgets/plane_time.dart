import 'package:flutter/material.dart';

class PlaneTime extends StatelessWidget {
  final String startHour;
  final String startMinute;
  final String endHour;
  final String endMinute;

  const PlaneTime({
    super.key,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 0,
      children: [
        Text(
          startHour,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0.8,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          startMinute,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 0.8,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 25,
          width: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          endHour,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0.8,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          endMinute,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 0.8,
          ),
        ),
      ],
    );
  }
}
