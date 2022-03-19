import 'dart:convert';

class AnimeListModel {
  int? statusCode;
  String? message;
  Data? data;
  String? version;

  AnimeListModel({this.statusCode, this.message, this.data, this.version});

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.toMap(),
      'version': version,
    };
  }

  factory AnimeListModel.fromMap(Map<String, dynamic> map) {
    return AnimeListModel(
      statusCode: map['statusCode']?.toInt(),
      message: map['message'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
      version: map['version'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeListModel.fromJson(String source) =>
      AnimeListModel.fromMap(json.decode(source));
}

class Data {
  int? currentPage;
  int? count;
  List<Anime>? documents;
  int? lastPage;

  Data({this.currentPage, this.count, this.documents, this.lastPage});

  Map<String, dynamic> toMap() {
    return {
      'currentPage': currentPage,
      'count': count,
      'documents': documents?.map((x) => x?.toMap())?.toList(),
      'lastPage': lastPage,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      currentPage: map['currentPage']?.toInt(),
      count: map['count']?.toInt(),
      documents: map['documents'] != null
          ? List<Anime>.from(map['documents']?.map((x) => Anime.fromMap(x)))
          : null,
      lastPage: map['lastPage']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class Anime {
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

  Anime(
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

  Map<String, dynamic> toMap() {
    return {
      'anilistId': anilistId,
      'malId': malId,
      'tmdbId': tmdbId,
      'format': format,
      'status': status,
      'titles': titles?.toMap(),
      'descriptions': descriptions?.toMap(),
      'startDate': startDate,
      'endDate': endDate,
      'seasonPeriod': seasonPeriod,
      'seasonYear': seasonYear,
      'episodesCount': episodesCount,
      'episodeDuration': episodeDuration,
      'coverImage': coverImage,
      'coverColor': coverColor,
      'bannerImage': bannerImage,
      'genres': genres,
      'score': score,
      'nsfw': nsfw,
      'hasCoverImage': hasCoverImage,
      'id': id,
      'weeklyAiringDay': weeklyAiringDay,
      'sagas': sagas?.map((x) => x?.toMap())?.toList(),
      'trailerUrl': trailerUrl,
      'prequel': prequel,
      'sequel': sequel,
    };
  }

  factory Anime.fromMap(Map<String, dynamic> map) {
    print(map);
    return Anime(
      anilistId: map['anilistId']?.toInt(),
      malId: map['malId']?.toInt(),
      tmdbId: map['tmdbId']?.toInt(),
      format: map['format']?.toInt(),
      status: map['status']?.toInt(),
      titles:
          map['titles'] != null ? Descriptions.fromMap(map['titles']) : null,
      descriptions: map['descriptions'] != null
          ? Descriptions.fromMap(map['descriptions'])
          : null,
      startDate: map['startDate'],
      endDate: map['endDate'],
      seasonPeriod: map['seasonPeriod']?.toInt(),
      seasonYear: map['seasonYear']?.toInt(),
      episodesCount: map['episodesCount']?.toInt(),
      episodeDuration: map['episodeDuration']?.toInt(),
      coverImage: map['cover_image'],
      coverColor: map['coverColor'],
      bannerImage: map['bannerImage'],
      genres: List<String>.from(map['genres']),
      score: map['score']?.toInt(),
      nsfw: map['nsfw'],
      hasCoverImage: map['hasCoverImage'],
      id: map['id']?.toInt(),
      weeklyAiringDay: map['weeklyAiringDay']?.toInt(),
      sagas: map['sagas'] != null
          ? List<Sagas>.from(map['sagas']?.map((x) => Sagas.fromMap(x)))
          : null,
      trailerUrl: map['trailerUrl'],
      prequel: map['prequel']?.toInt(),
      sequel: map['sequel']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Anime.fromJson(String source) => Anime.fromMap(json.decode(source));
}

class Titles {
  String? rj;
  String? en;
  String? jp;
  String? fr;
  String? it;

  Titles({this.rj, this.en, this.jp, this.fr, this.it});

  Map<String, dynamic> toMap() {
    return {
      'rj': rj,
      'en': en,
      'jp': jp,
      'fr': fr,
      'it': it,
    };
  }

  factory Titles.fromMap(Map<String, dynamic> map) {
    return Titles(
      rj: map['rj'],
      en: map['en'],
      jp: map['jp'],
      fr: map['fr'],
      it: map['it'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Titles.fromJson(String source) => Titles.fromMap(json.decode(source));
}

class Descriptions {
  String? en;
  String? fr;
  String? it;
  String? jp;

  Descriptions({this.en, this.fr, this.it, this.jp});

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'fr': fr,
      'it': it,
      'jp': jp,
    };
  }

  factory Descriptions.fromMap(Map<String, dynamic> map) {
    return Descriptions(
      en: map['en'],
      fr: map['fr'],
      it: map['it'],
      jp: map['jp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Descriptions.fromJson(String source) =>
      Descriptions.fromMap(json.decode(source));
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

  Map<String, dynamic> toMap() {
    return {
      'titles': titles?.toMap(),
      'descriptions': descriptions?.toMap(),
      'episodeFrom': episodeFrom,
      'episodeTo': episodeTo,
      'episodesCount': episodesCount,
    };
  }

  factory Sagas.fromMap(Map<String, dynamic> map) {
    return Sagas(
      titles:
          map['titles'] != null ? Descriptions.fromMap(map['titles']) : null,
      descriptions: map['descriptions'] != null
          ? Descriptions.fromMap(map['descriptions'])
          : null,
      episodeFrom: map['episodeFrom']?.toInt(),
      episodeTo: map['episodeTo']?.toInt(),
      episodesCount: map['episodesCount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sagas.fromJson(String source) => Sagas.fromMap(json.decode(source));
}
