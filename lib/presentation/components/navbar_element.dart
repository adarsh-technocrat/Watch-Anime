import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/bloc/home_cubit/home_state.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/presentation/components/onhover_button.dart';

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

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LandingPageCubit>(context);
    return BlocBuilder<LandingPageCubit, LandingPageState>(
      builder: (context, state) {
        bool isSelected = state.selectedIndexPsition == widget.index;
        return OnHoverButton(
          onHover: (value) {
            setState(() => {isHover = value});
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
