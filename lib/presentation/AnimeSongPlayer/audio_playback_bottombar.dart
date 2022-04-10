import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class AudioPlaybackBottomBar extends StatefulWidget {
  const AudioPlaybackBottomBar({Key? key}) : super(key: key);

  @override
  State<AudioPlaybackBottomBar> createState() => _AudioPlaybackBottomBarState();
}

class _AudioPlaybackBottomBarState extends State<AudioPlaybackBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.kBlackColor,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_next_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Movement of the Unknown",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Text(
                    "WILLIAM CLAESON",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Slider(
                      onChanged: (value) {},
                      value: 0.5,
                      max: 5,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Add to playlist",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          "Download",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
