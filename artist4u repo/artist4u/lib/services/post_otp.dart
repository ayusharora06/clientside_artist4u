import 'dart:convert';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:artist4u/modals/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class PostOtp{
	Future<Otp> postotp() async{
		var client = http.Client();
 		 // ignore: avoid_init_to_null
		var otpmodal = null;
		var url = 'http://$ip:3000/user/otp/update';
		try {
			var response = await client.post(
				url,
				headers:{
				"Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImF5dXNoQGdtYWlsLmNvbSIsImlkIjoiNWY5MTZhOTY5NzBmYjQxYWUwYjM3MmMyIiwicGhvbmUiOiI4Nzc3MyIsImlhdCI6MTYwMzM2NjQ1MSwiZXhwIjoxNjAzMzgwODUxfQ.BCDc27bjUYkrTST7RP5B8s_eqIYs_F3E-Z1dIG3HJ8k"
				},
				body:{
				
				}
     		 );
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				otpmodal = Otp.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return otpmodal;
		}
		return otpmodal;
	}

	Future<Otp> postotploginphone(String phone) async{
		var client = http.Client();
 		 // ignore: avoid_init_to_null
		var otpmodal = null;
		var url = 'http://$ip:3000/user/otp/login/phone';
		try {
			var response = await client.post(
				url,
				body:{
					"phone":phone
				}
     		 );
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				debugPrint(jsonResponse.toString());
				otpmodal = Otp.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return otpmodal;
		}
		return otpmodal;
	}

	Future<Otp> postotploginemail(String email) async{
		var client = http.Client();
 		 // ignore: avoid_init_to_null
		var otpmodal = null;
		print(email);
		var url = 'http://$ip:3000/user/otp/login/email';
		try {
			var response = await client.post(
				url,
				body:{
					"email":email
				}
     		 );
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				debugPrint(jsonResponse.toString());
				otpmodal = Otp.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}catch(Exception){
			return otpmodal;
		}
		return otpmodal;
	}


}