import 'dart:convert';
import 'package:artist4u/modals/generate_refer.dart';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:artist4u/modals/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
class PostGenerateRefer{
	Future<GetReferModal> postGenerateRefer() async{
		var client = http.Client();
 		 // ignore: avoid_init_to_null
		var refermodal = null;
		var url = 'http://$ip:3000/partner/generaterefercode';
		try {
			var data=await getUserData();
			if(data['token'].length>5){
				var response = await client.post(
				url,
				headers:{
				"Authorization":"bearer ${data['token']}"
				},
				body:{
					'partnerid':data['partnerid']
				}
     		 );
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				refermodal = GetReferModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
		}
		}catch(Exception){
			return refermodal;
		}
		return refermodal;
	}
}
Future<Map<String,dynamic>> getUserData() async{
	SharedPreferences userdata=await SharedPreferences.getInstance();
	Map<String,dynamic> user={
		"token":userdata.getString('token'),
    	"message":userdata.getString('message'),
		"partnerid":userdata.getString('partnerid'),
	};
	// await userdata.clear();
	return user;
}  