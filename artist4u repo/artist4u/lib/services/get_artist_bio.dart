import 'dart:convert';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:http/http.dart' as http;

import '../const.dart';
class GetArtistBio{
	Future<GetArtistBioModal> getArtistBio(String artisttype,String id) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var artistBioModal = null;
		var url = 'http://$ip:3000/artistbio/get_artistbio/$artisttype/$id';
		try {
			var response = await client.get(url);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				artistBioModal = GetArtistBioModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return artistBioModal;
		}
		return artistBioModal;
	}
}