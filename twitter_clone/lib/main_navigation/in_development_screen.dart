import 'package:flutter/material.dart';

class InDevelopmentScreen extends StatefulWidget {
  final String content;

  const InDevelopmentScreen({super.key, required this.content});

  @override
  State<InDevelopmentScreen> createState() => _InDevelopmentScreenState();
}

class _InDevelopmentScreenState extends State<InDevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "In Development",
            style: const TextStyle(fontSize: 48),
          ),
          Text(
            widget.content,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
