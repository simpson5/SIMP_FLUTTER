import 'package:flutter/material.dart';
import 'package:simp_pomodoro/screens/time_selector.dart';
import 'package:simp_pomodoro/screens/timer_card.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTime = 25; // 기본값 25분
  bool isRunning = false;
  bool isResting = false; // 휴식 시간 여부
  int round = 2;
  int goal = 4;
  late Timer timer;
  int totalSeconds = 0; // 남은 시간을 초 단위로 저장
  final int maxRound = 4; // 최대 라운드 수 추가
  final int maxGoal = 12; // 최대 목표 수 추가
  final int restTime = 5; // 휴식 시간 5분

  final int reduceTime = 150; // 감소시간

  // 초기화
  @override
  void initState() {
    super.initState();
    totalSeconds = selectedTime * 60;
  }

  // 타이머 종료
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // 시간 선택
  void onTimeSelected(int time) {
    setState(() {
      selectedTime = time;
      totalSeconds = time * 60;
    });
  }

  // 휴식 시간 시작
  void startRest() {
    setState(() {
      isResting = true;
      totalSeconds = restTime * 60;
      isRunning = false;
    });
    onPlayTap();
  }

  // 타이머 초기화
  void resetTimer() {
    setState(() {
      if (isResting) {
        isResting = false;
        totalSeconds = selectedTime * 60;
      } else {
        totalSeconds = selectedTime * 60;
      }
      isRunning = false;
    });
  }

  // 타이머 시작
  void onPlayTap() {
    setState(() {
      isRunning = !isRunning;
    });

    if (isRunning) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          setState(() {
            if (totalSeconds > 0) {
              totalSeconds -= reduceTime;
            } else {
              timer.cancel();
              isRunning = false;

              if (isResting) {
                // 휴식 시간이 끝나면
                resetTimer();
              } else {
                // 작업 시간이 끝나면
                if (round < maxRound) {
                  round++;
                  if (round == maxRound) {
                    goal++;
                    round = 0;
                  }
                  startRest(); // 휴식 시간 시작
                }
              }
            }
          });
        },
      );
    } else {
      timer.cancel();
    }
  }

  // 시간 포맷
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.inMinutes.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Flexible(
              flex: 3,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  timerCard(time: int.parse(format(totalSeconds))),
                  Text(
                    ":",
                    style: TextStyle(
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  timerCard(time: (totalSeconds % 60)),
                ],
              ),
            ),
            SizedBox(height: 30),
            // timer selector
            Flexible(
              flex: 3,
              child: Center(
                child: Opacity(
                  opacity: isResting ? 0.3 : 1.0, // 휴식 중일 때 흐리게
                  child: IgnorePointer(
                    ignoring: isResting, // 휴식 중일 때 터치 무시
                    child: ShaderMask(
                      // shaderCallback: 자식 위젯에 그라데이션 마스크 효과를 적용합니다
                      // - 투명 -> 흰색 -> 투명으로 가로 방향 그라데이션을 생성합니다
                      // - 시간 선택기 스크롤 뷰의 가장자리를 페이드 아웃하는 데 사용됩니다
                      // bounds: 그라데이션을 적용할 영역
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.2, 0.8, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            timeSelector(
                              time: 15,
                              isSelected: selectedTime == 15,
                              onSelect: () => onTimeSelected(15),
                            ),
                            timeSelector(
                              time: 20,
                              isSelected: selectedTime == 20,
                              onSelect: () => onTimeSelected(20),
                            ),
                            timeSelector(
                              time: 25,
                              isSelected: selectedTime == 25,
                              onSelect: () => onTimeSelected(25),
                            ),
                            timeSelector(
                              time: 30,
                              isSelected: selectedTime == 30,
                              onSelect: () => onTimeSelected(30),
                            ),
                            timeSelector(
                              time: 35,
                              isSelected: selectedTime == 35,
                              onSelect: () => onTimeSelected(35),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isResting)
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        height: 80,
                        width: 80,
                        child: Center(
                          child: Text(
                            'REST',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        height: 80,
                        width: 80,
                        child: IconButton(
                          iconSize: 40,
                          color: Theme.of(context).colorScheme.onPrimary,
                          onPressed: onPlayTap,
                          icon: isRunning
                              ? const Icon(Icons.pause)
                              : const Icon(Icons.play_arrow),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '$round/$maxRound',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'ROUND',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$goal/$maxGoal',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'GOAL',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
