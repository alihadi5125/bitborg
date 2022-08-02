// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class LoginModel {
  LoginModel({
    required this.success,
    required this.jwt,
  });

  bool success;
  String jwt;

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    jwt: json["jwt"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "jwt": jwt,
  };
}
