import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/main_navigation/widgets/twit_box.dart';
import 'package:twitter_clone/data/twit_list.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Icon(
          FontAwesomeIcons.at,
          size: Sizes.size40,
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            children: [
              TwitBox(twit: twitList[0]),
              Gaps.v20,
              TwitBox(twit: twitList[1]),
              Gaps.v20,
              TwitBox(twit: twitList[2]),
              Gaps.v20,
              TwitBox(twit: twitList[3]),
            ],
          ),
        ),
      ),
    );
  }
}
