import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:watch_anime/bloc/anime_state.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/model/anime_list_model.dart';
import 'package:watch_anime/service/anime_list_service.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeCubit()
      : super(AnimeState(
            animeListModel: AnimeListModel(),
            showLoading: false,
            color: PaletteColor(Constants.kPurpleColoe, 2)));

  AnimeListService animeListService = AnimeListService();

  Future<AnimeListModel> getAnimeList(String pageNumber) async {
    showLoading(true);
    var animeListModel = await animeListService.getListOfAnime(pageNumber);
    showLoading(false);
    emit(state.copyWith(animeListModel: animeListModel, showLoading: false));
    return animeListModel;
  }

  showLoading(bool loading) {
    emit(state.copyWith(showLoading: loading));
  }

  void generatePaletteColor(String image) async {
    final PaletteGenerator generator =
        await PaletteGenerator.fromImageProvider(NetworkImage(image));
    emit(state.copyWith(color: generator.lightVibrantColor));
  }
}
