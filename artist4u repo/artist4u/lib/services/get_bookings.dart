import 'dart:convert';
import 'package:artist4u/const.dart';
import 'package:artist4u/modals/get_booking_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class GetBooking{

	Future<GetBookingModal> getBookingUpcoming() async{
		var client = http.Client();
  		// ignore: avoid_init_to_null
		var bookingModal = null;
		var url = 'http://$ip:3000/events/upcoming';
		try {
      Map<String,dynamic> userdata;
			userdata=await getUserData();
      // debugPrint(userdata['token']);
			var response = await client.get(url,headers: {'Authorization':"bearer ${userdata['token']}"});
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				debugPrint(jsonResponse.toString());
				bookingModal = GetBookingModal.fromJson(jsonResponse);
				// debugPrint("model"+bookingModal);
			}
		}catch(Exception){
			return bookingModal;
		}
		return bookingModal;
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