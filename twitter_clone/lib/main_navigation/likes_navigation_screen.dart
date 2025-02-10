import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/data/activity_list.dart';
import 'package:twitter_clone/model/activity.dart';

class LikesNavigationScreen extends StatefulWidget {
  const LikesNavigationScreen({super.key});

  @override
  State<LikesNavigationScreen> createState() => _LikesNavigationScreenState();
}

class _LikesNavigationScreenState extends State<LikesNavigationScreen>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = [
    "All",
    "Replies",
    "Mentions",
    "Verified",
    "Follow",
    "Likes",
  ];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    // 데이터 출력
    for (var activity in activityList) {
      print("=== Activity ===");
      print("ID: ${activity.id}");
      print("User: ${activity.user.username}");
      print("Type: ${activity.type}");
      print("Content: ${activity.content}");
      print("Created At: ${activity.createdAt}");
      print("Is Following: ${activity.isFollowing}");
      print("Related Tweet: ${activity.relatedTwit?.content}");
      print("---------------");
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(
              top: Sizes.size12,
              left: Sizes.size4,
            ),
            child: Text(
              "Activity",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          scrolledUnderElevation: 0,
          bottom: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            labelPadding: const EdgeInsets.symmetric(horizontal: Sizes.size3),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicator: const BoxDecoration(),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              for (var i = 0; i < tabs.length; i++)
                Tab(
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size10),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      color: _tabController.index == i
                          ? Colors.black
                          : Colors.white,
                    ),
                    child: Text(
                      tabs[i],
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: _tabController.index == i
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: activityList.length,
              itemBuilder: (context, index) {
                return ActivityWidget(
                  activity: activityList[index],
                );
              },
            ),
            // Other tabs
            for (var i = 1; i < tabs.length; i++)
              Builder(
                builder: (context) {
                  final filteredActivityList = activityList
                      .where((activity) =>
                          activity.type.name.toLowerCase() ==
                          tabs[i].toLowerCase())
                      .toList();
                  return ListView.builder(
                    itemCount: filteredActivityList.length,
                    itemBuilder: (context, index) {
                      return ActivityWidget(
                        activity: filteredActivityList[index],
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: Sizes.size16,
        right: Sizes.size16,
        top: Sizes.size12,
        bottom: Sizes.size12,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: Sizes.size4),
        child: Stack(
          children: [
            CircleAvatar(
              radius: Sizes.size20,
              foregroundImage: NetworkImage(
                activity.user.profileImageUrl,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: activity.iconColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    activity.icon,
                    size: 11,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      title: Row(
        children: [
          Text(
            activity.user.username,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h4,
          Text(
            "· ${DateTime.now().difference(activity.createdAt).inHours}h",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (activity.content != null)
            Text(
              activity.content!,
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          Text(
            activity.activityText,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
      trailing: activity.type == ActivityType.follow
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: Text(
                activity.isFollowing ?? false ? "Following" : "Follow",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );
  }
}
