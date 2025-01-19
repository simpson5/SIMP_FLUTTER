import 'package:flutter/material.dart';
import 'package:simp_movie/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String id;
  final int movieId;
  final String title;
  final String posterPath;
  final int? height;
  final int? width;
  final bool showTitle;

  const Movie({
    super.key,
    required this.id,
    required this.movieId,
    required this.title,
    required this.posterPath,
    this.height,
    this.width,
    this.showTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector : 동작을 감지하는 위젯
    return GestureDetector(
      onTap: () {
        print("id : $id");
        // Navigator.push : 화면 이동
        Navigator.push(
            context,
            // MaterialPageRoute : 화면 이동 위젯
            MaterialPageRoute(
              // builder : 화면 이동 위젯 빌드 ???
              builder: (context) => DetailScreen(
                id: id,
                movieId: movieId,
                title: title,
                posterPath: posterPath,
              ),
              fullscreenDialog: true,
            ));
      },
      child: Column(children: [
        // Hero : 화면 전환 시 애니메이션 효과를 주는 위젯
        // tag를 통해 위젯 추적?
        Hero(
          // TODO : container을 쓰려고 하는데 계속 sziedBox를 권장한다??
          // DecoratedBox을 추가하니 다시 Container로 변경
          // 둘의 차이는 ?
          tag: id,
          child: Container(
            height: height?.toDouble(),
            width: width != null ? width!.toDouble() : 150,
            // clipBehavior : 자식이 부모 영역 침범을 제어하는 속성
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
              // boxShadow : 그림자 효과
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0, 5),
                    // withOpacity is deprecated 로 인해 widthValues를 사용
                    color: Colors.black.withValues(alpha: 0.5)),
              ],
            ),
            // Image.network : 웹 이미지를 표시하기 위한 위젯, url이 필요
            child: Image.network(
              posterPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (showTitle) SizedBox(height: 10),
        if (showTitle)
          SizedBox(
            width: 120,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ]),
    );
  }
}
