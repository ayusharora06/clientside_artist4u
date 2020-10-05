// To parse this JSON data, do
//
//     final getArtistBioModal = getArtistBioModalFromJson(jsonString);

import 'dart:convert';

GetArtistBioModal getArtistBioModalFromJson(String str) => GetArtistBioModal.fromJson(json.decode(str));

String getArtistBioModalToJson(GetArtistBioModal data) => json.encode(data.toJson());

class GetArtistBioModal {
    GetArtistBioModal({
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
        this.maxhours,
        this.description,
        this.team,
        this.outstationtravel,
        this.unifiedprice,
        this.price,
        this.agreed,
        this.recommended,
        this.peopleschoice,
        this.v,
        this.profile,
        this.idproof,
    });

    List<Idproof> gallery;
    List<String> typesofshow;
    List<String> specialization;
    List<String> differentprices;
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
    String maxhours;
    String description;
    String team;
    String outstationtravel;
    String unifiedprice;
    String price;
    String agreed;
    String recommended;
    String peopleschoice;
    int v;
    Idproof profile;
    Idproof idproof;

    factory GetArtistBioModal.fromJson(Map<String, dynamic> json) => GetArtistBioModal(
        gallery: List<Idproof>.from(json["gallery"].map((x) => Idproof.fromJson(x))),
        typesofshow: List<String>.from(json["typesofshow"].map((x) => x)),
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        differentprices: List<String>.from(json["differentprices"].map((x) => x)),
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
        maxhours: json["maxhours"],
        description: json["description"],
        team: json["team"],
        outstationtravel: json["outstationtravel"],
        unifiedprice: json["unifiedprice"],
        price: json["price"],
        agreed: json["agreed"],
        recommended: json["recommended"],
        peopleschoice: json["peopleschoice"],
        v: json["__v"],
        profile: Idproof.fromJson(json["profile"]),
        idproof: Idproof.fromJson(json["idproof"]),
    );

    Map<String, dynamic> toJson() => {
        "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),
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
        "maxhours": maxhours,
        "description": description,
        "team": team,
        "outstationtravel": outstationtravel,
        "unifiedprice": unifiedprice,
        "price": price,
        "agreed": agreed,
        "recommended": recommended,
        "peopleschoice": peopleschoice,
        "__v": v,
        "profile": profile.toJson(),
        "idproof": idproof.toJson(),
    };
}

class Idproof {
    Idproof({
        this.fieldname,
        this.originalname,
        this.encoding,
        this.mimetype,
        this.destination,
        this.filename,
        this.path,
        this.size,
    });

    String fieldname;
    String originalname;
    String encoding;
    String mimetype;
    String destination;
    String filename;
    String path;
    int size;

    factory Idproof.fromJson(Map<String, dynamic> json) => Idproof(
        fieldname: json["fieldname"],
        originalname: json["originalname"],
        encoding: json["encoding"],
        mimetype: json["mimetype"],
        destination: json["destination"],
        filename: json["filename"],
        path: json["path"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "fieldname": fieldname,
        "originalname": originalname,
        "encoding": encoding,
        "mimetype": mimetype,
        "destination": destination,
        "filename": filename,
        "path": path,
        "size": size,
    };
}
