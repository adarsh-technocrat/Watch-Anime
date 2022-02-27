import 'package:animate_do/animate_do.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/search_page_cubit.dart';
import 'package:watch_anime/bloc/search_page_state.dart';
import 'package:watch_anime/components/empty_state_ui.dart';
import 'package:watch_anime/components/search_card.dart';
import 'package:watch_anime/constants/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    final provider = BlocProvider.of<SearchPageCubit>(context);
    provider.disposeDebouncing();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<SearchPageCubit>(context);
    return BlocBuilder<SearchPageCubit, SearchPageState>(
      builder: (context, state) {
        var data = state.searchDataModel.data?.anime ?? [];
        return SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    state.showLoading
                        ? const Padding(
                            padding: EdgeInsets.only(top: 250),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Constants.kPurpleColoe,
                              ),
                            ))
                        : data.isNotEmpty
                            ? SearchCard(data: data)
                            : Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: FadeInUp(child: const EmptyStateUi()),
                              )
                  ],
                ),
              ),
              AppBar(
                backgroundColor: Constants.kBlackColor,
                elevation: 2,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Browse "),
                    state.searchedQuery.isNotEmpty
                        ? Text("' ${state.searchedQuery} '")
                        : const SizedBox()
                  ],
                ),
                actions: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        )),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 12),
                            hintText: "Browse Anime",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (String newSearch) {
                            provider.onSearchChange(newSearch);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
