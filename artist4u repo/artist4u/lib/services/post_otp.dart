import 'dart:convert';
import 'package:artist4u/modals/get_artist_bio.dart';// ignore: unused_import
import 'package:artist4u/modals/otp.dart';
import 'package:http/http.dart' as http;

import '../const.dart';
class PostOtp{
	Future<Otp> postotp() async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var otpmodal = null;
		var url = 'http://$ip:3000/user/otp';
		try {
			var response = await client.post(
        url,
        headers:{
          "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNjZDA0ZDM2NjI4MjhlNzk2MjAiLCJwaG9uZSI6Ijk5OTA1MDA0czE1IiwiaWF0IjoxNjAyNTA5ODQzLCJleHAiOjE2MDI1MjQyNDN9.5Y8wRYNVjVyQNo6nMrP4jIELd5tbiLq8vFGLZaoPG8U"
        },
        body:{
          "phone":'9990500415'
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
}