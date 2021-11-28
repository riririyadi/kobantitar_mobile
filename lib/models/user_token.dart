// To parse this JSON data, do
//
//     final userToken = userTokenFromJson(jsonString);

import 'dart:convert';

UserToken userTokenFromJson(String str) => UserToken.fromJson(json.decode(str));

String userTokenToJson(UserToken data) => json.encode(data.toJson());

class UserToken {
  UserToken({
    this.token,
  });

  String? token;

  factory UserToken.fromJson(Map<String, dynamic> json) => UserToken(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
