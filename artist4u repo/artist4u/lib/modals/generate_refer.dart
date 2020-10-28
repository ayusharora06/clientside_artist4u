// To parse this JSON data, do
//
//     final getReferModal = getReferModalFromJson(jsonString);

import 'dart:convert';

GetReferModal getReferModalFromJson(String str) => GetReferModal.fromJson(json.decode(str));

String getReferModalToJson(GetReferModal data) => json.encode(data.toJson());

class GetReferModal {
    GetReferModal({
        this.createAt,
        this.id,
        this.partnerid,
        this.refercode,
        this.v,
    });

    DateTime createAt;
    String id;
    String partnerid;
    String refercode;
    int v;

    factory GetReferModal.fromJson(Map<String, dynamic> json) => GetReferModal(
        createAt: DateTime.parse(json["createAt"]),
        id: json["_id"],
        partnerid: json["partnerid"],
        refercode: json["refercode"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "createAt": createAt.toIso8601String(),
        "_id": id,
        "partnerid": partnerid,
        "refercode": refercode,
        "__v": v,
    };
}
