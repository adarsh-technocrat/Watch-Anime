import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class AnimeSongList extends StatefulWidget {
  const AnimeSongList({
    Key? key,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "COWBOY BEBOP Vitaminless",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "WILLIAM CLAESON",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "13:5",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/174872.png"),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
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
}
