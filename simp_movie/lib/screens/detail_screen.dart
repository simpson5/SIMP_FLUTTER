import 'package:flutter/material.dart';
import 'package:simp_movie/models/movie_detail_model.dart';
import 'package:simp_movie/service/movie_api_service.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Color textColor = Colors.white;
  Color backgroundColor = Colors.black.withAlpha(200);
  Color overviewBackgroundColor = Colors.white.withAlpha(100);
  bool isPurchased = false;
  late SharedPreferences prefs;

  // SharedPreferences 초기화
  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final purchsedMovies = prefs.getStringList("purchsedMovies");
    print(purchsedMovies);
    if (purchsedMovies != null) {
      if (purchsedMovies.contains(widget.movieId.toString()) == true) {
        isPurchased = true;
      }
    } else {
      await prefs.setStringList("purchsedMovies", []);
    }
  }

  @override
  void initState() {
    super.initState();
    movieDetail = MovieApiService().getMovieDetail(widget.movieId);
    print(movieDetail);
    initPrefs();
    updateTextColor();
  }

  void updatePrefs() async {
    final purchasedMovies = prefs.getStringList("purchsedMovies");
    if (isPurchased) {
      purchasedMovies?.add(widget.movieId.toString());
    } else {
      purchasedMovies?.remove(widget.movieId.toString());
    }
    print(purchasedMovies);
    await prefs.setStringList("purchsedMovies", purchasedMovies!);
  }

  // 팔레트 생성기 : 배경 이미지의 톤에 따라 글자 색 변경
  Future<void> updateTextColor() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.posterPath),
    );

    if (paletteGenerator.dominantColor != null) {
      // 배경색이 밝은지 어두운지 확인하여 배경및 텍스트 색상 변경
      final isDark =
          paletteGenerator.dominantColor!.color.computeLuminance() < 0.5;
      print(isDark);
      setState(() {
        textColor = isDark ? Colors.white : Colors.black;
        backgroundColor = isDark ? Colors.black.withAlpha(200) : Colors.white;
        overviewBackgroundColor =
            isDark ? Colors.black.withAlpha(100) : Colors.white.withAlpha(100);
      });
    }
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
            // 검은색 그라데이션 오버레이
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    backgroundColor,
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 200),
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
                                color: textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            // 영화 평점
                            Text(
                              '${voteAverageToStar(snapshot.data?.voteAverage ?? 0)} ( ${twoDecimal(snapshot.data?.voteAverage ?? 0)} )',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.yellow.shade300,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            // 러닝 타임 || 장르
                            Text(
                              '${chageRuntimeToHour(snapshot.data?.runtime ?? 0)} | ${snapshot.data?.genres.map((e) => e.name).join(', ') ?? ' '}',
                              style: TextStyle(
                                fontSize: 18,
                                color: textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            // 줄거리
                            Container(
                              height: 150, // 고정 높이 설정
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: overviewBackgroundColor,
                              ),
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Text(
                                  snapshot.data?.overview ?? '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // AlertDialog로 구매 확인 팝업 표시
                                  clickButton(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow.shade300,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  isPurchased ? 'Purchased' : 'Buy Ticket',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
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

  // 티켓 구매 팝업
  Future<dynamic> clickButton(BuildContext context) {
    isPurchased = !isPurchased;
    print(isPurchased);
    updatePrefs();
    setState(() {});
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // AlertDialog : 팝업 표시를 위한 위젯
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Text(
            isPurchased
                ? 'Successfully purchased tickets!'
                : 'Please purchase tickets!',
          ),
        );
      },
    );
  }
}

String voteAverageToStar(double voteAverage) {
  int maxStarCount = 5;
  int starCount = (voteAverage / 2).toInt();
  return '★' * starCount + '☆' * (maxStarCount - starCount);
}

String chageRuntimeToHour(int runtime) {
  return '${runtime ~/ 60}hour ${runtime % 60}min';
}

double twoDecimal(double voteAverage) {
  return double.parse(voteAverage.toStringAsFixed(2));
}
