import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/main_navigation/widgets/report_bottom_sheet.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.size20),
          topRight: Radius.circular(Sizes.size20),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            children: [
              Gaps.v14,
              Container(
                width: Sizes.size40,
                height: Sizes.size4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(Sizes.size2),
                ),
              ),
              Gaps.v24,
              Column(
                children: [
                  BottomSheetBtn(
                    text: "Unfollow",
                    textColor: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.size20),
                      topRight: Radius.circular(Sizes.size20),
                    ),
                    isDivider: true,
                  ),
                  BottomSheetBtn(
                    text: "Mute",
                    textColor: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Sizes.size20),
                      bottomRight: Radius.circular(Sizes.size20),
                    ),
                    isDivider: false,
                  ),
                ],
              ),
              Gaps.v24,
              Column(
                children: [
                  BottomSheetBtn(
                    text: "Hide",
                    textColor: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.size20),
                      topRight: Radius.circular(Sizes.size20),
                    ),
                    isDivider: true,
                  ),
                  BottomSheetBtn(
                    text: "Report",
                    textColor: Colors.red.shade500,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Sizes.size20),
                      bottomRight: Radius.circular(Sizes.size20),
                    ),
                    isDivider: false,
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        constraints: const BoxConstraints(
                          maxHeight: 500,
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (context) => const ReportBottomSheet(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetBtn extends StatelessWidget {
  final String text;
  final Color textColor;
  final BorderRadius borderRadius;
  final bool isDivider;
  final VoidCallback? onTap;

  const BottomSheetBtn({
    super.key,
    required this.text,
    required this.textColor,
    required this.borderRadius,
    this.isDivider = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: borderRadius,
          border: Border(
            bottom: isDivider
                ? BorderSide(color: Colors.grey.shade400)
                : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
