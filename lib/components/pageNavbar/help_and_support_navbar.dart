import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class HelpAndSupportNavbar extends StatelessWidget {
  const HelpAndSupportNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.kBlackColor,
      elevation: 2,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Help & Support"),
        ],
      ),
    );
  }
}
