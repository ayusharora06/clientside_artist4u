import 'dart:convert';
import 'package:artist4u/modals/verify_refer_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
class PostVerifyRefer{
	Future<VerifyReferModal> postVerifyRefer(String refercode) async{
		var client = http.Client();
 		 // ignore: avoid_init_to_null
		var refermodal = null;
		var url = 'http://$ip:3000/partner/verifyrefercode';
		try {
			var data=await getUserData();
			if(data['token'].length>5){
				var response = await client.post(
				url,
				headers:{
				"Authorization":"bearer ${data['token']}"
				},
				body:{
					'refercode':refercode
				}
     		 );
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				refermodal = VerifyReferModal.fromJson(jsonResponse);
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