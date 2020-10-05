import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookNowButton extends StatelessWidget{
	final String selectedartist;
	BookNowButton(this.selectedartist);
  	@override
  	Widget build(BuildContext context) {
		return RaisedButton(
			elevation: 10,
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.025),
				//side: BorderSide(color: Colors.black)
			),
			color: Colors.green,
			padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: MediaQuery.of(context).size.width*0.03),
			onPressed: (){
				Navigator.pushNamed(context, '/booknow',arguments: {'artistname':selectedartist});
			},
			child:Text(
				'Book Now',
				style: TextStyle(
					color: Colors.white,
					fontSize:MediaQuery.of(context).size.width*0.06, 
				),	
			)
		);
  	}
}