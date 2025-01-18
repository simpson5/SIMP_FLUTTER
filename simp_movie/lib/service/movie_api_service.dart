import 'dart:convert';
// http 패키지를 사용하기 위해 임포트
// pub.dev 에서 http 패키지 검색후 pubspec.yaml 에 의존성(dependencies) 추가로 설치 가능함
import 'package:http/http.dart' as http;
import 'package:simp_movie/models/movie_model.dart';
import 'package:simp_movie/models/movie_detail_model.dart';

// 영화 api 서비스 클래스
class MovieApiService {
  // 기본 url
  final String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  // 인기 영화 url
  final String popular = 'popular';
  // 현재 상영 영화 url
  final String nowPlaying = 'now-playing';
  // 개봉 예정 영화 url
  final String comingSoon = 'coming-soon';
  // 영화 상세 정보 url
  final String movie = 'movie';

  // Future : api의 데이터를 가져오기 위해 기다리는게 가능한 객체?
  // async : 비동기 함수를 선언하기 위한 키워드
  Future<List<MovieModel>> getPopularMovies() async {
    // http 호출 요청을 위한 url 생성
    final url = Uri.parse('$baseUrl/$popular');
    // print(url);
    // 영화 목록을 담을 리스트 생성
    List<MovieModel> movies = [];
    // http 호출 요청
    // await : 비동기 함수를 기다리기 위한 키워드
    final response = await http.get(url);
    // 응답 코드가 200인 경우
    if (response.statusCode == 200) {
      // 응답 데이터를 json 형식으로 디코딩
      final data = jsonDecode(response.body);
      // print(data);
      // 응답 데이터에서 results 키의 값을 추출
      final List<dynamic> dataList = data['results'];
      // results 키의 값을 반복하여 MovieModel 객체로 변환
      for (var movie in dataList) {
        MovieModel movieModel = MovieModel.fromJson(movie);
        // print(movieModel.title);
        movies.add(movieModel);
      }
      return movies;
    }
    // 응답 코드가 200이 아닌 경우 예외 발생
    throw Exception('Failed to load data : call popular api');
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> dataList = data['results'];
      return dataList.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    throw Exception('Failed to load data : call now playing api');
  }

  Future<List<MovieModel>> getComingSoonMovies() async {
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> dataList = data['results'];
      return dataList.map((movie) => MovieModel.fromJson(movie)).toList();
    }
    throw Exception('Failed to load data : call coming soon api');
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    final url = Uri.parse('$baseUrl/$movie?id=$id');
    print(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MovieDetailModel.fromJson(data);
    }
    throw Exception('Failed to load data : call movie detail api');
  }
}
