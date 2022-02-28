import 'package:flutter/material.dart';
import 'package:watch_anime/components/custom_window_appbar.dart';
import 'package:watch_anime/constants/constants.dart';

class RoutingPageLayout extends StatelessWidget {
  final Widget child;

  const RoutingPageLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.kBlackColor,
        child: Column(
          children: [
            // window app bar
            const Expanded(
              child: CustomWindowAppBar(),
            ),
            //
            Expanded(
              flex: 20,
              child: Container(
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
