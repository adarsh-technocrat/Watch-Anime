import 'package:flutter/material.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/presentation/components/AnimeDetailsSectionComponent/anime_audio_section.dart';
import 'package:watch_anime/presentation/components/AnimeDetailsSectionComponent/detail_hero_section.dart';
import 'package:watch_anime/presentation/components/AnimeDetailsSectionComponent/episodes_section.dart';

class AnimeDetailSection extends StatefulWidget {
  final Anime data;

  const AnimeDetailSection({Key? key, required this.data}) : super(key: key);

  @override
  State<AnimeDetailSection> createState() => _AnimeDetailSectionState();
}

class _AnimeDetailSectionState extends State<AnimeDetailSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailHeroSection(data: widget.data),
          EpisodeSection(
            data: widget.data,
          ),
          AnimeAudioSection(
            anime: widget.data,
          )
        ],
      ),
    );
  }
}
