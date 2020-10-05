import 'dart:convert';
import 'package:artist4u/const.dart';
import 'package:artist4u/modals/offers_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetOffer{
	Future<OfferModal> getOffer() async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var offerModal = null;
		var url = 'http://$ip:3000/home/offers/';
		try {
			var response = await client.get(url);
			if (response.statusCode == 200) {
				var jsonResponse = json.decode(response.body);
				debugPrint(jsonResponse.toString());
				offerModal = OfferModal.fromJson(jsonResponse);
				debugPrint("model"+offerModal);
			}
		}catch(Exception){
			return offerModal;
		}
		return offerModal;
	}
}