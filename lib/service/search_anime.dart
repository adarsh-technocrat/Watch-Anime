import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:watch_anime/model/search_data_model.dart';

class SearchService {
  Future<SearchDataModel> getSearchData(String query) async {
    dynamic data;

    try {
      var response = await http.Client().get(
        Uri.parse(
            "https://watch-anime-v1-api.vercel.app/search?searchQuery=${query}"),
      );

      var jsonResponse = json.decode(response.body);

      data = SearchDataModel.fromJson(jsonResponse);
    } catch (error) {
      log(error.toString());
    }

    return data;
  }
}
