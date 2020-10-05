// To parse this JSON data, do
//
//     final artistBioModal = artistBioModalFromJson(jsonString);

import 'dart:convert';

ArtistBioModal artistBioModalFromJson(String str) => ArtistBioModal.fromJson(json.decode(str));

String artistBioModalToJson(ArtistBioModal data) => json.encode(data.toJson());

class ArtistBioModal {
    ArtistBioModal({
        this.gallery,
        this.typesofshow,
        this.specialization,
        this.differentprices,
        this.id,
        this.name,
        this.artistType,
        this.gender,
        this.dateofbirth,
        this.phonenumber,
        this.email,
        this.street,
        this.city,
        this.state,
        this.country,
        this.minhours,
        this.maxhour,
        this.description,
        this.team,
        this.outstationtravel,
        this.unifiedprice,
        this.price,
        this.agreed,
        this.recommended,
        this.peopleschoice,
    });

    List<dynamic> gallery;
    List<String> typesofshow;
    List<String> specialization;
    List<dynamic> differentprices;
    String id;
    String name;
    String artistType;
    String gender;
    String dateofbirth;
    String phonenumber;
    String email;
    String street;
    String city;
    String state;
    String country;
    String minhours;
    String maxhour;
    String description;
    String team;
    String outstationtravel;
    String unifiedprice;
    String price;
    String agreed;
    String recommended;
    String peopleschoice;

    factory ArtistBioModal.fromJson(Map<String, dynamic> json) => ArtistBioModal(
        gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
        typesofshow: List<String>.from(json["typesofshow"].map((x) => x)),
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        differentprices: List<dynamic>.from(json["differentprices"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        artistType: json["artist_type"],
        gender: json["gender"],
        dateofbirth: json["dateofbirth"],
        phonenumber: json["phonenumber"],
        email: json["email"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        minhours: json["minhours"],
        maxhour: json["maxhour"],
        description: json["description"],
        team: json["team"],
        outstationtravel: json["outstationtravel"],
        unifiedprice: json["unifiedprice"],
        price: json["price"],
        agreed: json["agreed"],
        recommended: json["recommended"],
        peopleschoice: json["peopleschoice"],
    );

    Map<String, dynamic> toJson() => {
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "typesofshow": List<dynamic>.from(typesofshow.map((x) => x)),
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "differentprices": List<dynamic>.from(differentprices.map((x) => x)),
        "_id": id,
        "name": name,
        "artist_type": artistType,
        "gender": gender,
        "dateofbirth": dateofbirth,
        "phonenumber": phonenumber,
        "email": email,
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "minhours": minhours,
        "maxhour": maxhour,
        "description": description,
        "team": team,
        "outstationtravel": outstationtravel,
        "unifiedprice": unifiedprice,
        "price": price,
        "agreed": agreed,
        "recommended": recommended,
        "peopleschoice": peopleschoice,
    };
}
