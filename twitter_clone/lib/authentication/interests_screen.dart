import 'package:flutter/material.dart';
import 'package:twitter_clone/authentication/interests_detail_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/authentication/widgets/app_bar.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interests = [
    "Fashion & beauty",
    "Outdoors",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
    "Technology",
    "Sports",
    "Health & fitness",
    "Science",
    "Education",
    "Photography",
  ];

  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v40,
          Container(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
            child: Column(
              children: [
                Text(
                  "What do you want to see on Twitter?",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Gaps.v10,
          Divider(
            color: Colors.grey.shade400,
            thickness: Sizes.size1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                ),
                child: Wrap(
                  spacing: Sizes.size10,
                  runSpacing: Sizes.size10,
                  children: [
                    for (var interest in interests)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedInterests.contains(interest)) {
                              selectedInterests.remove(interest);
                            } else {
                              if (selectedInterests.length >= 3) return;
                              selectedInterests.add(interest);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.size10,
                            vertical: Sizes.size10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedInterests.contains(interest)
                                  ? Color(0xFF4A98E9)
                                  : Colors.grey,
                            ),
                            color: selectedInterests.contains(interest)
                                ? Color(0xFF4A98E9)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(Sizes.size10),
                          ),
                          width: (MediaQuery.of(context).size.width - 50) / 2,
                          height: Sizes.size80,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              interest,
                              style: TextStyle(
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.w800,
                                color: selectedInterests.contains(interest)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: Sizes.size1,
          ),
          Container(
            height: Sizes.size60,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedInterests.length} of 3 selected"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InterestsDetailScreen(
                          selectedInterests: selectedInterests,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size20),
                      color: selectedInterests.length == 3
                          ? Colors.black
                          : Colors.grey.shade500,
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: selectedInterests.length == 3
                            ? Colors.white
                            : Colors.grey.shade200,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Gaps.v20,
        ],
      ),
    );
  }
}
