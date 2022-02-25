import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/landing_page_cubit.dart';
import 'package:watch_anime/constants/constants.dart';

class NavBarElement extends StatelessWidget {
  final Function(bool value)? onHoverCallback;
  final dynamic navItemList;

  final int? index;

  const NavBarElement(
      {Key? key, this.onHoverCallback, this.navItemList, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LandingPageCubit>(context);
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              provider.changeScreenIndex(index!);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Icon(
                    navItemList["Icon"],
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    navItemList["title"],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        navItemList["divider"] == true
            ? const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 20,
                  child: Divider(color: Constants.kLightBlack),
                ),
              )
            : Container(),
      ],
    );
  }
}
