import 'package:watch_anime/data/models/anime_list_model.dart';

replaceNullTitle(Anime? data) {
  var title = data!.titles!;
  if (title.en == null) {
    return title.jp;
  } else {
    return title.en;
  }
}
