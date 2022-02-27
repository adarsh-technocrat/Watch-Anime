import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../components/navbar_element.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  static List navItemList = [
    {
      "title": "Home",
      "Icon": FluentIcons.home_24_regular,
      "expanded": false,
    },
    {
      "title": "Browse",
      "Icon": FluentIcons.search_24_regular,
      "expanded": false,
    },
    {
      "title": "Watch later",
      "Icon": FluentIcons.clock_24_regular,
      "expanded": true,
    },
    {
      "title": "Settings",
      "Icon": FluentIcons.settings_24_regular,
      "expanded": false,
    },
    {
      "title": "Help & Support",
      "Icon": FluentIcons.info_24_regular,
      "expanded": false,
    },
  ];

  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Column(
            children: List.generate(
              navItemList.length,
              (index) => Column(
                children: [
                  NavBarElement(
                    key: UniqueKey(),
                    navItemList: navItemList[index],
                    index: index,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
