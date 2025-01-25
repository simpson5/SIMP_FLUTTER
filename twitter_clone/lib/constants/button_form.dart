import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ButtonForm extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final Function() onTap;

  const ButtonForm({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.size10,
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(Sizes.size32),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
