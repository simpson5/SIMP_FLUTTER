import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/home_screen.dart';
import 'package:twitter_clone/constants/sizes.dart';

enum LeadingType {
  cancel,
  back,
  none,
}

extension LeadingTypeExtension on LeadingType {
  Widget getLeadingWidget(BuildContext context) {
    return switch (this) {
      LeadingType.cancel => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          ),
          child: Icon(
            FontAwesomeIcons.xmark,
            color: Colors.black,
            size: Sizes.size32,
          ),
        ),
      LeadingType.back => GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
            size: Sizes.size32,
          ),
        ),
      LeadingType.none => const SizedBox.shrink(),
    };
  }
}

/// PreferredSizeWidget
/// Flutter에서 위젯의 선호하는 크기를 정의하는 인터페이스
/// 주로 AppBar, TabBar와 같이 고정된 크기가 필요한 위젯들이 이를 구현
/// https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final LeadingType leadingType;

  const AppBarWidget({
    super.key,
    required this.leadingType,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120,
      // leading AppBar에서 제목(title) 앞쪽에 위치하는 위젯을 지정하는 속성
      // https://api.flutter.dev/flutter/material/AppBar/leading.html
      leading: leadingType.getLeadingWidget(context),
      title: Icon(
        FontAwesomeIcons.twitter,
        color: Color(0xFF4e98e9),
        size: Sizes.size40,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
