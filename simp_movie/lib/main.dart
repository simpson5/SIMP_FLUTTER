import 'package:flutter/material.dart';
import 'package:simp_movie/screens/home_screen.dart';
import 'package:simp_movie/service/movie_api_service.dart';

void main() {
  MovieApiService().getPopularMovies();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
