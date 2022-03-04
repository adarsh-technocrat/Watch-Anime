import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class VideoEpisodeCard extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final Color boxShadowColor;
  final int episodeIndex;
  const VideoEpisodeCard(
      {Key? key,
      required this.onTap,
      required this.color,
      required this.boxShadowColor,
      required this.episodeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: Container(
          height: 120,
          width: 200,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(-8, 8),
                  color: boxShadowColor,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                FluentIcons.play_24_filled,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                "Episode " + (episodeIndex + 1).toString(),
                maxLines: 2,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
