import 'package:flutter/material.dart';
import 'package:simp_planner/widgets/plane_time.dart';

class Meeting extends StatelessWidget {
  final Color color;

  final String startHour;
  final String startMinute;
  final String endHour;
  final String endMinute;
  final String title1;
  final String title2;

  final List<String> participants;

  const Meeting({
    super.key,
    required this.color,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.title1,
    required this.title2,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 170,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlaneTime(
                startHour: startHour,
                startMinute: startMinute,
                endHour: endHour,
                endMinute: endMinute,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 0,
                children: [
                  Text(
                    title1,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      height: 0.8,
                    ),
                  ),
                  Text(
                    title2,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      height: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 45,
            ),
            child: Row(
              children: [
                Text(participants[0],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                      color: participants[0] == 'ME'
                          ? Colors.black
                          : Colors.black54,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(participants[1],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                      color: Colors.black54,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(participants[2],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                      color: Colors.black54,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  participants.length > 3 ? '+${participants.length - 3}' : '',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 0.8,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
