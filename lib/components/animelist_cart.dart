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
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: SizedBox(
                width: 200,
                child: Image.network(
                  "https://i1.wp.com/chia-anime.su/wp-content/uploads/2020/11/Jujutsu-Kaisen-TV.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
