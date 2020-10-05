import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_us_content.dart';
class ContactUsPage extends StatefulWidget{
	@override
	State<StatefulWidget> createState() {
		return _ContactUsPage();
	}
}
class _ContactUsPage extends State<ContactUsPage>{
    Map data={};
  	@override
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				appBar: AppBar(title:Text('Book Now')),
				drawer: HomeDrawer(),
				 //drawerScrimColor: Colors.blueGrey,
				body:ContactUsContent() ,
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:false),
			),
		);
  	}
}