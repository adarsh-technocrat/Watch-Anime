import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';

class AnimeListService {
  final String baseUrl = Constants.baseUrl;

  Future<AnimeListModel> getListOfAnime(String pageNumber) async {
    dynamic data;

    try {
      var response = await http.Client().get(
        Uri.parse("https://api.aniapi.com/v1/anime?page=50"),
      );

      var jsonResponse = json.decode(response.body);

      data = AnimeListModel.fromJson(jsonResponse);
    } catch (error) {
      log(error.toString());
    }

    return data;
  }
}
