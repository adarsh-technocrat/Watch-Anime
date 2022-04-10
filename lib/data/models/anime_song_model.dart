class AnimeSongsModel {
  int? statusCode;
  String? message;
  Data? data;
  String? version;

  AnimeSongsModel({this.statusCode, this.message, this.data, this.version});

  AnimeSongsModel.fromJson(Map<String, dynamic> json) {
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
  int? animeId;
  String? title;
  String? artist;
  String? album;
  int? year;
  int? season;
  int? duration;
  String? previewUrl;
  String? openSpotifyUrl;
  String? localSpotifyUrl;
  int? type;
  int? id;

  Documents(
      {this.animeId,
      this.title,
      this.artist,
      this.album,
      this.year,
      this.season,
      this.duration,
      this.previewUrl,
      this.openSpotifyUrl,
      this.localSpotifyUrl,
      this.type,
      this.id});

  Documents.fromJson(Map<String, dynamic> json) {
    animeId = json['anime_id'];
    title = json['title'];
    artist = json['artist'];
    album = json['album'];
    year = json['year'];
    season = json['season'];
    duration = json['duration'];
    previewUrl = json['preview_url'];
    openSpotifyUrl = json['open_spotify_url'];
    localSpotifyUrl = json['local_spotify_url'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['anime_id'] = animeId;
    data['title'] = title;
    data['artist'] = artist;
    data['album'] = album;
    data['year'] = year;
    data['season'] = season;
    data['duration'] = duration;
    data['preview_url'] = previewUrl;
    data['open_spotify_url'] = openSpotifyUrl;
    data['local_spotify_url'] = localSpotifyUrl;
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}
