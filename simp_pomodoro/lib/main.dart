import 'package:flutter/material.dart';
import 'package:simp_pomodoro/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
        colorScheme: ColorScheme(
          surface: const Color.fromARGB(255, 222, 55, 69),
          brightness: Brightness.light,
          onSurface: const Color.fromARGB(255, 222, 55, 69),
          primary: const Color.fromARGB(255, 222, 55, 69),
          onPrimary: Colors.white,
          secondary: const Color.fromARGB(255, 179, 8, 22),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
