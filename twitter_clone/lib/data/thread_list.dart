import 'package:twitter_clone/data/user_list.dart';
import 'package:twitter_clone/model/thread.dart';

List<Thread> threadList = [
  Thread(
    id: "1",
    author: userList[0],
    content:
        "Just launched our new AI model! This will revolutionize how we interact with technology. What are your thoughts? 🤖",
    imageUrls: [
      "https://picsum.photos/seed/ai_model/400/300",
      "https://picsum.photos/seed/technology/400/300",
    ],
    createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    updatedAt: DateTime.now().subtract(const Duration(minutes: 30)),
    likes: 245000,
    replies: 18300,
    isVerified: true,
  ),
  Thread(
    id: "2",
    author: userList[1],
    content:
        "Behind the scenes of my new music video! Can't wait for you all to see it 🎵✨ #NewEra",
    imageUrls: [
      "https://picsum.photos/seed/music_video/400/300",
      "https://picsum.photos/seed/backstage/400/300",
      "https://picsum.photos/seed/recording/400/300",
    ],
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    likes: 892000,
    replies: 43200,
    isVerified: true,
  ),
  Thread(
    id: "3",
    author: userList[2],
    content:
        "PLAYOFF INTENSITY! 🏀 The Heat take Game 1 against the Celtics in a thrilling overtime finish! Butler: 35 PTS | Tatum: 28 PTS",
    imageUrls: ["https://picsum.photos/seed/basketball/400/300"],
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
    likes: 156000,
    replies: 8900,
    isVerified: true,
  ),
  Thread(
    id: "4",
    author: userList[3],
    content:
        "Reading list for 2024: Just finished 'The Code Breaker' by Walter Isaacson. Fascinating look at CRISPR and the future of gene editing. What books are you reading? 📚",
    imageUrls: ["https://picsum.photos/seed/books/400/300"],
    createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 8)),
    likes: 125000,
    replies: 7200,
    isVerified: true,
  ),
  Thread(
    id: "5",
    author: userList[4],
    content:
        "🌟 Breaking: Webb telescope captures most detailed image yet of a forming planetary system! This unprecedented view gives us new insights into how solar systems are born.",
    imageUrls: [
      "https://picsum.photos/seed/space/400/300",
      "https://picsum.photos/seed/telescope/400/300",
    ],
    createdAt: DateTime.now().subtract(const Duration(hours: 12)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 12)),
    likes: 438000,
    replies: 15600,
    isVerified: true,
  ),
  Thread(
    id: "6",
    author: userList[5],
    content:
        "Just dropped our new sustainable fashion collection! 🌿 Made from 100% recycled materials. Fashion can be both beautiful and environmentally conscious.",
    imageUrls: [
      "https://picsum.photos/seed/fashion/400/300",
      "https://picsum.photos/seed/sustainable/400/300",
    ],
    createdAt: DateTime.now().subtract(const Duration(hours: 15)),
    updatedAt: DateTime.now().subtract(const Duration(hours: 15)),
    likes: 89000,
    replies: 4200,
    isVerified: true,
  ),
  Thread(
    id: "7",
    author: userList[6],
    content:
        "Rare footage of a family of mountain gorillas in Rwanda. These gentle giants share 98% of their DNA with humans. Watch how the silverback protects his family. 🦍",
    imageUrls: ["https://picsum.photos/seed/gorilla/400/300"],
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    likes: 267000,
    replies: 9800,
    isVerified: true,
  ),
  Thread(
    id: "8",
    author: userList[7],
    content:
        "Breaking: Major breakthrough in quantum computing achieved! Our team has successfully maintained quantum coherence for over 10 minutes. This opens up incredible possibilities for the future of computing. 💻🔬",
    imageUrls: ["https://picsum.photos/seed/quantum/400/300"],
    createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
    updatedAt: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
    likes: 142000,
    replies: 6700,
    isVerified: true,
  ),
  Thread(
    id: "9",
    author: userList[8],
    content:
        "New recipe alert! 👨‍🍳 Check out my take on traditional Japanese ramen with a modern twist. Full video tutorial coming soon!",
    imageUrls: [
      "https://picsum.photos/seed/food/400/300",
      "https://picsum.photos/seed/cooking/400/300",
    ],
    createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 8)),
    updatedAt: DateTime.now().subtract(const Duration(days: 1, hours: 8)),
    likes: 56000,
    replies: 3200,
    isVerified: false,
  ),
  Thread(
    id: "10",
    author: userList[9],
    content:
        "Today's workout: 5-mile run, strength training, and yoga. Remember, consistency is key! 💪 What's your fitness routine?",
    imageUrls: ["https://picsum.photos/seed/fitness/400/300"],
    createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 12)),
    updatedAt: DateTime.now().subtract(const Duration(days: 1, hours: 12)),
    likes: 34000,
    replies: 2100,
    isVerified: false,
  ),
];
