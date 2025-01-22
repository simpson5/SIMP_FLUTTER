import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/created_account_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class CustomizeYourScreen extends StatefulWidget {
  final CreatedAccountScreen previousScreen; // 이전 화면 참조 추가

  const CustomizeYourScreen({
    super.key,
    required this.previousScreen, // 생성자에 추가
  });

  @override
  State<CustomizeYourScreen> createState() => _CustomizeYourScreenState();
}

class _CustomizeYourScreenState extends State<CustomizeYourScreen> {
  // Switch 상태 변수 추가
  bool _isTrackingEnabled = false;

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
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.black,
                        size: Sizes.size20,
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
              Gaps.v40,
              Text(
                "Customize your experience",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              Text(
                "Track where you see Twitter content across the web",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(
                      "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gaps.h20,
                  // 토글 버튼
                  Transform.scale(
                    scale: 1.3, // 크기 조절 (1이 기본 크기)
                    child: Switch(
                      value: _isTrackingEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isTrackingEnabled = value;
                        });
                      },
                      // Switch 색상 커스터마이징
                      activeColor: Colors.white, // 켜진 상태의 토글 색상
                      activeTrackColor: Colors.green, // 켜진 상태의 배경 색상
                      inactiveThumbColor: Colors.white, // 꺼진 상태의 토글 색상
                      inactiveTrackColor: Colors.grey.shade300, // 꺼진 상태의 배경 색상
                    ),
                  ),
                ],
              ),
              Gaps.v20,
              Row(
                children: [
                  Expanded(
                    // RichText를 사용하여 텍스트를 커스터마이징
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: "By signing up, you agree to our "),
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(text: ", "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(text: ", and "),
                          TextSpan(
                            text: "Cookie Use",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text:
                                ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                          ),
                          TextSpan(
                            text: "Learn more",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 1,
          child: GestureDetector(
            onTap: () {
              if (_isTrackingEnabled) {
                Navigator.pop(context);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size10,
                horizontal: Sizes.size32,
              ),
              decoration: BoxDecoration(
                // 이름과 메일이 전부 유효해야 엑티브 상태가 되야 한다.
                color: _isTrackingEnabled ? Colors.black : Colors.grey.shade600,
                borderRadius: BorderRadius.circular(Sizes.size32),
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: _isTrackingEnabled
                        ? Colors.white
                        : Colors.grey.shade500,
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
