import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy",
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
          /* 
            SwitchListTile: 스위치를 포함한 리스트 타일 위젯
            - value: 스위치의 현재 상태 (on/off)
            - onChanged: 스위치 상태가 변경될 때 호출되는 콜백
            - activeColor: 스위치가 켜졌을 때의 색상
            - title: 타일의 주요 텍스트
            - secondary: 타일의 leading 위젯 (보통 아이콘)
            - subtitle: 타일의 부가 설명 텍스트 (선택)
            
            .adaptive()를 사용하면 iOS/Android 플랫폼에 맞는 스위치 스타일 적용
           */
          SwitchListTile.adaptive(
            value: _isPrivateProfile,
            onChanged: (value) {
              setState(() {
                _isPrivateProfile = value;
              });
            },
            activeColor: Colors.black,
            title: const Text('Private profile'),
            secondary: const Icon(Icons.lock_outline),
          ),
          ListTile(
            leading: const Icon(Icons.alternate_email),
            title: const Text('Mentions'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Everyone',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: Sizes.size12),
                Icon(
                  Icons.chevron_right,
                  size: Sizes.size20,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.volume_off_outlined),
            title: const Text('Muted'),
            trailing: Icon(
              Icons.chevron_right,
              size: Sizes.size20,
              color: Colors.grey.shade500,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.visibility_off_outlined),
            title: const Text('Hidden Words'),
            trailing: Icon(
              Icons.chevron_right,
              size: Sizes.size20,
              color: Colors.grey.shade500,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text('Profiles you follow'),
            trailing: Icon(
              Icons.chevron_right,
              size: Sizes.size20,
              color: Colors.grey.shade500,
            ),
            onTap: () {},
          ),
          Divider(
            height: 0.1,
            color: Colors.grey.shade100,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Other privacy settings',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.open_in_new,
                  size: Sizes.size20,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            subtitle: Text(
              'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.block_outlined),
            title: const Text('Blocked profiles'),
            trailing: Icon(
              Icons.open_in_new,
              size: Sizes.size20,
              color: Colors.grey.shade500,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.visibility_off_outlined),
            title: const Text('Hide likes'),
            trailing: Icon(
              Icons.open_in_new,
              size: Sizes.size20,
              color: Colors.grey.shade500,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
