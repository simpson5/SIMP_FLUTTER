import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isDark;
  final Widget? goToNextScreen;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    this.isDark = false,
    required this.goToNextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: GestureDetector(
        onTap: () {
          if (goToNextScreen != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => goToNextScreen!));
          }
        },
        child: Container(
          padding: EdgeInsets.all(Sizes.size20),
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            border: Border.all(
              color: Colors.grey.shade400,
              width: Sizes.size1,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size40,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(icon),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w800,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
