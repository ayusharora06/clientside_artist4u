// To parse this JSON data, do
//
//     final updateUserInfo = updateUserInfoFromJson(jsonString);

import 'dart:convert';

UpdateUserInfo updateUserInfoFromJson(String str) => UpdateUserInfo.fromJson(json.decode(str));

String updateUserInfoToJson(UpdateUserInfo data) => json.encode(data.toJson());

class UpdateUserInfo {
    UpdateUserInfo({
        this.message,
    });

    String message;

    factory UpdateUserInfo.fromJson(Map<String, dynamic> json) => UpdateUserInfo(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
