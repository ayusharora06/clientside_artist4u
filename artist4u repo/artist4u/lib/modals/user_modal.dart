// To parse this JSON data, do
//
//     final userModal = userModalFromJson(jsonString);

import 'dart:convert';

UserModal userModalFromJson(String str) => UserModal.fromJson(json.decode(str));

String userModalToJson(UserModal data) => json.encode(data.toJson());

class UserModal {
    UserModal({
        this.message,
        this.token,
        this.detail,
    });

    String message;
    String token;
    Detail detail;

    factory UserModal.fromJson(Map<String, dynamic> json) => UserModal(
        message: json["message"],
        token: json["token"],
        detail: Detail.fromJson(json["detail"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "detail": detail.toJson(),
    };
}

class Detail {
    Detail({
        this.artistid,
        this.artisttype,
        this.partnerid,
        this.ispartner,
        this.isartist,
        this.otp,
        this.mybookings,
        this.id,
        this.name,
        this.email,
        this.phone,
        this.v,
    });

    String artistid;
    String artisttype;
    String partnerid;
    bool ispartner;
    bool isartist;
    String otp;
    List<dynamic> mybookings;
    String id;
    String name;
    String email;
    String phone;
    int v;

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        artistid: json["artistid"],
        artisttype: json["artisttype"],
        partnerid: json["partnerid"],
        ispartner: json["ispartner"],
        isartist: json["isartist"],
        otp: json["otp"],
        mybookings: List<dynamic>.from(json["mybookings"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "artistid": artistid,
        "artisttype": artisttype,
        "partnerid": partnerid,
        "ispartner": ispartner,
        "isartist": isartist,
        "otp": otp,
        "mybookings": List<dynamic>.from(mybookings.map((x) => x)),
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "__v": v,
    };
}
