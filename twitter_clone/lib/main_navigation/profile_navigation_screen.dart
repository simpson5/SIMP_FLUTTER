import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/data/thread_list.dart';
import 'package:twitter_clone/data/reply_list.dart';
import 'package:twitter_clone/main_navigation/settings_screen.dart';
import 'package:twitter_clone/main_navigation/widgets/thread_box.dart';
import 'package:twitter_clone/main_navigation/widgets/reply_box.dart';

class ProfileNavigationScreen extends StatefulWidget {
  const ProfileNavigationScreen({super.key});

  @override
  State<ProfileNavigationScreen> createState() =>
      _ProfileNavigationScreenState();
}

class _ProfileNavigationScreenState extends State<ProfileNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.globe,
                        size: Sizes.size36,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.camera,
                            size: Sizes.size36,
                            color: Colors.black,
                          ),
                          Gaps.h12,
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsScreen(),
                                ),
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.bars,
                              size: Sizes.size36,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomSliverPersistentHeader(),
                ),
                // SliverPersistentHeader는 여러개도 가능하다.
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarDelegate(),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: threadList.length,
                  itemBuilder: (context, index) {
                    return ThreadBox(
                      thread: threadList[index],
                    );
                  },
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: replyList.length,
                  itemBuilder: (context, index) {
                    return ReplyBox(
                      reply: replyList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Simpson",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.v12,
                            Row(
                              children: [
                                Text(
                                  "simpson_park",
                                  style: TextStyle(
                                    fontSize: Sizes.size20,
                                  ),
                                ),
                                Gaps.h12,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size12,
                                    vertical: Sizes.size4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size24),
                                  ),
                                  child: Text(
                                    "threads.net",
                                    style: TextStyle(
                                      fontSize: Sizes.size16,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gaps.h24,
                        CircleAvatar(
                          radius: Sizes.size32,
                          backgroundColor: Colors.yellow.shade400,
                          child: Text(
                            "SIM",
                            style: TextStyle(
                              fontSize: Sizes.size24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v12,
                    Text(
                      "Software Engineer!",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                      ),
                    ),
                    Gaps.v16,
                    Row(
                      children: [
                        SizedBox(
                          width: Sizes.size48,
                          height: Sizes.size32,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: Sizes.size16,
                                backgroundColor: Colors.grey.shade200,
                              ),
                              Positioned(
                                left: Sizes.size16,
                                child: CircleAvatar(
                                  radius: Sizes.size16,
                                  backgroundColor: Colors.blue.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gaps.h12,
                        Text(
                          "2 followers",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Gaps.v24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.435,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size12,
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size12,
                    ),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    "Edit profile",
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.435,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size12,
                    vertical: Sizes.size10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizes.size12,
                    ),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    "Share profile",
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 275;

  @override
  double get minExtent => 275;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        tabs: [
          Tab(
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
