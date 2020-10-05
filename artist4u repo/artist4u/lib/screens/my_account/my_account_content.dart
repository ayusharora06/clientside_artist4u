import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAccountContent extends StatelessWidget{
	Map<String,dynamic> mydata={
		'name':'Ayush Arora',
		'email': 'ayusharora819@gmail.com',
		'isArtist':false
	};
	@override
	Widget build(BuildContext context) {
		return ListView(
			children: <Widget>[
				Align(alignment: Alignment.center,
					child: Text(
					mydata['name'],
					style: TextStyle(
						color: Color.fromRGBO(2, 0, 110, 1),
						fontWeight: FontWeight.w500,
						fontSize: 24,
						fontFamily: 'Sriracha-Regular'
					),
					),
				),
				Align(alignment: Alignment.center,
					child: Text(
					mydata['email'],
					style: TextStyle(
						//color: Color.fromRGBO(2, 0, 110, 1),
						fontWeight: FontWeight.w500,
						fontSize: 18,
						//fontFamily: 'Sriracha-Regular'
					),
					),
				),
				ListTile(
					title: Text('My Bookings'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){Navigator.pushNamed(context, '/mybooking');},
				),
				ListTile(
					title:Text('Track your Progress'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){Navigator.pushNamed(context, '/trackyourprogress');},
				),
				
				ListTile(
					title:Text('Passbook'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){},
				),
				ListTile(
					title:Text('My Settings'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){Navigator.pushNamed(context, '/mysettings');},
				),
			],
		);
	}
}