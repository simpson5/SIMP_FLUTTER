import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                ),
              ),
            ),
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
                const Text(
                  "Report",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v14,
                const Text(
                  "Why are you reporting this thread?",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v14,
                Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),
                Gaps.v14,
                const Divider(height: 1),
                _buildReportOption("I just don't like it"),
                const Divider(height: 1),
                _buildReportOption("It's unlawful content under NetzDG"),
                const Divider(height: 1),
                _buildReportOption("It's spam"),
                const Divider(height: 1),
                _buildReportOption("Hate speech or symbols"),
                const Divider(height: 1),
                _buildReportOption("Nudity or sexual activity"),
                const Divider(height: 1),
                _buildReportOption("False information"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportOption(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: Sizes.size24,
          ),
        ],
      ),
    );
  }
}
