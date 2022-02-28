import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/model/anime_details_model.dart';

class AnimeDetailsService {
  final String baseUrl = Constants.baseUrl;

  Future<AnimeDetailsModel> getAnimeDetails(String slug) async {
    dynamic data;

    try {
      var response = await http.Client().get(
        Uri.parse("$baseUrl/details/$slug"),
      );

      var jsonResponse = json.decode(response.body);

      data = AnimeDetailsModel.fromJson(jsonResponse);
    } catch (error) {
      log(error.toString());
    }

    return data;
  }
}
