import 'package:flutter/material.dart';
import 'package:watch_anime/components/animelist_cart.dart';
import '../../components/landing_hero_section.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LangindHeroSection(),
        const SizedBox(height: 20),
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Latest Release",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey)),
                onPressed: () {},
                child: const Text(
                  "Show more",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
        const AnimeListCard(),
      ],
    );
  }
}
