import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/constants/enums.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';

class HeroComponent extends StatefulWidget {
  final List<Anime>? data;

  const HeroComponent({Key? key, this.data}) : super(key: key);

  @override
  State<HeroComponent> createState() => _HeroComponentState();
}

class _HeroComponentState extends State<HeroComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == Status.success) {
          var data = widget.data?[state.hoverCardIndex];
          return Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 20, bottom: 20, top: 10),
            child: InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: const Color(0xff040B17),
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data?.titles?.en.toString() ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  "${data?.seasonYear.toString()}  .  ${data?.genres![0].toString()}",
                                  style: const TextStyle(
                                      color: Color(0xff9A9DA2),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                Html(
                                  data: """<p>${data?.descriptions?.en}</p>""",
                                  style: {
                                    "p": Style(
                                        color: const Color(0xffCDCED1),
                                        fontSize: FontSize.large,
                                        fontWeight: FontWeight.w500,
                                        wordSpacing: 2,
                                        maxLines: 3),
                                  },
                                ),
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            FluentIcons.play_24_filled,
                                            color: Color(0xffA4A7AB),
                                            size: 24,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Watch Anime",
                                            style: TextStyle(
                                                color: Color(0xffA4A7AB),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          data?.bannerImage != null
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, bottom: 2, right: 4, top: 2),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    color: Colors.white,
                                    child: Image.network(
                                      data!.bannerImage.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                stops: const [0.1, 1.0],
                                colors: [
                                  const Color(0xff040B17),
                                  const Color(0xff040B17).withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state.status == Status.failure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
