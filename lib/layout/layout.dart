import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  const Layout({Key? key, this.child}) : super(key: key);

  static WindowButtonColors colors =
      WindowButtonColors(iconNormal: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBlackColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(30),
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
            )),
        body: child);
  }
}
