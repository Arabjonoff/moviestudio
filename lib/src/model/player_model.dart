// To parse this JSON data, do
//
//     final playerModel = playerModelFromJson(jsonString);

import 'dart:convert';

PlayerModel playerModelFromJson(String str) => PlayerModel.fromJson(json.decode(str));


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

}

class Result {

  String? key;

  Result({
    this.key,

  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    key: json["key"],

  );

}
