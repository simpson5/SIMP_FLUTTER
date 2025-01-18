import 'package:flutter/material.dart';
import 'package:simp_movie/models/movie_detail_model.dart';
import 'package:simp_movie/service/movie_api_service.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final int movieId;
  final String title;
  final String posterPath;

  const DetailScreen({
    super.key,
    required this.id,
    required this.movieId,
    required this.title,
    required this.posterPath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // StatelessWidget에서는 프로퍼티를 초기화 할때 다른 프로퍼티에 접근이 불가능하다!
  // StatefulWidget 사용 하고 late 사용하여 다른 프로퍼티 접근 가능 ???
  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = MovieApiService().getMovieDetail(widget.movieId);
    print(movieDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar 제거 -> 이전 화면으로 돌아가는 기능은 GestureDetector를 통해 구현
      // appBar: AppBar(
      //   elevation: 2,
      //   backgroundColor: Colors.yellow.shade300,
      //   title: Text(
      //     'SIMP MOVIE CINEMA',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 20,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.id,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  widget.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 150),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: FutureBuilder(
                    future: movieDetail,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 영화 제목
                            Text(
                              snapshot.data?.title ?? '',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // 영화 평점
                            Text(
                              '( ${snapshot.data?.voteAverage.toString() ?? ' '} )',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // 러닝 타임 || 장르
                            Text(
                              '${snapshot.data?.runtime.toString() ?? ' '} | ${snapshot.data?.genres.map((e) => e.name).join(', ') ?? ' '}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            // 줄거리
                            Text(
                              snapshot.data?.overview ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }
                      return Text('Loading...');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
