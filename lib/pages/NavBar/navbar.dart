import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

import '../../components/navbar_element.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static List navItemList = [
    {
      "title": "Home",
      "Icon": Icons.home_outlined,
      "divider": false,
    },
    {
      "title": "Browse",
      "Icon": Icons.search_outlined,
      "divider": true,
    },
    {
      "title": "Liked",
      "Icon": Icons.favorite_border_outlined,
      "divider": false,
    },
    {
      "title": "Bookmark",
      "Icon": Icons.bookmark_border_outlined,
      "divider": false
    },
    {
      "title": "Watch later",
      "Icon": Icons.watch_later_outlined,
      "divider": true,
    },
    {"title": "Settings", "Icon": Icons.settings_outlined, "divider": false},
    {
      "title": "Help & Report",
      "Icon": Icons.help_outline,
      "divider": false,
    },
  ];

  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      width: 200,
      child: Column(
        children: List.generate(
          navItemList.length,
          (index) => NavBarElement(
            key: UniqueKey(),
            navItemList: navItemList[index],
            index: index,
          ),
        ),
      ),
    );
  }
}
