class AnimeListModel {
  int? statusCode;
  String? message;
  Data? data;
  String? version;

  AnimeListModel({this.statusCode, this.message, this.data, this.version});

  AnimeListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['version'] = version;
    return data;
  }
}

class Data {
  int? currentPage;
  int? count;
  List<Documents>? documents;
  int? lastPage;

  Data({this.currentPage, this.count, this.documents, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    count = json['count'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['count'] = count;
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['last_page'] = lastPage;
    return data;
  }
}

class Documents {
  int? anilistId;
  int? malId;
  int? tmdbId;
  int? format;
  int? status;
  Descriptions? titles;
  Descriptions? descriptions;
  String? startDate;
  String? endDate;
  int? seasonPeriod;
  int? seasonYear;
  int? episodesCount;
  int? episodeDuration;
  String? coverImage;
  String? coverColor;
  String? bannerImage;
  List<String>? genres;
  int? score;
  bool? nsfw;
  bool? hasCoverImage;
  int? id;
  int? weeklyAiringDay;
  List<Sagas>? sagas;
  String? trailerUrl;
  int? prequel;
  int? sequel;

  Documents(
      {this.anilistId,
      this.malId,
      this.tmdbId,
      this.format,
      this.status,
      this.titles,
      this.descriptions,
      this.startDate,
      this.endDate,
      this.seasonPeriod,
      this.seasonYear,
      this.episodesCount,
      this.episodeDuration,
      this.coverImage,
      this.coverColor,
      this.bannerImage,
      this.genres,
      this.score,
      this.nsfw,
      this.hasCoverImage,
      this.id,
      this.weeklyAiringDay,
      this.sagas,
      this.trailerUrl,
      this.prequel,
      this.sequel});

  Documents.fromJson(Map<String, dynamic> json) {
    anilistId = json['anilist_id'];
    malId = json['mal_id'];
    tmdbId = json['tmdb_id'];
    format = json['format'];
    status = json['status'];
    titles =
        json['titles'] != null ? Descriptions.fromJson(json['titles']) : null;
    descriptions = json['descriptions'] != null
        ? Descriptions.fromJson(json['descriptions'])
        : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    seasonPeriod = json['season_period'];
    seasonYear = json['season_year'];
    episodesCount = json['episodes_count'];
    episodeDuration = json['episode_duration'];
    coverImage = json['cover_image'];
    coverColor = json['cover_color'];
    bannerImage = json['banner_image'];
    genres = json['genres'].cast<String>();
    score = json['score'];
    nsfw = json['nsfw'];
    hasCoverImage = json['hasCoverImage'];
    id = json['id'];
    weeklyAiringDay = json['weekly_airing_day'];
    if (json['sagas'] != null) {
      sagas = <Sagas>[];
      json['sagas'].forEach((v) {
        sagas!.add(Sagas.fromJson(v));
      });
    }
    trailerUrl = json['trailer_url'];
    prequel = json['prequel'];
    sequel = json['sequel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['anilist_id'] = anilistId;
    data['mal_id'] = malId;
    data['tmdb_id'] = tmdbId;
    data['format'] = format;
    data['status'] = status;
    if (titles != null) {
      data['titles'] = titles!.toJson();
    }
    if (descriptions != null) {
      data['descriptions'] = descriptions!.toJson();
    }
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['season_period'] = seasonPeriod;
    data['season_year'] = seasonYear;
    data['episodes_count'] = episodesCount;
    data['episode_duration'] = episodeDuration;
    data['cover_image'] = coverImage;
    data['cover_color'] = coverColor;
    data['banner_image'] = bannerImage;
    data['genres'] = genres;
    data['score'] = score;
    data['nsfw'] = nsfw;
    data['hasCoverImage'] = hasCoverImage;
    data['id'] = id;
    data['weekly_airing_day'] = weeklyAiringDay;
    if (sagas != null) {
      data['sagas'] = sagas!.map((v) => v.toJson()).toList();
    }
    data['trailer_url'] = trailerUrl;
    data['prequel'] = prequel;
    data['sequel'] = sequel;
    return data;
  }
}

class Titles {
  String? rj;
  String? en;
  String? jp;
  String? fr;
  String? it;

  Titles({this.rj, this.en, this.jp, this.fr, this.it});

  Titles.fromJson(Map<String, dynamic> json) {
    rj = json['rj'];
    en = json['en'];
    jp = json['jp'];
    fr = json['fr'];
    it = json['it'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rj'] = rj;
    data['en'] = en;
    data['jp'] = jp;
    data['fr'] = fr;
    data['it'] = it;
    return data;
  }
}

class Descriptions {
  String? en;
  String? fr;
  String? it;
  String? jp;

  Descriptions({this.en, this.fr, this.it, this.jp});

  Descriptions.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    fr = json['fr'];
    it = json['it'];
    jp = json['jp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['fr'] = fr;
    data['it'] = it;
    data['jp'] = jp;
    return data;
  }
}

class Sagas {
  Descriptions? titles;
  Descriptions? descriptions;
  int? episodeFrom;
  int? episodeTo;
  int? episodesCount;

  Sagas(
      {this.titles,
      this.descriptions,
      this.episodeFrom,
      this.episodeTo,
      this.episodesCount});

  Sagas.fromJson(Map<String, dynamic> json) {
    titles =
        json['titles'] != null ? Descriptions.fromJson(json['titles']) : null;
    descriptions = json['descriptions'] != null
        ? Descriptions.fromJson(json['descriptions'])
        : null;
    episodeFrom = json['episode_from'];
    episodeTo = json['episode_to'];
    episodesCount = json['episodes_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (titles != null) {
      data['titles'] = titles!.toJson();
    }
    if (descriptions != null) {
      data['descriptions'] = descriptions!.toJson();
    }
    data['episode_from'] = episodeFrom;
    data['episode_to'] = episodeTo;
    data['episodes_count'] = episodesCount;
    return data;
  }
}
