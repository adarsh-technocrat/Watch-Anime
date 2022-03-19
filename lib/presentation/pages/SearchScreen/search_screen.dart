import 'package:flutter/material.dart';
import 'package:watch_anime/constants/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Column(
            children: const [
              Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Constants.kPurpleColoe,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
