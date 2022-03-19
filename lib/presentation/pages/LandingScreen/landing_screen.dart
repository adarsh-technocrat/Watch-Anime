import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/anime_cubit/anime_cubit.dart';
import 'package:watch_anime/bloc/anime_cubit/anime_state.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/constants/enums.dart';
import 'package:watch_anime/presentation/components/LandingPageComponents/hero_component.dart';

import '../../components/search_card_list.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    var provider = BlocProvider.of<HomeCubit>(context);
    provider.getAnimeList(50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == Status.success) {
          var data = state.animeList;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                HeroComponent(data: data),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: List.generate(
                        data.length,
                        (index) => AnimeCard(
                              data: data[index],
                              index: index,
                            )),
                  ),
                )
              ],
            ),
          );
        } else if (state.status == Status.failure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
