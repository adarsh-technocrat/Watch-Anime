import 'package:flutter/cupertino.dart';
import 'package:watch_anime/data/models/anime_episode_list.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/data/models/anime_song_model.dart';
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
          .get("/anime", queryParameters: {"per_page": 12, "page": pageNumber});
      AnimeListModel animeListResponse = AnimeListModel.fromMap(response);
      return ApiResult.success(data: animeListResponse);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<AnimeEpisodeModel>> getAnimeEpisode(int animeID) async {
    try {
      final response = await dioClient
          .get("/episode", queryParameters: {"anime_id": animeID});
      AnimeEpisodeModel animeEpisodeModel =
          AnimeEpisodeModel.fromJson(response);
      return ApiResult.success(data: animeEpisodeModel);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<AnimeSongsModel>> getAnimeSong(int animeID) async {
    try {
      final response = await dioClient
          .get("/song", queryParameters: {"anime_id": animeID.toString()});
      AnimeSongsModel animeSongsModel = AnimeSongsModel.fromJson(response);
      return ApiResult.success(data: animeSongsModel);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
