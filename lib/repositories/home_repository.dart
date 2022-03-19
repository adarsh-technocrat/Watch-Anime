import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/data/services/api_result.dart';
import 'package:watch_anime/data/services/dio_client.dart';
import 'package:watch_anime/data/services/network_exceptions.dart';

class HomeRepository {
  late DioClient dioClient;

  HomeRepository() {
    dioClient = DioClient();
  }

  Future<ApiResult<AnimeListModel>> getAnimeList(int pageNumber) async {
    try {
      final response = await dioClient
          .get("/anime", queryParameters: {"pageNumber": pageNumber});
      AnimeListModel animeListResponse = AnimeListModel.fromMap(response);
      return ApiResult.success(data: animeListResponse);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
