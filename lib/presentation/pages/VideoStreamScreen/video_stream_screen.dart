import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class VideoStreamScreen extends StatefulWidget {
  final String episodeURL;

  const VideoStreamScreen({Key? key, required this.episodeURL})
      : super(key: key);

  @override
  State<VideoStreamScreen> createState() => _VideoStreamScreenState();
}

class _VideoStreamScreenState extends State<VideoStreamScreen> {
  Player player = Player(
    id: 0,
    videoDimensions: const VideoDimensions(640, 360),
  );

  @override
  void initState() {
    player.open(Media.network(widget.episodeURL), autoStart: true);

    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            color: Constants.kBlackColor,
            child: Video(
              player: player,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              showControls: true,
              playlistLength: 5,
              fit: BoxFit.cover,
              volumeActiveColor: const Color(0xffE50914),
              progressBarActiveColor: const Color(0xffE50914),
              progressBarThumbColor: const Color(0xffE50914),
              volumeBackgroundColor: Constants.kBlackColor,
              volumeThumbColor: const Color(0xffE50914),
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Episode Title",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
