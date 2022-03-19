import 'package:palette_generator/palette_generator.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';

class AnimeState {
  AnimeListModel animeListModel;
  bool showLoading;
  PaletteColor color;

  AnimeState({
    required this.animeListModel,
    required this.showLoading,
    required this.color,
  });

  AnimeState copyWith({
    AnimeListModel? animeListModel,
    bool? showLoading,
    PaletteColor? color,
  }) {
    return AnimeState(
        animeListModel: animeListModel ?? this.animeListModel,
        showLoading: showLoading ?? this.showLoading,
        color: color ?? this.color);
  }
}
