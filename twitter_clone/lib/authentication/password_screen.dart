import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/interests_screen.dart';
import 'package:twitter_clone/constants/button_form.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/authentication/widgets/app_bar.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;
  bool _isPasswordValid = false;
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword(String value) {
    setState(() {
      _password = value;
      _isPasswordValid = value.isNotEmpty && value.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            Text(
              "You'll need a password",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            Text(
              "Make sure it's 8 characters or more",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Gaps.v20,
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              onChanged: _validatePassword,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  // suffixIcon 내부에서 Row위젯 사용시 공간 제약 문제 발생
                  // 따라서 너비 지정 필요
                  child: SizedBox(
                    width: Sizes.size96,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.scale(
                          scaleX: -1,
                          child: Icon(
                            _obscureText
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            color: Colors.grey,
                          ),
                        ),
                        Gaps.h5,
                        Icon(
                          FontAwesomeIcons.circleCheck,
                          color: _isPasswordValid ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                hintText: "Password",
              ),
            ),
            Gaps.v20,
            Spacer(),
            BottomAppBar(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size10,
              ),
              color: Colors.white,
              elevation: 0,
              child: ButtonForm(
                text: "Next",
                buttonColor: _isPasswordValid ? Colors.black : Colors.grey,
                textColor:
                    _isPasswordValid ? Colors.white : Colors.grey.shade300,
                onTap: () {
                  if (!_isPasswordValid) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InterestsScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
