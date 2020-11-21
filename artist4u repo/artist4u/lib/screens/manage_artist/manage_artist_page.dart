import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/screens/manage_partner/manage_partner_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ManageArtistPage extends StatelessWidget{
    //Map data={};
  	@override
  	Widget build(BuildContext context) {
      //data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				drawer: HomeDrawer(),
				 //drawerScrimColor: Colors.blueGrey,
				body:ManagePartnerContent() ,
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:true),
			),
		);
  	}
}
