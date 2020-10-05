import 'dart:convert';
import 'package:artist4u/modals/artist_type_model.dart';
import 'package:artist4u/modals/get_artist_list_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class GetArtistListModalFromServer{
	Future<GetArtistListl> getArtistListModalFromServer(String artisttype) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var artistListModal = null;
		var url = 'http://$ip:3000/artistlist/artistlist/$artisttype';
		try {
			var response = await client.get(url);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				artistListModal = GetArtistListl.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return artistListModal;
		}
		return artistListModal;
	}
}