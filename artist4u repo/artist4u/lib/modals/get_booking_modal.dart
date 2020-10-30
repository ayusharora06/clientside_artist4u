// To parse this JSON data, do
//
//     final getBookingModal = getBookingModalFromJson(jsonString);

import 'dart:convert';

GetBookingModal getBookingModalFromJson(String str) => GetBookingModal.fromJson(json.decode(str));

String getBookingModalToJson(GetBookingModal data) => json.encode(data.toJson());

class GetBookingModal {
    GetBookingModal({
        this.result,
    });

    List<Result> result;

    factory GetBookingModal.fromJson(Map<String, dynamic> json) => GetBookingModal(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.artistid,
        this.userid,
        this.artistname,
        this.username,
        this.artisttype,
        this.typesofevent,
        this.gatheringsize,
        this.eventdetails,
        this.location,
        this.requiements,
        this.status,
        this.price,
        this.refercode,
    });

    String artistid;
    String userid;
    String artistname;
    String username;
    String artisttype;
    String typesofevent;
    String gatheringsize;
    String eventdetails;
    String location;
    String requiements;
    String status;
    String price;
    String refercode;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        artistid: json["artistid"],
        userid: json["userid"],
        artistname: json["artistname"],
        username: json["username"],
        artisttype: json["artisttype:"],
        typesofevent: json["typesofevent"],
        gatheringsize: json["gatheringsize"],
        eventdetails: json["eventdetails"],
        location: json["location"],
        requiements: json["requiements"],
        status: json["status"],
        price: json["price"],
        refercode: json["refercode"],
    );

    Map<String, dynamic> toJson() => {
        "artistid": artistid,
        "userid": userid,
        "artistname": artistname,
        "username": username,
        "artisttype:": artisttype,
        "typesofevent": typesofevent,
        "gatheringsize": gatheringsize,
        "eventdetails": eventdetails,
        "location": location,
        "requiements": requiements,
        "status": status,
        "price": price,
        "refercode": refercode,
    };
}
