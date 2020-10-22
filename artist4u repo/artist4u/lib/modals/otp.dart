// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);

import 'dart:convert';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

class Otp {
    Otp({
        this.message,
    });

    String message;

    factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
