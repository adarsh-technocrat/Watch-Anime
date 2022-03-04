import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:watch_anime/bloc/anime_cubit.dart';
import 'package:watch_anime/bloc/anime_state.dart';
import 'package:watch_anime/components/hover_card.dart';
import 'package:watch_anime/components/video_episode_card.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/pages/VideoStreamScreen/video_stream_screen.dart';
import 'package:watch_anime/utils/Navigator/custom_navigator.dart';
import '../../model/search_data_model.dart';

class AnimeDetailSection extends StatefulWidget {
  final Anime? data;

  const AnimeDetailSection({Key? key, this.data}) : super(key: key);

  @override
  State<AnimeDetailSection> createState() => _AnimeDetailSectionState();
}

class _AnimeDetailSectionState extends State<AnimeDetailSection> {
  @override
  void initState() {
    final provider = BlocProvider.of<AnimeCubit>(context);
    provider.generatePaletteColor(widget.data!.animeImage.toString());
    provider.getAnimeDetail(widget.data!.animeSlug.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeState>(
      builder: (context, state) {
        var detailData = state.animeDetailsModel.data;
        return SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Constants.kBlackColor,
                    state.color.color,
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200, left: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Hero(
                              tag: widget.data!.animeImage.toString(),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                width: 270,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.data!.animeImage.toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Rating ${detailData?.rating}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            RatingBarIndicator(
                              rating: double.parse(detailData?.rating ?? "0"),
                              itemCount: 10,
                              itemSize: 22.0,
                              unratedColor: Colors.white30,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: state.color.color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                widget.data!.animeTitle.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                chip(detailData?.animeInfo!.status ?? ""),
                                chip(detailData?.animeInfo!.released ?? ""),
                                chip(detailData?.animeInfo!.season ?? ""),
                                chip(detailData?.animeInfo!.type ?? ""),
                                chip(detailData?.animeInfo!.censor ?? ""),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                detailData?.animeShortSummary.toString() ?? "",
                                style: const TextStyle(
                                    color: Constants.klightTextColor,
                                    fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: List.generate(
                                  detailData?.genres?.length ?? 0,
                                  (index) => textMethod(
                                      detailData?.genres?[index] ?? "")),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Episodes ( ${detailData?.episodeId?.length} )",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Wrap(
                      children: List.generate(
                        detailData?.episodeId!.length ?? 0,
                        (index) => HoverCard(
                          child: VideoEpisodeCard(
                              boxShadowColor:
                                  state.color.color.withOpacity(0.2),
                              color: state.color.color.withOpacity(0.5),
                              onTap: () {
                                CustomNavigator().customNavigator(
                                    context,
                                    VideoStreamScreen(
                                        episodeId:
                                            detailData?.episodeId![index] ??
                                                ""));
                              },
                              episodeIndex: index),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding chip(String lable) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(lable),
        backgroundColor: Colors.white,
      ),
    );
  }

  Padding textMethod(String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
