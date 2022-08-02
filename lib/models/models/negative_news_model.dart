// To parse this JSON data, do
//
//     final allNewsModel = allNewsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class NegativeNewsModel {
  NegativeNewsModel({
    required this.success,
    required this.obj,
  });

  final bool success;
  final List<Obj> obj;

  factory NegativeNewsModel.fromRawJson(String str) => NegativeNewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NegativeNewsModel.fromJson(Map<String, dynamic> json) => NegativeNewsModel(
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

  final String id;
  final String newsUrl;
  final String imageUrl;
  final String title;
  final String text;
  final String sourceName;
  final String date;
  final List<String> topics;
  final String sentiment;
  final String type;
  final List<String> tickers;

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
    sentiment: json["sentiment"],
    type: json["type"],
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
    "sentiment": sentiment,
    "type": type,
    "tickers": List<dynamic>.from(tickers.map((x) => x)),
  };
}
