import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/main_navigation/widgets/bottom_sheet.dart';
import 'package:twitter_clone/model/twit.dart';

class TwitBox extends StatefulWidget {
  final Twit twit;

  const TwitBox({super.key, required this.twit});

  @override
  State<TwitBox> createState() => _TwitBoxState();
}

class _TwitBoxState extends State<TwitBox> {
  @override
  void initState() {
    print("initState");
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  String getTimeAgo(DateTime date) {
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

  String ContextMenuButtonItem(int count) {
    if (count > 1000000) {
      return "1M+";
    } else if (count > 1000) {
      return "${count / 1000}k";
    } else {
      return "$count";
    }
  }

  void _onBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(
        maxHeight: 360,
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => const BottomSheetWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    widget.twit.author.profileImageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 3,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ],
          ),
          Gaps.h10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              widget.twit.author.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.h5,
                            Icon(
                              FontAwesomeIcons.check,
                              size: 12,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        getTimeAgo(widget.twit.createdAt),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gaps.h20,
                      GestureDetector(
                        onTap: () {
                          _onBottomSheet(context);
                        },
                        child: const Icon(
                          FontAwesomeIcons.ellipsis,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.twit.content),
                    if (widget.twit.imageUrls != null &&
                        widget.twit.imageUrls!.isNotEmpty)
                      Gaps.v10,
                    if (widget.twit.imageUrls != null &&
                        widget.twit.imageUrls!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            for (var imageUrl in widget.twit.imageUrls!)
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: SizedBox(
                                  width: 280,
                                  height: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
                Gaps.v10,
                Row(
                  children: [
                    Icon(FontAwesomeIcons.heart),
                    Gaps.h14,
                    Icon(FontAwesomeIcons.comment),
                    Gaps.h14,
                    Icon(FontAwesomeIcons.repeat),
                    Gaps.h14,
                    Icon(FontAwesomeIcons.paperPlane),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "${ContextMenuButtonItem(widget.twit.replies)} replies"),
                    Gaps.h5,
                    Text("・"),
                    Gaps.h5,
                    Text("${ContextMenuButtonItem(widget.twit.likes)} likes"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
