import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/presentation/pages/VideoStreamScreen/video_stream_screen.dart';
import 'package:watch_anime/utils/Navigator/custom_navigator.dart';

class EpisodeSection extends StatefulWidget {
  final Anime data;

  const EpisodeSection({Key? key, required this.data}) : super(key: key);

  @override
  State<EpisodeSection> createState() => _EpisodeSectionState();
}

class _EpisodeSectionState extends State<EpisodeSection> {
  @override
  void initState() {
    final homeProvider = BlocProvider.of<HomeCubit>(context);
    homeProvider.getAnimeAnimeEpisode(widget.data.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 0, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Episodes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var episodeData = state.animeEpisodesList;
                String color =
                    "0xff${widget.data.coverColor.toString().split("#")[1]}";
                debugPrint(color);
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.animeEpisodesList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: Color(int.parse(color)),
                        child: InkWell(
                          onTap: () {
                            CustomNavigator().customNavigator(
                              context,
                              const VideoStreamScreen(
                                episodeURL: "",
                              ),
                            );
                          },
                          child: Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0)),
                            child: Column(
                              children: [
                                const Expanded(child: SizedBox()),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 10, right: 12),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        episodeData[index].title.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Language : " +
                                            episodeData[index]
                                                .locale
                                                .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                LinearProgressIndicator(
                                  value: 0.5,
                                  color: Constants.kheroSectionColor
                                      .withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
