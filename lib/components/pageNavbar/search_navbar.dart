import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class SearchNavbar extends StatelessWidget {
  const SearchNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.kBlackColor,
      elevation: 2,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Browse "),
          // state.searchedQuery.isNotEmpty
          //     ? Text("' ${state.searchedQuery} '")
          //     : const SizedBox()
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
                  contentPadding: EdgeInsets.only(left: 10, bottom: 12),
                  hintText: "Browse Anime",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onChanged: (String newSearch) {
                  // provider.onSearchChange(newSearch, state.searchedQuery);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
