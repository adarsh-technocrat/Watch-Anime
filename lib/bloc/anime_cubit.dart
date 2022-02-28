import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:watch_anime/bloc/anime_state.dart';
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/model/anime_details_model.dart';
import 'package:watch_anime/service/anime_details_Service.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeCubit()
      : super(AnimeState(
            animeDetailsModel: AnimeDetailsModel(),
            showLoading: false,
            color: PaletteColor(Constants.kPurpleColoe, 2)));

  AnimeDetailsService animeDetailsService = AnimeDetailsService();

  Future<AnimeDetailsModel> getAnimeDetail(String slug) async {
    showLoading(true);
    var animedetailModel = await animeDetailsService.getAnimeDetails(slug);
    showLoading(false);
    emit(state.copyWith(
        animeDetailsModel: animedetailModel, showLoading: false));
    return animedetailModel;
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
