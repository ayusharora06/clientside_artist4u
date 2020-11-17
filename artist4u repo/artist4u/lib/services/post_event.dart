import 'dart:convert';
import 'package:artist4u/modals/post_event.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';
class PostEvent{
	Future<PostEventmodal> postEvent(
    String artistname,
    String artistype,
    String typeofevent,
    String gatheringsize,
    List<Map<dynamic, dynamic>> eventdetail,
    String location,
    String requiements,
    String refercode,
    String price,

  ) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var postEventmodal = null;
		var url = 'http://$ip:3000/events/addevent';
		try {
			Map<String,dynamic> userdata;
			userdata=await getUserData();
			// debugPrint(userdata.toString());
			var response = await client.post(url,
			headers:{
			"Authorization":"bearer ${userdata['token']}"
			},
			body:{
			"artistid":userdata['artistid'],
			"userid": userdata['_id'],
			"artistname": artistname,
			"username": userdata['name'],
			"artisttype": artistype,
			"typesofevent": typeofevent,
			"gatheringsize": gatheringsize,
			"eventdetails": jsonEncode(eventdetail),
			"location": location,
			"requiements": requiements,
			"refercode":refercode,
			"price": price,
			}
		);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
        debugPrint(jsonResponse.toString());
				postEventmodal = PostEventmodal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
      if (response.statusCode == 400) {
    // ignore: unused_local_variable
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
			}
		}catch(Exception){
			return postEventmodal;
		}
		return postEventmodal;
	}
}

Future<Map<String,dynamic>> getUserData() async{
	SharedPreferences userdata=await SharedPreferences.getInstance();
	Map<String,dynamic> user={
		"token":userdata.getString('token'),
		"artistid":userdata.getString('artistid'),
		"_id":userdata.getString('_id'),
		"name":userdata.getString('name'),
	};
	// await userdata.clear();
	return user;
}  