// To parse this JSON data, do
//
//     final verifyReferModal = verifyReferModalFromJson(jsonString);

import 'dart:convert';

VerifyReferModal verifyReferModalFromJson(String str) => VerifyReferModal.fromJson(json.decode(str));

String verifyReferModalToJson(VerifyReferModal data) => json.encode(data.toJson());

class VerifyReferModal {
    VerifyReferModal({
        this.message,
        this.partnerid,
        this.artistid,
        this.name,
    });

    String message;
    dynamic partnerid;
    String artistid;
    String name;

    factory VerifyReferModal.fromJson(Map<String, dynamic> json) => VerifyReferModal(
        message: json["message"],
        partnerid: json["partnerid"],
        artistid: json["artistid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "partnerid": partnerid,
        "artistid": artistid,
        "name": name,
    };
}
