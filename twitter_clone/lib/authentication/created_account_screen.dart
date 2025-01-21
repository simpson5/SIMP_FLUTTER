import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class CreatedAccountScreen extends StatelessWidget {
  const CreatedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v40,
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.twitter,
                    color: Color(0xFF4e98e9),
                    size: Sizes.size40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
