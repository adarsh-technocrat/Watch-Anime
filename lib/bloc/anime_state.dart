import 'package:palette_generator/palette_generator.dart';
import 'package:watch_anime/model/anime_details_model.dart';

class AnimeState {
  AnimeDetailsModel animeDetailsModel;
  bool showLoading;
  PaletteColor color;

  AnimeState({
    required this.animeDetailsModel,
    required this.showLoading,
    required this.color,
  });

  AnimeState copyWith({
    AnimeDetailsModel? animeDetailsModel,
    bool? showLoading,
    PaletteColor? color,
  }) {
    return AnimeState(
        animeDetailsModel: animeDetailsModel ?? this.animeDetailsModel,
        showLoading: showLoading ?? this.showLoading,
        color: color ?? this.color);
  }
}
