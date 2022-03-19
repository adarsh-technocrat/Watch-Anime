import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class SettingNavbar extends StatelessWidget {
  const SettingNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.kBlackColor,
      elevation: 2,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Settings"),
        ],
      ),
    );
  }
}
