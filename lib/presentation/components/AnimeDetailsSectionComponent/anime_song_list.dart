import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/data/models/anime_song_model.dart';

class AnimeSongList extends StatefulWidget {
  final SongDocument songData;

  const AnimeSongList({
    Key? key,
    required this.songData,
  }) : super(key: key);

  @override
  State<AnimeSongList> createState() => _AnimeSongListState();
}

class _AnimeSongListState extends State<AnimeSongList> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: onHover ? Colors.white.withOpacity(0.1) : Constants.kBlackColor,
        child: InkWell(
          onTap: () {},
          onHover: (value) {
            setState(() {
              onHover = value;
            });
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xff2E2E2E),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.songData.title.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text(
                      widget.songData.artist.toString(),
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.songData.album.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      const SizedBox(width: 60),
                      Text(
                        widget.songData.year.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      const SizedBox(width: 60),
                      Text(
                        getDutationValue(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      const SizedBox(width: 60),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/174872.png"),
                      ),
                      const SizedBox(width: 50),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getDutationValue() {
    String duration = "";
    var durationvalue =
        Duration(milliseconds: int.parse(widget.songData.duration.toString()))
            .abs()
            .toString()
            .split(":");

    var minutes = durationvalue[1];
    var seconds = double.parse(durationvalue[2]).round();
    duration = "$minutes : $seconds";
    return duration;
  }
}
