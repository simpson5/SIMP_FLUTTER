import 'package:flutter/material.dart';
import 'package:twitter_clone/model/twit.dart';
import 'package:twitter_clone/model/user.dart';

enum ActivityType {
  all,
  replies,
  mentions,
  verified,
  follow,
  likes,
}

class Activity {
  final String id;
  final User user;
  final ActivityType type;
  final String? content;
  final String? subtitle;
  final DateTime createdAt;
  final bool? isFollowing;
  final Twit? relatedTwit;

  Activity({
    required this.id,
    required this.user,
    required this.type,
    this.content,
    this.subtitle,
    required this.createdAt,
    this.isFollowing,
    this.relatedTwit,
  });

  String get activityText {
    switch (type) {
      case ActivityType.mentions:
        return "Mentioned you";
      case ActivityType.replies:
        return "Replied to your tweet";
      case ActivityType.follow:
        return "Followed you";
      case ActivityType.likes:
        return "Liked your tweet";
      case ActivityType.verified:
        return "Verified activity";
      default:
        return "";
    }
  }

  Color get iconColor {
    switch (type) {
      case ActivityType.mentions:
        return Colors.green;
      case ActivityType.replies:
        return Colors.blue;
      case ActivityType.follow:
        return Colors.purple;
      case ActivityType.likes:
        return Colors.red;
      case ActivityType.verified:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData get icon {
    switch (type) {
      case ActivityType.mentions:
        return Icons.alternate_email;
      case ActivityType.replies:
        return Icons.reply;
      case ActivityType.follow:
        return Icons.person;
      case ActivityType.likes:
        return Icons.favorite;
      case ActivityType.verified:
        return Icons.verified;
      default:
        return Icons.notifications;
    }
  }
}
