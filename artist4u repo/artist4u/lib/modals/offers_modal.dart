// To parse this JSON data, do
//
//     final offerModal = offerModalFromJson(jsonString);

import 'dart:convert';

OfferModal offerModalFromJson(String str) => OfferModal.fromJson(json.decode(str));

String offerModalToJson(OfferModal data) => json.encode(data.toJson());

class OfferModal {
    OfferModal({
        this.result,
    });

    List<Result> result;

    factory OfferModal.fromJson(Map<String, dynamic> json) => OfferModal(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.offername,
        this.image,
        this.v,
    });

    String id;
    String offername;
    String image;
    int v;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        offername: json["offername"],
        image: json["Image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "offername": offername,
        "Image": image,
        "__v": v,
    };
}
