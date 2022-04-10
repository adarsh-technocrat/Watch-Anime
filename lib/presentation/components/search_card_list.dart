import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/presentation/components/hover_card.dart';
import 'package:watch_anime/presentation/pages/AnimeDetailsSection/anime_details_section.dart';
import 'package:watch_anime/presentation/widgets/cached_network_image_widget.dart';
import 'package:watch_anime/utils/Navigator/custom_navigator.dart';

import '../../utils/replace_null_title.dart';

class AnimeCard extends StatelessWidget {
  final Anime? data;
  final int? index;

  const AnimeCard({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        CustomNavigator()
            .customNavigator(context, AnimeDetailSection(data: data!));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: HoverCard(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Hero(
                    tag: data!.coverImage!,
                    child: SizedBox(
                      width: size.width,
                      child: data?.coverImage != null
                          ? CachedNetworkImageWidget.cacheImage(
                              data!.coverImage.toString())
                          : const SizedBox(),
                    ),
                  ),
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Constants.kPurpleColoe.withOpacity(0.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          replaceNullTitle(data),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
