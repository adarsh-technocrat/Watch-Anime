import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class LangindHeroSection extends StatelessWidget {
  const LangindHeroSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/wallpaper.jpg",
                ),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Constants.kBlackColor,
                Constants.kLightBlack.withOpacity(0.1),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        )
      ],
    );
  }
}
