import 'package:twitter_clone/data/thread_list.dart';
import 'package:twitter_clone/data/user_list.dart';
import 'package:twitter_clone/model/reply.dart';

List<Reply> replyList = [
  Reply(
    id: "1",
    author: userList[1], // Taylor Swift
    content:
        "The Medina is absolutely beautiful! I visited last year and it was a life-changing experience. 🌟",
    parentThread: threadList[0],
    createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 4)),
    likes: 12300,
    replies: 234,
    isVerified: true,
  ),
  Reply(
    id: "2",
    author: userList[2], // NBA
    content: "See you there! Let's explore the markets together 🏺",
    imageUrls: ["https://picsum.photos/seed/morocco/400/300"],
    parentThread: threadList[0],
    createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 3)),
    likes: 8900,
    replies: 123,
    isVerified: true,
  ),
  Reply(
    id: "3",
    author: userList[6], // National Geographic
    content:
        "Don't forget to visit the tanneries! They're one of the most iconic sights in the Medina. Here's a shot from our last visit 📸",
    imageUrls: [
      "https://picsum.photos/seed/medina1/400/300",
      "https://picsum.photos/seed/medina2/400/300",
    ],
    parentThread: threadList[0],
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    likes: 15600,
    replies: 445,
    isVerified: true,
  ),
];
