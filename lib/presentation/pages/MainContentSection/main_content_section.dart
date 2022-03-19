import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/presentation/pages/HelpAndSupport/help_and_support.dart';
import 'package:watch_anime/presentation/pages/LandingScreen/landing_screen.dart';
import 'package:watch_anime/presentation/pages/SearchScreen/search_screen.dart';
import 'package:watch_anime/presentation/pages/Settings/settings.dart';
import 'package:watch_anime/presentation/pages/WatchLater/watch_later.dart';

class MainContentSection extends StatelessWidget {
  const MainContentSection({Key? key}) : super(key: key);

  static List<Widget> pages = const [
    LandingScreen(),
    SearchScreen(),
    WatchLater(),
    Settings(),
    HelpAndSupport()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(child: pages.elementAt(state.selectedIndexPsition));
      },
    );
  }
}
