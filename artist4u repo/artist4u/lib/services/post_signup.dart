import 'dart:convert';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:artist4u/modals/user_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class PostSignup{
	Future<UserModal> postSignup(
		String name,
		String email,
		String phone,
	) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var usermodal = null;
		var url = 'http://$ip:3000/user/signup';
		try {
			var response = await client.post(
				url,
				body:{
					"name":name,
					"phone":phone,
					'email':email
				}
			);
			if (response.statusCode == 201) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				usermodal = UserModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			debugPrint(Exception.toString());
			return usermodal;
		}
		return usermodal;
	}
}