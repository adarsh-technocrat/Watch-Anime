import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/anime_state.dart';
import 'package:watch_anime/model/anime_details_model.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeCubit()
      : super(AnimeState(
            animeDetailsModel: AnimeDetailsModel(), showLoading: false));

  Future<AnimeDetailsModel> getSearchQueryData(String query) async {
    showLoading(true);
    var searchModel = await searchService.getSearchData(query);
    showLoading(false);
    emit(state.copyWith(searchDataModel: searchModel, showLoading: false));
    return searchModel;
  }

  showLoading(bool loading) {
    emit(state.copyWith(showLoading: loading));
  }
}
