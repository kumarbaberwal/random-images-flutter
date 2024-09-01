// To parse this JSON data, do
//
//     final randomImagesModel = randomImagesModelFromJson(jsonString);

import 'dart:convert';

import 'package:randomimages/domain/entity/random_images_entity.dart';

List<RandomImagesModel> randomImagesModelFromJson(String str) =>
    List<RandomImagesModel>.from(
        json.decode(str).map((x) => RandomImagesModel.fromJson(x)));

String randomImagesModelToJson(List<RandomImagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RandomImagesModel {
  String id;
  Urls urls;

  RandomImagesModel({
    required this.id,
    required this.urls,
  });

  factory RandomImagesModel.fromJson(Map<String, dynamic> json) =>
      RandomImagesModel(
        id: json["id"],
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urls": urls.toJson(),
      };
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}

extension RandomImagesXModel on RandomImagesModel {
  RandomImagesEntity toEntity() {
    return RandomImagesEntity(id: id, urls: urls.toEntity());
  }
}

extension UrlsXModel on Urls {
  UrlsEntity toEntity() {
    return UrlsEntity(
      raw: raw,
      full: full,
      regular: regular,
      small: small,
      thumb: thumb,
      smallS3: smallS3,
    );
  }
}
