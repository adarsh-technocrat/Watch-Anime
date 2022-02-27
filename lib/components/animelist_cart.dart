import 'package:flutter/material.dart';

class AnimeListCard extends StatefulWidget {
  const AnimeListCard({Key? key}) : super(key: key);

  @override
  State<AnimeListCard> createState() => _AnimeListCardState();
}

class _AnimeListCardState extends State<AnimeListCard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container()),
      ),
    );
  }
}
