import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/presentation/components/AnimeDetailsSectionComponent/anime_song_list.dart';

import '../../../utils/replace_null_title.dart';

class AnimeAudioSection extends StatefulWidget {
  final Anime anime;

  const AnimeAudioSection({Key? key, required this.anime}) : super(key: key);

  @override
  State<AnimeAudioSection> createState() => _AnimeAudioSectionState();
}

class _AnimeAudioSectionState extends State<AnimeAudioSection> {
  @override
  void initState() {
    final homeProvider = BlocProvider.of<HomeCubit>(context);
    homeProvider.getAnimeSongs(int.parse(widget.anime.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Songs - " + replaceNullTitle(widget.anime),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var sondData = state.animeSongPlayList;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sondData.length,
                  itemBuilder: (context, index) =>
                      AnimeSongList(songData: sondData[index]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
