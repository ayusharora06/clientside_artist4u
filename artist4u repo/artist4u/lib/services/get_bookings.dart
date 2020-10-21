import 'dart:convert';
import 'package:artist4u/const.dart';
import 'package:artist4u/modals/get_booking_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetBooking{

	Future<GetBookingModal> getBookingUpcoming() async{
		var client = http.Client();
  		// ignore: avoid_init_to_null
		var bookingModal = null;
		var url = 'http://$ip:3000/events/upcoming';
		try {
			var response = await client.get(url,headers: {'Authorization':'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBAZ21haWwuY29tIiwiaWQiOiI1ZjhkZTE5YzlkZGJjMDJkMjBkMDNhYTEiLCJwaG9uZSI6Ijk5OTUwMDQ3MTUiLCJpYXQiOjE2MDMxMzM4NTIsImV4cCI6MTYwMzE0ODI1Mn0.bFSkbwsVzVgLrI2ovIPFOJGqhnf7GBKq5p8dBmJXfQE'});
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
				bookingModal = GetBookingModal.fromJson(jsonResponse);
				// debugPrint("model"+bookingModal);
			}
		}catch(Exception){
			return bookingModal;
		}
		return bookingModal;
	}
}