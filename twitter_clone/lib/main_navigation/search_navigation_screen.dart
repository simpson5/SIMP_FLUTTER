import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class SearchNavigationScreen extends StatefulWidget {
  const SearchNavigationScreen({super.key});

  @override
  State<SearchNavigationScreen> createState() => _SearchNavigationScreenState();
}

class _SearchNavigationScreenState extends State<SearchNavigationScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchKeyword = "";

  final List<Map<String, dynamic>> _users = [
    {
      "username": "rjmithun",
      "name": "Mithun",
      "followers": "26.6K",
      "image": "https://picsum.photos/200/200",
      "verified": true,
    },
    {
      "username": "vicenews",
      "name": "VICE News",
      "followers": "301K",
      "image": "https://picsum.photos/201/201",
      "verified": true,
    },
    {
      "username": "trevornoah",
      "name": "Trevor Noah",
      "followers": "789K",
      "image": "https://picsum.photos/202/202",
      "verified": true,
    },
    {
      "username": "condenasstraveller",
      "name": "Condé Nast Traveller",
      "followers": "130K",
      "image": "https://picsum.photos/203/203",
      "verified": true,
    },
    {
      "username": "chef_pillai",
      "name": "Suresh Pillai",
      "followers": "69.2K",
      "image": "https://picsum.photos/204/204",
      "verified": true,
    },
  ];

  List<Map<String, dynamic>> get _filteredUsers {
    if (_searchKeyword.isEmpty) return _users;
    return _users.where((user) {
      final username = user["username"].toString().toLowerCase();
      final name = user["name"].toString().toLowerCase();
      final keyword = _searchKeyword.toLowerCase();
      return username.contains(keyword) || name.contains(keyword);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(
            top: Sizes.size12,
            left: Sizes.size4,
          ),
          child: Text(
            "Search",
            style: TextStyle(
              fontSize: Sizes.size32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: ListView.builder(
        itemCount: _filteredUsers.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(Sizes.size16),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: "Search",
                style: const TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchKeyword = value;
                  });
                },
              ),
            );
          }
          final user = _filteredUsers[index - 1];
          return ListTile(
            contentPadding: const EdgeInsets.only(
              left: Sizes.size16,
              right: Sizes.size16,
              top: Sizes.size12,
              bottom: Sizes.size12,
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: Sizes.size4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: Sizes.size20,
                    backgroundImage: NetworkImage(
                      user["image"],
                    ),
                  ),
                ],
              ),
            ),
            title: Row(
              children: [
                Text(
                  user["username"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (user["verified"])
                  const Padding(
                    padding: EdgeInsets.only(left: Sizes.size4),
                    child: Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: Sizes.size16,
                    ),
                  ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  user["name"],
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                Gaps.v10,
                Text(
                  "${user["followers"]} followers",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: const Text(
                "Follow",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
