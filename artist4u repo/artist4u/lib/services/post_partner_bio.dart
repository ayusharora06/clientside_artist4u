import 'dart:convert';
import 'package:artist4u/modals/post_partner_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
class PostPartnerBio{
	Future<PostPartnerBioModal> postPartnerBio(
		String name,
    String userid,
		String phonenumber,
		String email,
    String website,
		String street,
		String city,
		String state,
		String country,
    String description,
    String accountholdersname,
    String accountnumber,
    // ignore: non_constant_identifier_names
    String IFSC,
		String agreed
	) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var postPartnerBioModal = null;
		var url = 'http://$ip:3000/partner/addpartner';
		try {
      Map<String,dynamic> userdata;
      userdata=await getUserData();
			var response = await client.post(url,
       headers:{
          "Authorization":"bearer ${userdata['token']}"
        },
        body:{
          "name":name,
          "userid":userid,
          "phonenumber":phonenumber,
          "email":email,
          "website":website,
          "street":street,
          "city":city,
          "state":state,
          "country":country,
          "description":description,
          "agreed":agreed,
          "accountholdername":accountholdersname,
          "accountnumber":accountnumber,
          "IFSC":IFSC
        }
      );
			if (response.statusCode == 201) {
				var jsonResponse = json.decode(response.body);
        SharedPreferences userdata = await SharedPreferences.getInstance();
        userdata.setBool('ispartner', true);
				// debugPrint(jsonResponse.toString());
				postPartnerBioModal = PostPartnerBioModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
      if (response.statusCode == 500) {
    // ignore: unused_local_variable
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
			}
		}catch(Exception){
			return postPartnerBioModal;
		}
		return postPartnerBioModal;
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