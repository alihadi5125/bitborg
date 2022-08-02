// To parse this JSON data, do
//
//     final allSignalModel = allSignalModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllSignalModel {
  AllSignalModel({
    required this.id,
    required this.pair,
    required this.type,
    required this.risk,
    required this.action,
    required this.buyingZone,
    required this.target,
    required this.exchange,
    required this.link,
    required this.createdAt,
    required this.isDeleted,
    required this.allSignalModelId,
    required this.exhange,
  });

  final String id;
  final dynamic pair;
  final String type;
  final String risk;
  final String action;
  final String buyingZone;
  final List<Target> target;
  final String exchange;
  final String link;
  final int createdAt;
  final bool isDeleted;
  final String allSignalModelId;
  final String exhange;

  factory AllSignalModel.fromRawJson(String str) => AllSignalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllSignalModel.fromJson(Map<String, dynamic> json) => AllSignalModel(
    id: json["_id"],
    pair: json["pair"],
    type: json["type"] == null ? "N/A" : json["type"],
    risk: json["risk"],
    action: json["action"],
    buyingZone: json["buyingZone"],
    target: List<Target>.from(json["target"].map((x) => Target.fromJson(x))),
    exchange: json["exchange"] == null ? "" : json["exchange"],
    link: json["link"]??"",
    createdAt: json["created_at"],
    isDeleted: json["is_deleted"],
    allSignalModelId: json["id"],
    exhange: json["exhange"] == null ? "" : json["exhange"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "pair": pair,
    "type": type == null ? null : type,
    "risk": risk,
    "action": action,
    "buyingZone": buyingZone,
    "target": List<dynamic>.from(target.map((x) => x.toJson())),
    "exchange": exchange == null ? null : exchange,
    "link": link,
    "created_at": createdAt,
    "is_deleted": isDeleted,
    "id": allSignalModelId,
    "exhange": exhange == null ? null : exhange,
  };
}

class Target {
  Target({
    required this.leverage,
    required this.remark,
    required this.pric,
  });

  final String leverage;
  final String remark;
  final dynamic pric;

  factory Target.fromRawJson(String str) => Target.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Target.fromJson(Map<String, dynamic> json) => Target(
    leverage: json["leverage"],
    remark: json["remark"],
    pric: json["pric"],
  );

  Map<String, dynamic> toJson() => {
    "leverage": leverage,
    "remark": remark,
    "pric": pric,
  };
}
