import 'dart:convert';
import 'package:artist4u/modals/artistbio_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
class PostArtistBio{
	Future<ArtistBioModal> postArtistBio(
		String name,
  // ignore: non_constant_identifier_names
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
    // ignore: non_constant_identifier_names
    String IFSC,
		String agreed
	) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var artistBioModal = null;
		var url = 'http://$ip:3000/artistbio/add_artistbio/$artist_type';
		try {
      Map<String,dynamic> userdata;
      userdata=await getUserData();
      // debugPrint('$userdata');
			var response = await client.post(url,body:{
				"name":name,
        "userid":userdata['_id'],
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
        // debugPrint('$jsonResponse');
        SharedPreferences userdata = await SharedPreferences.getInstance();
        userdata.setBool('isartist', true);
        userdata.setString('artistid',jsonResponse['_id']);
				// debugPrint(jsonResponse['_id'].toString());
				artistBioModal = ArtistBioModal.fromJson(jsonResponse);
				// debugPrint("model"+artistBioModal.toString());
			}
		}catch(Exception){
			return artistBioModal;
		}
		return artistBioModal;
	}
}
Future<Map<String,dynamic>> getUserData() async{
	SharedPreferences userdata=await SharedPreferences.getInstance();
	Map<String,dynamic> user={
		"token":userdata.getString('token'),
		"_id":userdata.getString('_id'),
	};
	// await userdata.clear();
	return user;
}  