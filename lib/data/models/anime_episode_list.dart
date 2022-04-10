class AnimeEpisodeModel {
  Data? data;

  AnimeEpisodeModel({this.data});

  AnimeEpisodeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Documents>? documents;

  Data({this.documents});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  int? animeId;
  int? number;
  String? title;
  String? video;
  VideoHeaders? videoHeaders;
  String? format;
  String? locale;
  bool? isDub;
  int? id;

  Documents(
      {this.animeId,
      this.number,
      this.title,
      this.video,
      this.videoHeaders,
      this.format,
      this.locale,
      this.isDub,
      this.id});

  Documents.fromJson(Map<String, dynamic> json) {
    animeId = json['anime_id'];
    number = json['number'];
    title = json['title'];
    video = json['video'];
    videoHeaders = json['video_headers'] != null
        ? VideoHeaders.fromJson(json['video_headers'])
        : null;
    format = json['format'];
    locale = json['locale'];
    isDub = json['is_dub'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['anime_id'] = animeId;
    data['number'] = number;
    data['title'] = title;
    data['video'] = video;
    if (videoHeaders != null) {
      data['video_headers'] = videoHeaders!.toJson();
    }
    data['format'] = format;
    data['locale'] = locale;
    data['is_dub'] = isDub;
    data['id'] = id;
    return data;
  }
}

class VideoHeaders {
  String? referer;

  VideoHeaders({this.referer});

  VideoHeaders.fromJson(Map<String, dynamic> json) {
    referer = json['referer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referer'] = referer;
    return data;
  }
}
