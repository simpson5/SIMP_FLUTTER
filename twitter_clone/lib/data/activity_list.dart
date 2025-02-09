import 'package:twitter_clone/data/twit_list.dart';
import 'package:twitter_clone/data/user_list.dart';
import 'package:twitter_clone/model/activity.dart';

final List<Activity> activityList = [
  Activity(
    id: "1",
    user: userList[0], // Elon Musk
    type: ActivityType.mentions,
    content:
        "Hey @BillGates, let's discuss the future of AI and sustainable energy!",
    subtitle: "Mentioned you in a conversation about technology",
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    relatedTwit: twitList[0],
  ),
  Activity(
    id: "2",
    user: userList[1], // Taylor Swift
    type: ActivityType.likes,
    content: "Just listened to your new podcast episode - amazing insights!",
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    relatedTwit: twitList[1],
  ),
  Activity(
    id: "3",
    user: userList[2], // NBA
    type: ActivityType.replies,
    content: "Your analysis of the game was spot on!",
    subtitle: "Replied to your tweet about basketball statistics",
    createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    relatedTwit: twitList[2],
  ),
  Activity(
    id: "4",
    user: userList[3], // Bill Gates
    type: ActivityType.follow,
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    isFollowing: true,
  ),
  Activity(
    id: "5",
    user: userList[4], // NASA
    type: ActivityType.mentions,
    content: "Fascinating research on space exploration by @BillGates",
    createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    relatedTwit: twitList[3],
  ),
  Activity(
    id: "6",
    user: userList[5], // Barack Obama
    type: ActivityType.likes,
    content: "Your climate change initiative is inspiring",
    createdAt: DateTime.now().subtract(const Duration(hours: 7)),
    relatedTwit: twitList[5],
  ),
  Activity(
    id: "7",
    user: userList[6], // National Geographic
    type: ActivityType.follow,
    createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    isFollowing: false,
  ),
  Activity(
    id: "8",
    user: userList[0],
    type: ActivityType.replies,
    content: "We should collaborate on this project!",
    subtitle: "Replied to your tweet about renewable energy",
    createdAt: DateTime.now().subtract(const Duration(hours: 9)),
    relatedTwit: twitList[0],
  ),
  Activity(
    id: "9",
    user: userList[1],
    type: ActivityType.verified,
    content: "Congratulations on your verified status!",
    createdAt: DateTime.now().subtract(const Duration(hours: 10)),
  ),
  Activity(
    id: "10",
    user: userList[2],
    type: ActivityType.mentions,
    content: "Great analysis of the playoffs by @BillGates",
    createdAt: DateTime.now().subtract(const Duration(hours: 11)),
    relatedTwit: twitList[2],
  ),
  Activity(
    id: "11",
    user: userList[3],
    type: ActivityType.likes,
    content: "Your insights on AI development are fascinating",
    createdAt: DateTime.now().subtract(const Duration(hours: 12)),
    relatedTwit: twitList[5],
  ),
  Activity(
    id: "12",
    user: userList[4],
    type: ActivityType.follow,
    createdAt: DateTime.now().subtract(const Duration(hours: 13)),
    isFollowing: true,
  ),
  Activity(
    id: "13",
    user: userList[5],
    type: ActivityType.replies,
    content: "Let's work together on climate initiatives",
    subtitle: "Replied to your environmental proposal",
    createdAt: DateTime.now().subtract(const Duration(hours: 14)),
    relatedTwit: twitList[5],
  ),
  Activity(
    id: "14",
    user: userList[6],
    type: ActivityType.mentions,
    content: "Check out this amazing wildlife photography by @BillGates",
    createdAt: DateTime.now().subtract(const Duration(hours: 15)),
    relatedTwit: twitList[4],
  ),
  Activity(
    id: "15",
    user: userList[0],
    type: ActivityType.verified,
    content: "Your account has been verified",
    createdAt: DateTime.now().subtract(const Duration(hours: 16)),
  ),
  Activity(
    id: "16",
    user: userList[1],
    type: ActivityType.likes,
    content: "Your thread on technology innovation is brilliant",
    createdAt: DateTime.now().subtract(const Duration(hours: 17)),
    relatedTwit: twitList[1],
  ),
  Activity(
    id: "17",
    user: userList[2],
    type: ActivityType.follow,
    createdAt: DateTime.now().subtract(const Duration(hours: 18)),
    isFollowing: true,
  ),
  Activity(
    id: "18",
    user: userList[3],
    type: ActivityType.replies,
    content: "Interesting perspective on global health",
    subtitle: "Replied to your healthcare initiative post",
    createdAt: DateTime.now().subtract(const Duration(hours: 19)),
    relatedTwit: twitList[5],
  ),
  Activity(
    id: "19",
    user: userList[4],
    type: ActivityType.mentions,
    content:
        "Join us for a live discussion on space exploration with @BillGates",
    createdAt: DateTime.now().subtract(const Duration(hours: 20)),
    relatedTwit: twitList[3],
  ),
  Activity(
    id: "20",
    user: userList[5],
    type: ActivityType.likes,
    content: "Your commitment to education is admirable",
    createdAt: DateTime.now().subtract(const Duration(hours: 21)),
    relatedTwit: twitList[5],
  ),
];
