import 'dart:convert';
import 'package:artist4u/modals/post_event.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class PostEvent{
	Future<PostEventmodal> postEvent(
    String artistid,
    String userid,
    String artistname,
    String username,
    String artistype,
    String typeofevent,
    String gatheringsize,
    List<Map<dynamic, dynamic>> eventdetail,
    String location,
    String requiements,
    String price,

  ) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var postEventmodal = null;
		var url = 'http://$ip:3000/events/addevent';
		try {
			var response = await client.post(url,
       headers:{
          "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNkOTA0ZDM2NjI4MjhlNzk2MjIiLCJwaG9uZSI6Ijk5OTA1MDA0MTUiLCJpYXQiOjE2MDI5MzQ0NTIsImV4cCI6MTYwMjk0ODg1Mn0.nuCSbHPFlQA-nfBWBzNuNC-VbTp2AZlNiMX1z7ijyEg"
        },
        body:{
          "artistid":artistid,
          "userid": userid,
          "artistname": artistname,
          "username": username,
          "artisttype": artistype,
          "typesofevent": typeofevent,
          "gatheringsize": gatheringsize,
          "eventdetails": jsonEncode(eventdetail),
          "location": location,
          "requiements": requiements,
          "price": price,
        }
      );
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
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