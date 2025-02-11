import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/main_navigation/home_navigation_screen.dart';
import 'package:twitter_clone/main_navigation/likes_navigation_screen.dart';
import 'package:twitter_clone/main_navigation/profile_navigation_screen.dart';
import 'package:twitter_clone/main_navigation/search_navigation_screen.dart';
import 'package:twitter_clone/main_navigation/widgets/write_bottom_sheet.dart';
import 'widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(
        minHeight: 700,
        maxHeight: double.infinity,
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => const WriteBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeNavigationScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchNavigationScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const LikesNavigationScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileNavigationScreen(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
            ),
            NavTab(
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
            ),
            NavTab(
              isSelected: _selectedIndex == 2,
              icon: FontAwesomeIcons.penToSquare,
              onTap: () => _onWriteBottomSheet(context),
            ),
            NavTab(
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.heart,
              onTap: () => _onTap(3),
            ),
            NavTab(
              isSelected: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
