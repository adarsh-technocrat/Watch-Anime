import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:watch_anime/components/search_navbar.dart';
import 'package:watch_anime/constants/constants.dart';

import '../pages/NavBar/navBar.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  const Layout({Key? key, this.child}) : super(key: key);

  static WindowButtonColors colors =
      WindowButtonColors(iconNormal: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Constants.kBlackColor,
        child: Column(
          children: [
            // app bar
            Expanded(
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                    color: Constants.kBlackColor,
                    border: Border(bottom: BorderSide.none)),
                child: Row(
                  children: [
                    Expanded(
                      child: MoveWindow(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 14.0,
                            ),
                            Text(
                              'Watch Anime',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MinimizeWindowButton(
                      colors: colors,
                    ),
                    MaximizeWindowButton(
                      colors: colors,
                    ),
                    CloseWindowButton(
                      colors: colors,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Row(
                children: [
                  // side Nav bar
                  Expanded(
                    child: NavBar(),
                  ),
                  Expanded(
                    flex: 18,
                    child: Column(
                      children: [
                        // app bar
                        const Expanded(
                          child: SearchNavbar(),
                        ),
                        // content
                        Expanded(
                          flex: 12,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: child,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
