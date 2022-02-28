import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/landing_page_cubit.dart';
import 'package:watch_anime/bloc/landing_page_state.dart';
import 'package:watch_anime/components/pageNavbar/help_and_support_navbar.dart';
import 'package:watch_anime/components/pageNavbar/search_navbar.dart';
import 'package:watch_anime/components/pageNavbar/setting_navbar.dart';
import 'package:watch_anime/components/pageNavbar/watch_later_navbar.dart';
import 'package:watch_anime/constants/constants.dart';

import '../pages/NavBar/navBar.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  const Layout({Key? key, this.child}) : super(key: key);

  static WindowButtonColors colors =
      WindowButtonColors(iconNormal: Colors.white);

  static List<Widget> pageNavbarElement = [
    Container(),
    const SearchNavbar(),
    const WatchLaterNavbar(),
    const SettingNavbar(),
    const HelpAndSupportNavbar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LandingPageCubit, LandingPageState>(
        builder: (context, state) {
          return Container(
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
                      const Expanded(
                        child: NavBar(),
                      ),
                      Expanded(
                        flex: 18,
                        child: Column(
                          children: [
                            // app bar
                            state.selectedIndexPsition != 0
                                ? Expanded(
                                    child: pageNavbarElement
                                        .elementAt(state.selectedIndexPsition))
                                : Flexible(child: Container()),
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
          );
        },
      ),
    );
  }
}
