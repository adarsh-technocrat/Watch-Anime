import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/anime_cubit.dart';
import 'package:watch_anime/bloc/anime_state.dart';
import 'package:watch_anime/components/LandingPageComponents/hero_component.dart';

import '../../components/search_card_list.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    var provider = BlocProvider.of<AnimeCubit>(context);
    provider.getAnimeList("0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        var data = state.animeListModel.data?.documents;
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return HeroComponent(data: data);
                    },
                  );
                }).toList(),
              ),
              AnimeCardList(data: data),
            ],
          ),
        );
      },
    );
  }
}
