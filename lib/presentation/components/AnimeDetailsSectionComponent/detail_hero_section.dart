import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/presentation/widgets/cached_network_image_widget.dart';

import '../../../utils/replace_null_title.dart';

class DetailHeroSection extends StatelessWidget {
  final Anime data;

  const DetailHeroSection({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String color = "0xff${data.coverColor.toString().split("#")[1]}";

    return Container(
      height: size.height / 1.8,
      color: Constants.kheroSectionColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Constants.kheroSectionColor,
            elevation: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Hero(
                        tag: data.coverImage!,
                        child: CachedNetworkImageWidget.cacheImage(
                            data.coverImage.toString()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Genres / " +
                                data.genres![0] +
                                " , " +
                                data.genres![1],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            replaceNullTitle(data),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Html(
                              data:
                                  "<p>${data.descriptions!.en.toString()}</p>",
                              style: {
                                "p": Style(
                                  maxLines: 5,
                                  textOverflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: FontSize.em(1.2),
                                  fontWeight: FontWeight.w300,
                                ),
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(int.parse(color)),
                                    padding: const EdgeInsets.all(18)),
                                onPressed: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "Watch Episodes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(18)),
                                onPressed: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Watch Trailer",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_to_photos,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 20),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.thumb_up_alt_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
