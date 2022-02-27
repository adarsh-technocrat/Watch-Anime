import 'package:animate_do/animate_do.dart';
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
    return BlocBuilder<SearchPageCubit, SearchPageState>(
      builder: (context, state) {
        var data = state.searchDataModel.data?.anime ?? [];
        return SizedBox(
          child: Column(
            children: [
              Column(
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
            ],
          ),
        );
      },
    );
  }
}
