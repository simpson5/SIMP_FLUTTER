import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/created_account_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/widgets/app_bar.dart';
import 'package:twitter_clone/widgets/move_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.none,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v40,
              Gaps.v40,
              Container(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
                child: Text(
                  'See what\'s happening in the world right now.',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gaps.v40,
              Gaps.v40,
              MoveButton(
                text: 'Continue with Google',
                icon: FontAwesomeIcons.google,
                isDark: false,
                goToNextScreen: null,
              ),
              Gaps.v20,
              MoveButton(
                text: 'Continue with Apple',
                icon: FontAwesomeIcons.apple,
                isDark: false,
                goToNextScreen: null,
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: Sizes.size1,
                      endIndent: Sizes.size5,
                    ),
                  ),
                  Gaps.h10,
                  Text('or'),
                  Gaps.h10,
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: Sizes.size1,
                      indent: Sizes.size5,
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              MoveButton(
                  text: 'Create account',
                  icon: null,
                  isDark: true,
                  goToNextScreen: CreatedAccountScreen()),
              Gaps.v20,
              Text(
                "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Row(
            children: [
              Text('Have an account?'),
              TextButton(
                onPressed: () {},
                child: Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
