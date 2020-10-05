import 'package:flutter/material.dart';
class UserInfo extends StatelessWidget{
	final Map<String,dynamic> userinfo={
		'name':'Guest',
		'contact':'',
		'email':'',
		'profile' :Icons.account_circle
	};
	@override
	Widget build(BuildContext context) {
		return Column(
		  	children: <Widget>[
		  		Row(
		  			children:<Widget>[


		  				//profile pic
		  				Icon(
		  					Icons.account_circle,
		  					size: MediaQuery.of(context).size.width*0.25,
		  				),
		  				//User Name
		  				Padding(
		  					padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05),
		  						child: Text(
		  							'name',
		  							style: TextStyle(
		  								fontSize: MediaQuery.of(context).size.height*0.018,
		  							),
		  						),
		  				),
		  			]
		  		),
		  			
		  		//Contact Number
		  		Row(
		  			children: <Widget>[
		  				Text(
		  					'contact',
		  						style: TextStyle(
		  							fontSize: MediaQuery.of(context).size.height*0.017,
		  						)
		  				),
		  			],
		  		),	

		  		//Email ID
		  		Row(
		  			children: <Widget>[
		  				Text(
		  					'email',
		  						style: TextStyle(
		  							fontSize: MediaQuery.of(context).size.height*0.015,
		  						)
		  				),
		  			],
		  		),
		  	],
		  );
  	}
}