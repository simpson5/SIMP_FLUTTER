import 'package:flutter/material.dart';
import 'package:twitter_clone/authentication/confrim_code_screen.dart';
import 'package:twitter_clone/constants/button_form.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class SignUpButton extends StatelessWidget {
  final String name;
  final String contactInfo;
  final String birthday;

  const SignUpButton({
    super.key,
    required this.name,
    required this.contactInfo,
    required this.birthday,
  });

  void _goToConfirmCodeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmCodeScreen(
          name: name,
          contactInfo: contactInfo,
          birthday: birthday,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: Sizes.size14,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: "By signing up, you agree to the "),
              TextSpan(
                text: "Terms of Service",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(text: " and "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(text: ", including "),
              TextSpan(
                text: "Cookie Use",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text:
                    ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ",
              ),
              TextSpan(
                text: "Learn more",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text:
                    ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise ",
              ),
              TextSpan(
                text: "here",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              TextSpan(text: "."),
            ],
          ),
        ),
        Gaps.v20,
        ButtonForm(
          text: "Sign up",
          buttonColor: Colors.blue.shade400,
          textColor: Colors.white,
          onTap: () {
            _goToConfirmCodeScreen(context);
          },
        ),
      ],
    );
  }
}
