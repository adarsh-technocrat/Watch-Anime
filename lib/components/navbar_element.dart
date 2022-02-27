import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:watch_anime/bloc/landing_page_cubit.dart';
import 'package:watch_anime/bloc/landing_page_state.dart';
import 'package:watch_anime/components/onhover_button.dart';
import 'package:watch_anime/constants/constants.dart';

class NavBarElement extends StatefulWidget {
  final Function(bool value)? onHoverCallback;
  final dynamic navItemList;

  final int? index;

  const NavBarElement(
      {Key? key, this.onHoverCallback, this.navItemList, this.index})
      : super(key: key);

  @override
  State<NavBarElement> createState() => _NavBarElementState();
}

class _NavBarElementState extends State<NavBarElement> {
  bool isHover = false;

  // late AudioPlayer player;

  // @override
  // void initState() {
  //   super.initState();
  //   player = AudioPlayer();
  // }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  // void hoverPlayAudio() async {
  //   await player.setAsset('assets/audio/clickAudio.mp3');
  //   player.play();
  // }

  // void hoverExitAudio() async {
  //   await player.stop();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LandingPageCubit>(context);
    return BlocBuilder<LandingPageCubit, LandingPageState>(
      builder: (context, state) {
        bool isSelected = state.selectedIndexPsition == widget.index;
        return OnHoverButton(
          onHover: (value) {
            setState(() => {isHover = value});
            // isHover ? hoverExitAudio() : hoverPlayAudio();
          },
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor:
                    isSelected ? Constants.kPurpleColoe : Colors.transparent,
                elevation: 0,
                fixedSize: const Size(80, 70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
            onPressed: () {
              provider.changeScreenIndex(widget.index!);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                Icon(
                  widget.navItemList["Icon"],
                  color: isSelected
                      ? Colors.white
                      : isHover
                          ? Colors.white
                          : Constants.kLightGrayColor,
                  size: 24,
                ),
                const SizedBox(height: 5),
                Text(
                  widget.navItemList["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : isHover
                              ? Colors.white
                              : Constants.kLightGrayColor,
                      fontSize: 10),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
