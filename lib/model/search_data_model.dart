class SearchDataModel {
  int? success;
  Data? data;

  SearchDataModel({this.success, this.data});

  SearchDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Anime>? anime;

  Data({this.anime});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['anime'] != null) {
      anime = <Anime>[];
      json['anime'].forEach((v) {
        anime!.add(Anime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (anime != null) {
      data['anime'] = anime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Anime {
  String? animeImage;
  int? animeId;
  String? animeTitle;
  String? animeGenres;
  String? animeType;
  String? animeEpisodes;
  String? animeSub;
  String? animeLink;

  Anime(
      {this.animeImage,
      this.animeId,
      this.animeTitle,
      this.animeGenres,
      this.animeType,
      this.animeEpisodes,
      this.animeSub,
      this.animeLink});

  Anime.fromJson(Map<String, dynamic> json) {
    animeImage = json['anime_image'];
    animeId = json['anime_id'];
    animeTitle = json['anime_title'];
    animeGenres = json['anime_genres'];
    animeType = json['anime_type'];
    animeEpisodes = json['anime_episodes'];
    animeSub = json['anime_sub'];
    animeLink = json['anime_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['anime_image'] = animeImage;
    data['anime_id'] = animeId;
    data['anime_title'] = animeTitle;
    data['anime_genres'] = animeGenres;
    data['anime_type'] = animeType;
    data['anime_episodes'] = animeEpisodes;
    data['anime_sub'] = animeSub;
    data['anime_link'] = animeLink;
    return data;
  }
}
