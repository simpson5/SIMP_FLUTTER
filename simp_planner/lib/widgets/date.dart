import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  final DateTime date;

  const Date({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatDate(date),
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                'TODAY',
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.circle,
                color: Color.fromRGBO(255, 0, 180, 0.5),
                size: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 1))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 2))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 3))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 4))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 5))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 6))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                DateFormat('d').format(date.add(const Duration(days: 7))),
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String formatDate(DateTime date) {
  final dayName = DateFormat('EEEE').format(date).toUpperCase();
  final day = DateFormat('d').format(date);
  return '$dayName $day';
}
