import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/home_cubit/home_cubit.dart';
import 'package:watch_anime/enums/enums.dart';
import 'package:watch_anime/presentation/components/search_card_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    setUpScrollController();
    var provider = BlocProvider.of<HomeCubit>(context);
    if (provider.state.animeList.isEmpty) {
      provider.getAnimeList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == Status.success) {
          var data = state.animeList;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 245,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: data.length + 1,
                    itemBuilder: (context, index) {
                      if (data.length == index) {
                        return _loadingIndecator();
                      }
                      return AnimeCard(
                        data: data[index],
                        index: index,
                      );
                    },
                  ),
                ),
              ],
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

  Widget _loadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  /// [ Pagination Scrollcontroller of Gridview ]

  setUpScrollController() {
    var provider = BlocProvider.of<HomeCubit>(context);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        /// [Load Anime List Api to featch further page ]
        provider.getAnimeList();
        debugPrint("Loading next page data");
      }
    });
  }
}
