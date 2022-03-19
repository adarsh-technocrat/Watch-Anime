class AnimeDetailsModel {
  int? success;
  Data? data;

  AnimeDetailsModel({this.success, this.data});

  AnimeDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? animeImage;
  String? animeTitle;
  AnimeInfo? animeInfo;
  List<String>? genres;
  String? rating;
  String? animeShortSummary;
  List<String>? episodeId;

  Data(
      {this.animeImage,
      this.animeTitle,
      this.animeInfo,
      this.genres,
      this.rating,
      this.animeShortSummary,
      this.episodeId});

  Data.fromJson(Map<String, dynamic> json) {
    animeImage = json['anime_image'];
    animeTitle = json['anime_title'];
    animeInfo = json['anime_info'] != null
        ? AnimeInfo.fromJson(json['anime_info'])
        : null;
    genres = json['genres'].cast<String>();
    rating = json['rating'];
    animeShortSummary = json['anime_short_summary'];
    episodeId = json['episode_id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['anime_image'] = animeImage;
    data['anime_title'] = animeTitle;
    if (animeInfo != null) {
      data['anime_info'] = animeInfo!.toJson();
    }
    data['genres'] = genres;
    data['rating'] = rating;
    data['anime_short_summary'] = animeShortSummary;
    data['episode_id'] = episodeId;
    return data;
  }
}

class AnimeInfo {
  String? status;
  String? studio;
  String? released;
  String? season;
  String? type;
  String? censor;

  AnimeInfo(
      {this.status,
      this.studio,
      this.released,
      this.season,
      this.type,
      this.censor});

  AnimeInfo.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    studio = json['Studio'];
    released = json['Released'];
    season = json['Season'];
    type = json['Type'];
    censor = json['Censor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Studio'] = studio;
    data['Released'] = released;
    data['Season'] = season;
    data['Type'] = type;
    data['Censor'] = censor;
    return data;
  }
}
