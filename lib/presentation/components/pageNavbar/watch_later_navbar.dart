import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class WatchLaterNavbar extends StatelessWidget {
  const WatchLaterNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.kBlackColor,
      elevation: 2,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Watch Later"),
        ],
      ),
    );
  }
}
