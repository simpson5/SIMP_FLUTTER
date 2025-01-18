import 'package:flutter/material.dart';
import 'package:simp_movie/models/movie_model.dart';
import 'package:simp_movie/service/movie_api_service.dart';
import 'package:simp_movie/widgets/movie_widget.dart';

// 홈 화면 클래스
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Future 선언으로 api 호출을 기다리는 객체 생성
  // 인기 영화 목록을 담을 변수
  Future<List<MovieModel>> popularMovies = MovieApiService().getPopularMovies();
  Future<List<MovieModel>> nowPlayingMovies =
      MovieApiService().getNowPlayingMovies();
  Future<List<MovieModel>> comingSoonMovies =
      MovieApiService().getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.yellow.shade300,
        title: Text(
          'SIMP MOVIE CINEMA',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // 세로 영역을 벗어나 ovreflow가 발생하여 스크롤 위젯 추가
      // 동시에 기존 Expanded 위젯에서 고정된 크기를 가진 SizedBox 위젯을 사용하여 크기를 고정
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 인기 영화 목록
            SizedBox(
              height: 250,
              child: FutureBuilder(
                // FutureBuilder : 비동기 함수를 기다리는 객체를 빌드하기 위한 위젯
                // future : 비동기 함수를 기다리는 객체
                // builder : 비동기 함수를 기다리고 UI를 빌드하기 위한 함수
                future: popularMovies, // 자동으로 await을 붙여준다.
                // context : 현재 위젯의 컨텍스트
                // snapshot : 비동기 함수를 기다리는 객체의 상태를 담은 객체
                builder: (context, snapshot) {
                  // 비동기 함수를 기다리는 객체의 상태가 완료된 경우
                  if (snapshot.hasData) {
                    return Column(children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Popular Movies",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      // hasSize 에러 : 제한 없는 크기의 위젯이 넘어 오면 발생 ???
                      // 리스트의 크기를 지정하지 않으면 발생한다.
                      // Expanded : child가 남은 크기를 꽉 채운다.
                      Expanded(
                        child:
                            makeMovieList(snapshot, 150, 200, false, "popular"),
                      ),
                    ]);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // 현재 상영 영화 목록
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Now in Cinema",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: makeMovieList(snapshot, null, 120, true, "now"),
                      ),
                    ]);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Coming Soon",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: makeMovieList(snapshot, null, 120, true, "soon"),
                      ),
                    ]);
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView makeMovieList(
    AsyncSnapshot<List<MovieModel>> snapshot,
    int? height,
    int? width,
    bool showTitle,
    String type,
  ) {
    // ListView : 리스트 형태로 위젯을 표시하기 위한 위젯
    // ListView.builder : ListView 보다 최적화가 잘됨 ???
    // separatorBuilder : 리스트 형태로 표시할 위젯 사이에 구분자를 생성하기 위한 함수
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      // scrollDirection : 스크롤 방향
      scrollDirection: Axis.horizontal,
      // itemCount : 리스트 형태로 표시할 위젯의 개수
      itemCount: snapshot.data!.length,
      // itemBuilder : 리스트 형태로 표시할 위젯을 생성하기 위한 함수
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          id: "${type}_${movie.id.toString()}",
          movieId: movie.id,
          title: movie.title,
          posterPath: movie.getPosterPath(),
          height: height,
          width: width,
          showTitle: showTitle,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 30);
      },
      // ListView 에서 사용한 구성 방식.
      // children: [
      //   // snapshot.data : future의 결과물
      //   // !를 붙이는 이유? 해당 객체가 null이 아님을 보장하기 위함
      //   // 반대로 ?의 경우 null일 수 있음을 보장하기 위함
      //   for (var movie in snapshot.data!) Text(movie.title),
      // ],
    );
  }
}
