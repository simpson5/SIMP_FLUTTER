import 'package:flutter/material.dart';
import 'package:twitter_clone/authentication/home_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/interest_data.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/authentication/widgets/app_bar.dart';

class InterestsDetailScreen extends StatefulWidget {
  final List<String> selectedInterests;

  const InterestsDetailScreen({
    super.key,
    required this.selectedInterests,
  });

  @override
  State<InterestsDetailScreen> createState() => _InterestsDetailScreenState();
}

class _InterestsDetailScreenState extends State<InterestsDetailScreen> {
  List<String> selectedInterests = [];
  List<String> selectedDetailedInterests = [];

  @override
  void initState() {
    super.initState();
    selectedInterests = widget.selectedInterests;
  }

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
                  "Interests are used to personalize your experience and will be visible on your profile.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                Gaps.v20,
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: Sizes.size1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var interest in selectedInterests)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size40,
                      ),
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            interest,
                            style: TextStyle(
                              fontSize: Sizes.size24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Gaps.v20,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: detailedInterestsWidgets(interest),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
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
                      color: selectedDetailedInterests.length >= 3
                          ? Colors.black
                          : Colors.grey.shade500,
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: selectedDetailedInterests.length >= 3
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

  List<Widget> detailedInterestsWidgets(String interest) {
    var detailedInterests = InterestData.detailedInterests[interest] ?? [];
    var split = splitIntoThree(detailedInterests.length);
    var firstThreeInterests = detailedInterests.take(split[0]).toList();
    var secondThreeInterests =
        detailedInterests.skip(split[0]).take(split[1]).toList();
    var thirdThreeInterests =
        detailedInterests.skip(split[0] + split[1]).toList();
    return [
      createListWidget(firstThreeInterests),
      Gaps.v10,
      createListWidget(secondThreeInterests),
      Gaps.v10,
      createListWidget(thirdThreeInterests),
    ];
  }

  Widget createListWidget(List<String> detailedInterests) {
    return Wrap(
      spacing: Sizes.size10,
      runSpacing: Sizes.size10,
      children: [
        for (var detailedInterest in detailedInterests)
          GestureDetector(
            onTap: () {
              setState(() {
                if (selectedDetailedInterests.contains(detailedInterest)) {
                  selectedDetailedInterests.remove(detailedInterest);
                } else {
                  selectedDetailedInterests.add(detailedInterest);
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size10,
                vertical: Sizes.size5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size20),
                border: Border.all(
                  color: selectedDetailedInterests.contains(detailedInterest)
                      ? Color(0xFF4A98E9)
                      : Colors.grey.shade400,
                ),
                color: selectedDetailedInterests.contains(detailedInterest)
                    ? Color(0xFF4A98E9)
                    : Colors.white,
              ),
              child: Text(
                detailedInterest,
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w600,
                  color: selectedDetailedInterests.contains(detailedInterest)
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

List<int> splitIntoThree(int total) {
  final remainder = total % 3;
  final baseSize = total ~/ 3;

  if (remainder == 0) {
    return [baseSize, baseSize, baseSize];
  } else if (remainder == 1) {
    return [baseSize + 1, baseSize, baseSize];
  } else {
    // remainder == 2
    return [baseSize + 1, baseSize + 1, baseSize];
  }
}
