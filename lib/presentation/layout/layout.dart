import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/presentation/components/custom_window_appbar.dart';
import 'package:watch_anime/presentation/components/pageNavbar/help_and_support_navbar.dart';
import 'package:watch_anime/presentation/components/pageNavbar/search_navbar.dart';
import 'package:watch_anime/presentation/components/pageNavbar/setting_navbar.dart';
import 'package:watch_anime/presentation/components/pageNavbar/watch_later_navbar.dart';

import '../pages/NavBar/navBar.dart';

class Layout extends StatelessWidget {
  final Widget? child;

  const Layout({Key? key, this.child}) : super(key: key);

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
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            color: Constants.kBlackColor,
            child: Column(
              children: [
                // window app bar
                const Expanded(
                  child: CustomWindowAppBar(),
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
                        flex: 15,
                        child: Column(
                          children: [
                            // app bar
                            state.selectedIndexPsition != 0
                                ? Expanded(
                                    child: pageNavbarElement
                                        .elementAt(state.selectedIndexPsition))
                                : Container(),
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
