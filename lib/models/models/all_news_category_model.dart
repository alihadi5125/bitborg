// To parse this JSON data, do
//
//     final allNewsModel = allNewsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllNewsModel {
  AllNewsModel({
    required this.success,
    required this.obj,
  });

  bool success;
  List<Obj> obj;

  factory AllNewsModel.fromRawJson(String str) => AllNewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllNewsModel.fromJson(Map<String, dynamic> json) => AllNewsModel(
    success: json["success"],
    obj: List<Obj>.from(json["obj"].map((x) => Obj.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "obj": List<dynamic>.from(obj.map((x) => x.toJson())),
  };
}

class Obj {
  Obj({
    required this.id,
    required this.newsUrl,
    required this.imageUrl,
    required this.title,
    required this.text,
    required this.sourceName,
    required this.date,
    required this.topics,
    required this.sentiment,
    required this.type,
    required this.tickers,
  });

  String id;
  String newsUrl;
  String imageUrl;
  String title;
  String text;
  String sourceName;
  String date;
  List<String> topics;
  Sentiment? sentiment;
  Type? type;
  List<String> tickers;

  factory Obj.fromRawJson(String str) => Obj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    id: json["_id"],
    newsUrl: json["news_url"],
    imageUrl: json["image_url"],
    title: json["title"],
    text: json["text"],
    sourceName: json["source_name"],
    date: json["date"],
    topics: List<String>.from(json["topics"].map((x) => x)),
    sentiment: sentimentValues.map[json["sentiment"]],
    type: typeValues.map[json["type"]],
    tickers: List<String>.from(json["tickers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "news_url": newsUrl,
    "image_url": imageUrl,
    "title": title,
    "text": text,
    "source_name": sourceName,
    "date": date,
    "topics": List<dynamic>.from(topics.map((x) => x)),
    "sentiment": sentimentValues.reverse[sentiment],
    "type": typeValues.reverse[type],
    "tickers": List<dynamic>.from(tickers.map((x) => x)),
  };
}

enum Sentiment { NEUTRAL, POSITIVE, NEGATIVE }

final sentimentValues = EnumValues({
  "Negative": Sentiment.NEGATIVE,
  "Neutral": Sentiment.NEUTRAL,
  "Positive": Sentiment.POSITIVE
});

enum Type { ARTICLE, VIDEO }

final typeValues = EnumValues({
  "Article": Type.ARTICLE,
  "Video": Type.VIDEO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
