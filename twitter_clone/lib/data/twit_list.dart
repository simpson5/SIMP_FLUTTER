import 'package:twitter_clone/data/user_list.dart';
import 'package:twitter_clone/model/twit.dart';

List<Twit> twitList = [
  Twit(
    id: "1",
    author: userList[0], // Elon Musk
    content:
        "Excited to announce that I've acquired Twitter for \$44 billion. Looking forward to helping humanity!",
    imageUrls: [
      "https://picsum.photos/seed/twitter/400/300",
      "https://picsum.photos/seed/twitter/400/300",
    ],
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    likes: 2900000,
    replies: 158000,
  ),
  Twit(
    id: "2",
    author: userList[1], // Taylor Swift
    content:
        "My new album 'Midnights' is out now! 🌙✨ This is a collection of music written in the middle of the night, a journey through terrors and sweet dreams.",
    imageUrls: ["https://picsum.photos/seed/midnight/400/300"],
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
    likes: 1800000,
    replies: 92000,
  ),
  Twit(
    id: "3",
    author: userList[2], // NBA
    content:
        "WHAT A GAME! The Warriors defeat the Lakers in a thriller, 123-122! Curry: 46 PTS, 8 AST LeBron: 38 PTS, 12 REB",
    imageUrls: ["https://picsum.photos/seed/nba_game/400/300"],
    createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 8)),
    likes: 450000,
    replies: 28000,
  ),
  Twit(
    id: "4",
    author: userList[4], // NASA
    content:
        "🚀 Artemis III will land the first woman and first person of color on the Moon, using innovative technologies to explore the lunar surface.",
    imageUrls: ["https://picsum.photos/seed/artemis/400/300"],
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    likes: 820000,
    replies: 45000,
  ),
  Twit(
    id: "5",
    author: userList[6], // National Geographic
    content:
        "Incredible footage of a rare snow leopard spotted in the Himalayas. These elusive cats are masters of camouflage and are rarely seen in the wild. 🐆❄️",
    imageUrls: ["https://picsum.photos/seed/leopard/400/300"],
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    likes: 650000,
    replies: 32000,
  ),
  Twit(
    id: "6",
    author: userList[3], // Bill Gates
    content:
        "Climate change is one of the toughest challenges facing humanity. But I'm optimistic that with innovation and collaboration, we can build a clean energy future.",
    imageUrls: [], // No image
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    likes: 380000,
    replies: 25000,
  ),
];
