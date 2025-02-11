import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/model/reply.dart';

class ReplyBox extends StatefulWidget {
  final Reply reply;

  const ReplyBox({
    super.key,
    required this.reply,
  });

  @override
  State<ReplyBox> createState() => _ReplyBoxState();
}

class _ReplyBoxState extends State<ReplyBox> {
  String _getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds}s";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}h";
    } else {
      return "${difference.inDays}d";
    }
  }

  String _formatCount(int count) {
    if (count > 1000000) {
      return "1M+";
    } else if (count > 1000) {
      return "${(count / 1000).toStringAsFixed(1)}k";
    } else {
      return "$count";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage:
                    NetworkImage(widget.reply.author.profileImageUrl),
              ),
              Gaps.h12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.reply.author.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            if (widget.reply.isVerified) ...[
                              Gaps.h4,
                              const Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: 14,
                                color: Colors.blue,
                              ),
                            ],
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              _getTimeAgo(widget.reply.createdAt),
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Gaps.h12,
                            Icon(
                              FontAwesomeIcons.ellipsis,
                              size: 14,
                              color: Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v4,
                    // 원본 Thread 작성자 표시
                    Text(
                      "Replying to @${widget.reply.parentThread.author.username}",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                    Gaps.v8,
                    Text(widget.reply.content),
                    if (widget.reply.imageUrls != null) ...[
                      Gaps.v8,
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.reply.imageUrls!.length,
                          separatorBuilder: (context, index) => Gaps.h12,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                widget.reply.imageUrls![index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                    Gaps.v12,
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.heart, size: 20),
                        Gaps.h20,
                        const Icon(FontAwesomeIcons.comment, size: 20),
                        Gaps.h20,
                        const Icon(FontAwesomeIcons.retweet, size: 20),
                        Gaps.h20,
                        const Icon(FontAwesomeIcons.paperPlane, size: 20),
                      ],
                    ),
                    Gaps.v8,
                    Text(
                      "${_formatCount(widget.reply.replies)} replies · ${_formatCount(widget.reply.likes)} likes",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
