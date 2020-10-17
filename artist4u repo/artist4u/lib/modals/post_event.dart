// To parse this JSON data, do
//
//     final postEventmodal = postEventmodalFromJson(jsonString);

import 'dart:convert';

PostEventmodal postEventmodalFromJson(String str) => PostEventmodal.fromJson(json.decode(str));

String postEventmodalToJson(PostEventmodal data) => json.encode(data.toJson());

class PostEventmodal {
    PostEventmodal({
        this.message,
    });

    String message;

    factory PostEventmodal.fromJson(Map<String, dynamic> json) => PostEventmodal(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
