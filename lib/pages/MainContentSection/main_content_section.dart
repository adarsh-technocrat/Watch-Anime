import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/landing_page_cubit.dart';
import 'package:watch_anime/bloc/landing_page_state.dart';
import 'package:watch_anime/pages/LandingScreen/landing_screen.dart';
import 'package:watch_anime/pages/SearchScreen/search_screen.dart';

class MainContentSection extends StatelessWidget {
  const MainContentSection({Key? key}) : super(key: key);

  static List<Widget> pages = const [
    LandingScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageCubit, LandingPageState>(
      builder: (context, state) {
        return Expanded(
            child: SingleChildScrollView(
                child: Container(
                    child: pages.elementAt(state.selectedIndexPsition))));
      },
    );
  }
}
