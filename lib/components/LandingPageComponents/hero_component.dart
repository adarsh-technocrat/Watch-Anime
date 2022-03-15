import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../model/anime_list_model.dart';

class HeroComponent extends StatefulWidget {
  final List<Documents>? data;

  const HeroComponent({Key? key, this.data}) : super(key: key);

  @override
  State<HeroComponent> createState() => _HeroComponentState();
}

class _HeroComponentState extends State<HeroComponent> {
  final int indexNumber = 9;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
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
                            widget.data?[indexNumber].titles?.en.toString() ??
                                "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            "${widget.data![indexNumber].seasonYear.toString()}  .  ${widget.data![indexNumber].genres![0].toString()}",
                            style: const TextStyle(
                                color: Color(0xff9A9DA2),
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Html(
                            data:
                                """<p>${widget.data?[indexNumber].descriptions?.en}</p>""",
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 2, bottom: 2, right: 4, top: 2),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        child: Image.network(
                          widget.data![indexNumber].bannerImage.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
  }
}
