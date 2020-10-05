// To parse this JSON data, do
//
//     final artistTypeModel = artistTypeModelFromJson(jsonString);

import 'dart:convert';

ArtistTypeModel artistTypeModelFromJson(String str) => ArtistTypeModel.fromJson(json.decode(str));

String artistTypeModelToJson(ArtistTypeModel data) => json.encode(data.toJson());

class ArtistTypeModel {
    ArtistTypeModel({
        this.result,
    });

    List<Result> result;

    factory ArtistTypeModel.fromJson(Map<String, dynamic> json) => ArtistTypeModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.artistType,
        this.image,
        this.v,
    });

    String id;
    String artistType;
    String image;
    int v;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        artistType: json["artistType"],
        image: json["Image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "artistType": artistType,
        "Image": image,
        "__v": v,
    };
}
