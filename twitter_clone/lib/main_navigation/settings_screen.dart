import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/main_navigation/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              const SizedBox(width: Sizes.size16),
              const Icon(
                Icons.arrow_back_ios,
                size: Sizes.size20,
              ),
              const Text(
                'Back',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 100,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person_add_outlined),
            title: const Text('Follow and invite friends'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_outlined),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Privacy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Account'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Log out',
              style: TextStyle(
                color: Colors.blue,
                fontSize: Sizes.size16,
              ),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('Log out'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: const Text('Log out'),
                      onPressed: () {
                        // TODO: 실제 로그아웃 로직 구현
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
