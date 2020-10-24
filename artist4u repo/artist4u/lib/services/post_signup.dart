import 'dart:convert';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:artist4u/modals/user_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
				// debugPrint(jsonResponse['detail']['_id'].toString());
				SharedPreferences userdata = await SharedPreferences.getInstance();
        		userdata.setString('token', jsonResponse['token']);
				userdata.setString('message', jsonResponse['message']);
				userdata.setString('artistid', jsonResponse['detail']['artistid']);
				userdata.setString('artisttype', jsonResponse['detail']['artisttype']);
				userdata.setString('partnerid', jsonResponse['detail']['partnerid']);
				userdata.setBool('ispartner', jsonResponse['detail']['ispartner']);
				userdata.setBool('isartist', jsonResponse['detail']['isartist']);
				// userdata.setString('otp', jsonResponse['token']);
				// userdata.setString('token', jsonResponse['token']);
				// // userdata.setString('_id', jsonResponse['detail']['_id']);
				// // String a=await userdata.getString('_id');
				// debugPrint(a);
				userdata.setString('name', jsonResponse['detail']['name']);
				userdata.setString('email', jsonResponse['detail']['email']);
				userdata.setString('phone', jsonResponse['detail']['phone']);
				usermodal = UserModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			debugPrint(Exception.toString());
		}
		return usermodal;
	}
}
 