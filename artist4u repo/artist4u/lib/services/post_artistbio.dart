import 'dart:convert';
import 'package:artist4u/modals/artist_type_model.dart';
import 'package:artist4u/modals/artistbio_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class PostArtistBio{
	Future<ArtistBioModal> postArtistBio(
		String name,
		String artist_type,
    String experience,
		String gender,
		String dateofbirth,
		String phonenumber,
		String email,
		String street,
		String city,
		String state,
		String country,
		List typesofshow,
		List specialization,
    List selectedlanguage,
		String minhours,
		String maxhours,
		String description,
		String team,
		String outstationtravel,
		String unifiedprice,
		String price,
		List dynamicprices,
    String accountholdersname,
    String accountnumber,
    String IFSC,
		String agreed
	) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var artistBioModal = null;
		var url = 'http://$ip:3000/artistbio/add_artistbio/$artist_type';
		try {
			var response = await client.post(url,body:{
				"name":name,
				"artist_type":artist_type,
        "experience":experience,
				"gender":gender,
				"dateofbirth":dateofbirth,
				"phonenumber":phonenumber,
				"email":email,
				"street":street,
				"city":city,
				"state":state,
				"country":country,
				"typesofshow":json.encode(typesofshow),
				"specialization": json.encode(specialization),
        "languagepreffered":json.encode(selectedlanguage),
				"minhours":minhours,
				"maxhours":maxhours,
				"description":description,
				"team":team,
				"outstationtravel":outstationtravel,
				"unifiedprice":unifiedprice,
				"price":price,
				"differentprices":jsonEncode(dynamicprices),
				"agreed":agreed,
				"recommended":false.toString(),
				"peopleschoice":0.toString(),
        "accountholdername":accountholdersname,
        "accountnumber":accountnumber,
        "IFSC":IFSC
			});
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				artistBioModal = ArtistBioModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return artistBioModal;
		}
		return artistBioModal;
	}
}