import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/search_page_cubit.dart';
import 'package:watch_anime/bloc/search_page_state.dart';
import 'package:watch_anime/components/search_card.dart';
import 'package:watch_anime/constants/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<SearchPageCubit>(context);
    return BlocBuilder<SearchPageCubit, SearchPageState>(
      builder: (context, state) {
        var data = state.searchDataModel.data?.anime;
        return SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                )),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Search Anime",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (String value) {
                    provider.getSearchQueryData(value);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              state.showLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Constants.kPurpleColoe,
                    ))
                  : SearchCard(data: data ?? [])
            ],
          ),
        );
      },
    );
  }
}
