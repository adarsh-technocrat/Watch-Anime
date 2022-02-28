import 'package:watch_anime/model/anime_details_model.dart';

class AnimeState {
  AnimeDetailsModel animeDetailsModel;
  bool showLoading;

  AnimeState({
    required this.animeDetailsModel,
    required this.showLoading,
  });

  AnimeState copyWith({
    AnimeDetailsModel? animeDetailsModel,
    bool? showLoading,
  }) {
    return AnimeState(
      animeDetailsModel: animeDetailsModel ?? this.animeDetailsModel,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}
