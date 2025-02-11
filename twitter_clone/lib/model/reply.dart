import 'package:twitter_clone/model/thread.dart';
import 'package:twitter_clone/model/user.dart';

class Reply {
  final String id;
  final User author;
  final String content;
  final List<String>? imageUrls;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likes;
  final int replies;
  final Thread parentThread; // 답글을 단 원본 Thread
  final bool isVerified;

  Reply({
    required this.id,
    required this.author,
    required this.content,
    this.imageUrls,
    required this.createdAt,
    required this.updatedAt,
    required this.likes,
    required this.replies,
    required this.parentThread,
    this.isVerified = false,
  });
}
