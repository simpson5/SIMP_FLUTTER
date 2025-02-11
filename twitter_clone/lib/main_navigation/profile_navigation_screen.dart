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
    // DefaultTabController: 탭 뷰를 관리하는 컨트롤러
    // length: 탭 수
    // child: 탭 뷰를 포함하는 위젯
    // tabBar 가 있으면 무조건 있어야 함
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          /* 
            NestedScrollView: 내부에 여러 스크롤 가능한 위젯들을 포함할 수 있는 스크롤 뷰
            - headerSliverBuilder: 상단에 고정되거나 스크롤되는 헤더 위젯들을 빌드
            - body: 메인 스크롤 컨텐츠를 포함
            주로 CollapsingToolbar 패턴이나 복잡한 스크롤 동작이 필요할 때 사용
           */
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                /* 
                  SliverAppBar: 스크롤에 반응하는 앱바
                  - floating: 스크롤 업하면 바로 나타날지 여부
                  - pinned: 스크롤해도 상단에 고정될지 여부
                  - expandedHeight: 최대로 확장됐을 때의 높이
                  - flexibleSpace: 확장/축소될 때 보여질 위젯
                 */
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

                /* 
                  SliverPersistentHeader: 스크롤 시 크기가 변하거나 고정되는 헤더
                  - pinned: true면 스크롤해도 상단에 고정
                  - floating: true면 스크롤 업할 때 바로 나타남
                  - delegate: 헤더의 빌드 로직과 크기 정보를 포함하는 delegate 클래스
                  
                  maxExtent: 최대 높이
                  minExtent: 최소 높이
                  shouldRebuild: 헤더를 다시 빌드해야 하는지 결정
                 */
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CustomSliverPersistentHeader(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarDelegate(),
                ),
              ];
            },
            /* 
              TabBarView: 탭별로 다른 화면을 보여주는 스와이프 가능한 뷰
              - TabController와 연동되어 탭 전환을 처리
              - children: 각 탭에 해당하는 위젯 리스트
              - physics: 스크롤/스와이프 동작 설정
             */
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
      /* 
        TabBar: 탭 선택을 위한 네비게이션 바
        - tabs: 각 탭의 위젯 리스트
        - indicatorSize: 탭 인디케이터의 크기 (label or tab)
        - indicatorColor: 선택된 탭을 표시하는 인디케이터의 색상
        - labelColor: 선택된 탭의 텍스트 색상
        - unselectedLabelColor: 선택되지 않은 탭의 텍스트 색상
        - isScrollable: 탭이 많을 때 스크롤 가능하게 할지 여부
       */
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
