import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class EmptyStateUi extends StatelessWidget {
  const EmptyStateUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Center(
      child: Icon(
        FluentIcons.movies_and_tv_24_regular,
        color: Constants.kLightGrayColor,
        size: 200,
      ),
    ));
  }
}
