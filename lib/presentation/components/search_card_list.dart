import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/presentation/components/hover_card.dart';
import 'package:watch_anime/presentation/widgets/cached_network_image_widget.dart';

class AnimeCard extends StatelessWidget {
  final Documents? data;
  final int? index;

  const AnimeCard({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LandingPageCubit>(context);
    return FadeInUp(
      duration: Duration(milliseconds: index! * 100),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: HoverCard(
          child: InkWell(
            onHover: (value) {
              provider.changeHoverCardIndex(index!);
            },
            onTap: () {
              // CustomNavigator()
              //     .customNavigator(context, const AnimeDetailSection());
            },
            child: Container(
              width: 184,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Hero(
                      tag: "tag",
                      child: CachedNetworkImageWidget.cacheImage(
                          data?.coverImage ?? ""),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data!.titles!.en.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
