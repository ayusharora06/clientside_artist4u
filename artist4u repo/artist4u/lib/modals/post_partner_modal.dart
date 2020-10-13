// To parse this JSON data, do
//
//     final postPartnerBioModal = postPartnerBioModalFromJson(jsonString);

import 'dart:convert';

PostPartnerBioModal postPartnerBioModalFromJson(String str) => PostPartnerBioModal.fromJson(json.decode(str));

String postPartnerBioModalToJson(PostPartnerBioModal data) => json.encode(data.toJson());

class PostPartnerBioModal {
    PostPartnerBioModal({
        this.message,
        this.partnerid,
    });

    String message;
    String partnerid;

    factory PostPartnerBioModal.fromJson(Map<String, dynamic> json) => PostPartnerBioModal(
        message: json["message"],
        partnerid: json["partnerid"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "partnerid": partnerid,
    };
}
