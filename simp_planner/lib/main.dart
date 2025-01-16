import 'package:flutter/material.dart';
import 'package:simp_planner/widgets/date.dart';
import 'package:simp_planner/widgets/meeting.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image(
                          image: AssetImage('lib/img/simpson.jpg'),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Date(date: DateTime.now()),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Meeting(
                      color: Color.fromARGB(255, 231, 226, 61),
                      startHour: '12',
                      startMinute: '30',
                      endHour: '12',
                      endMinute: '20',
                      title1: 'DESIGN',
                      title2: 'MEETING',
                      participants: ['ALEX', 'HELENA', 'NANA'],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Meeting(
                      color: Color.fromARGB(255, 185, 65, 225),
                      startHour: '12',
                      startMinute: '35',
                      endHour: '14',
                      endMinute: '10',
                      title1: 'DAILY',
                      title2: 'PROJECT',
                      participants: [
                        'ME',
                        'RECHARD',
                        'CIRY',
                        'JACK',
                        'JASON',
                        'JACK',
                        'HOLLY',
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Meeting(
                      color: Color.fromARGB(255, 152, 230, 126),
                      startHour: '15',
                      startMinute: '00',
                      endHour: '16',
                      endMinute: '30',
                      title1: 'WEEKLY',
                      title2: 'PLANNING',
                      participants: ['DEN', 'NANA', 'MARK'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
