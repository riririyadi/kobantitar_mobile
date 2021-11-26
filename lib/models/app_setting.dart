// To parse this JSON data, do
//
//     final appSetting = appSettingFromJson(jsonString);

import 'dart:convert';

AppSetting appSettingFromJson(String str) =>
    AppSetting.fromJson(json.decode(str));

String appSettingToJson(AppSetting data) => json.encode(data.toJson());

class AppSetting {
  AppSetting({
    this.appVersionName,
    this.appVersionNumber,
    this.backendVersion,
  });

  String? appVersionName;
  String? appVersionNumber;
  String? backendVersion;

  factory AppSetting.fromJson(Map<String, dynamic> json) => AppSetting(
        appVersionName: json["app_version_name"],
        appVersionNumber: json["app_version_number"],
        backendVersion: json["backend_version"],
      );

  Map<String, dynamic> toJson() => {
        "app_version_name": appVersionName,
        "app_version_number": appVersionNumber,
        "backend_version": backendVersion,
      };
}
