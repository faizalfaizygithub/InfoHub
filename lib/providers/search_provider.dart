import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  int selectedCategory = -1;
  List categories = [
    {
      "title": "Chemistry",
    },
    {
      "title": "Mathematics",
    },
    {
      "title": "Biology",
    },
    {
      "title": "General Knowledge",
    },
  ];

  List recentProfiles = [
    {"name": "Amith Krishna", "image": "1"},
    {"name": "John Honai", "image": "2"},
    {"name": "Pepper Potts", "image": "3"},
    {"name": "Peter Parker", "image": "4"},
    {"name": "Kiara Advani", "image": "5"},
  ];

  List recentSearchText = [
    "Explain Artificial Intelligence",
    "What is the mechanics of diesel engine",
    "How to prove Pythagorous theorem",
    "Black hole and worm hole",
    "What will be the future of AI"
  ];

  List<String> recommendedVideos = [];

  getThumbnails() async {
    recommendedVideos.clear();
    for (var i = 0; i < 8; i++) {
      recommendedVideos.add(i.isEven
          ? "https://img.freepik.com/premium-photo/black-white-image-atom-with-protona-electrons-spining-around_793337-933.jpg?w=1800"
          : "https://img.freepik.com/premium-photo/dna-helix-molecule-blue-yellow-colors-gene-ukrainian-nation-generative-ai_500695-267.jpg?w=2000");
    }
    notifyListeners();
  }
}
