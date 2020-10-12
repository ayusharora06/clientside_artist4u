import 'dart:convert';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:artist4u/modals/updateuserinfo.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class PostUpdateUserInfo{
	Future<UpdateUserInfo> postupdatename(String name) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var result = null;
		var url = 'http://$ip:3000/user/updatename';
		try {
			var response = await client.post(
				url,
				headers: {
					"Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNjZDA0ZDM2NjI4MjhlNzk2MjAiLCJwaG9uZSI6Ijk5OTA1MDA0czE1IiwiaWF0IjoxNjAyNTA5ODQzLCJleHAiOjE2MDI1MjQyNDN9.5Y8wRYNVjVyQNo6nMrP4jIELd5tbiLq8vFGLZaoPG8U"
				},
				body:{
				"name":'$name',
				"otp":'352770'
				}
			);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				result = UpdateUserInfo.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return result;
		}
		return result;
	}

	Future<UpdateUserInfo> postupdatephonenumber(String phone) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var result = null;
		var url = 'http://$ip:3000/user/updatephonenumber';
		try {
			var response = await client.post(
				url,
				headers: {
					"Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNjZDA0ZDM2NjI4MjhlNzk2MjAiLCJwaG9uZSI6Ijk5OTA1MDA0czE1IiwiaWF0IjoxNjAyNTA5ODQzLCJleHAiOjE2MDI1MjQyNDN9.5Y8wRYNVjVyQNo6nMrP4jIELd5tbiLq8vFGLZaoPG8U"
				},
				body:{
				"phone":'$phone',
				"otp":'693999'
				}
			);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				result = UpdateUserInfo.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return result;
		}
		return result;
	}

	Future<UpdateUserInfo> postupdateemail(String email) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var result = null;
		var url = 'http://$ip:3000/user/updateemail';
		try {
			var response = await client.post(
				url,
				headers: {
					"Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNjZDA0ZDM2NjI4MjhlNzk2MjAiLCJwaG9uZSI6Ijk5OTA1MDA0czE1IiwiaWF0IjoxNjAyNTA5ODQzLCJleHAiOjE2MDI1MjQyNDN9.5Y8wRYNVjVyQNo6nMrP4jIELd5tbiLq8vFGLZaoPG8U"
				},
				body:{
				"email":'$email',
				"otp":'783631'
				}
			);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				result = UpdateUserInfo.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return result;
		}
		return result;
	}
}