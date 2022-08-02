// To parse this JSON data, do
//
//     final favCoinsModel = favCoinsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class FavCoinsModel {
  FavCoinsModel({
    required this.success,
    required this.users,
  });

  final bool success;
  final Users users;

  factory FavCoinsModel.fromRawJson(String str) => FavCoinsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavCoinsModel.fromJson(Map<String, dynamic> json) => FavCoinsModel(
    success: json["success"],
    users: Users.fromJson(json["users"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "users": users.toJson(),
  };
}

class Users {
  Users({
    required this.id,
    required this.userId,
    required this.coins,
    required this.createdAt,
  });

  final String id;
  final String userId;
  final List<String> coins;
  final int createdAt;

  factory Users.fromRawJson(String str) => Users.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["_id"],
    userId: json["user_id"],
    coins: List<String>.from(json["coins"].map((x) => x)),
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user_id": userId,
    "coins": List<dynamic>.from(coins.map((x) => x)),
    "created_at": createdAt,
  };
}
