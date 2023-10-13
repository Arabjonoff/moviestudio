// To parse this JSON data, do
//
//     final playerModel = playerModelFromJson(jsonString);

import 'dart:convert';

PlayerModel playerModelFromJson(String str) => PlayerModel.fromJson(json.decode(str));

String playerModelToJson(PlayerModel data) => json.encode(data.toJson());

class PlayerModel {
  int? id;
  List<Result>? results;

  PlayerModel({
    this.id,
    this.results,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
    id: json["id"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Iso6391? iso6391;
  Iso31661? iso31661;
  String? name;
  String? key;
  Site? site;
  int? size;
  Type? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    iso6391: iso6391Values.map[json["iso_639_1"]]!,
    iso31661: iso31661Values.map[json["iso_3166_1"]]!,
    name: json["name"],
    key: json["key"],
    site: siteValues.map[json["site"]]!,
    size: json["size"],
    type: typeValues.map[json["type"]]!,
    official: json["official"],
    publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391Values.reverse[iso6391],
    "iso_3166_1": iso31661Values.reverse[iso31661],
    "name": name,
    "key": key,
    "site": siteValues.reverse[site],
    "size": size,
    "type": typeValues.reverse[type],
    "official": official,
    "published_at": publishedAt?.toIso8601String(),
    "id": id,
  };
}

enum Iso31661 {
  US
}

final iso31661Values = EnumValues({
  "US": Iso31661.US
});

enum Iso6391 {
  EN
}

final iso6391Values = EnumValues({
  "en": Iso6391.EN
});

enum Site {
  YOU_TUBE
}

final siteValues = EnumValues({
  "YouTube": Site.YOU_TUBE
});

enum Type {
  CLIP,
  FEATURETTE,
  TEASER,
  TRAILER
}

final typeValues = EnumValues({
  "Clip": Type.CLIP,
  "Featurette": Type.FEATURETTE,
  "Teaser": Type.TEASER,
  "Trailer": Type.TRAILER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
