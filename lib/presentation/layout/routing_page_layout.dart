import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/presentation/components/custom_window_appbar.dart';

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
