import 'package:twitter_clone/model/user.dart';

class Thread {
  final String id;
  final User author;
  final String content;
  final List<String>? imageUrls;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likes;
  final int replies;
  final bool isVerified;

  Thread({
    required this.id,
    required this.author,
    required this.content,
    this.imageUrls,
    required this.createdAt,
    required this.updatedAt,
    required this.likes,
    required this.replies,
    this.isVerified = false,
  });
}
