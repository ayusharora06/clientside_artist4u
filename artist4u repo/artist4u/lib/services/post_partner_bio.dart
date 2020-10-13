import 'dart:convert';
import 'package:artist4u/modals/artist_type_model.dart';
import 'package:artist4u/modals/artistbio_modal.dart';
import 'package:artist4u/modals/post_partner_modal.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    String IFSC,
		String agreed
	) async{
		var client = http.Client();
  // ignore: avoid_init_to_null
		var postPartnerBioModal = null;
		var url = 'http://$ip:3000/partner/addpartner';
		try {
			var response = await client.post(url,
       headers:{
          "Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNkOTA0ZDM2NjI4MjhlNzk2MjIiLCJwaG9uZSI6Ijk5OTA1MDA0MTUiLCJpYXQiOjE2MDI1ODgyMDksImV4cCI6MTYwMjYwMjYwOX0.PHLZzrdV1J10G5FKWiKmPgwqVliFzuQgdA73NV6hI_0"
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
				// debugPrint(jsonResponse.toString());
				postPartnerBioModal = PostPartnerBioModal.fromJson(jsonResponse);
				// debugPrint("model"+artistTypeModel.toString());
			}
      if (response.statusCode == 500) {
				var jsonResponse = json.decode(response.body);
				// debugPrint(jsonResponse.toString());
			}
		}catch(Exception){
			return postPartnerBioModal;
		}
		return postPartnerBioModal;
	}
}