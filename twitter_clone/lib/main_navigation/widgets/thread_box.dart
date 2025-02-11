import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/model/thread.dart';

class ThreadBox extends StatefulWidget {
  final Thread thread;

  const ThreadBox({
    super.key,
    required this.thread,
  });

  @override
  State<ThreadBox> createState() => _ThreadBoxState();
}

class _ThreadBoxState extends State<ThreadBox> {
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

  void _onMoreTap() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: const Icon(FontAwesomeIcons.flag),
            title: const Text("Report"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.userMinus),
            title: const Text("Unfollow"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.volumeXmark),
            title: const Text("Mute"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
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
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    widget.thread.author.profileImageUrl,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
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
                            widget.thread.author.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          if (widget.thread.isVerified) ...[
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
                            _getTimeAgo(widget.thread.createdAt),
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Gaps.h12,
                          GestureDetector(
                            onTap: _onMoreTap,
                            child: const Icon(
                              FontAwesomeIcons.ellipsis,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gaps.v8,
                  Text(widget.thread.content),
                  if (widget.thread.imageUrls != null) ...[
                    Gaps.v8,
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.thread.imageUrls!.length,
                        separatorBuilder: (context, index) => Gaps.h12,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              widget.thread.imageUrls![index],
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
                    "${_formatCount(widget.thread.replies)} replies · ${_formatCount(widget.thread.likes)} likes",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
