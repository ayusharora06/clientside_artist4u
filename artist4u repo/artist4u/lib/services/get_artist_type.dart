import 'dart:convert';
import 'package:artist4u/const.dart';
import 'package:artist4u/modals/artist_type_model.dart';
import 'package:artist4u/modals/offers_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetArtistType{
	Future<ArtistTypeModel> getArtistType() async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var artistTypeModel = null;
		var url = 'http://$ip:3000/home/artisttypes';
		try {
			var response = await client.get(url);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				debugPrint(jsonResponse.toString());
				artistTypeModel = ArtistTypeModel.fromJson(jsonResponse);
				debugPrint("model"+artistTypeModel);
			}
		}catch(Exception){
			return artistTypeModel;
		}
		return artistTypeModel;
	}
}