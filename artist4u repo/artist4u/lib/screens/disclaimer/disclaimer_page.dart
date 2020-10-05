import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'disclaimer_content.dart';

class DisclaimerPage extends StatefulWidget{
	@override
	State<StatefulWidget> createState() {
		return _DisclaimerPage();
	}
}
class _DisclaimerPage extends State<DisclaimerPage>{
    Map data={};
  	@override
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				appBar: AppBar(title:Text('Disclaimer')),
				drawer: HomeDrawer(),
				 //drawerScrimColor: Colors.blueGrey,
				body:DisclaimerContent() ,
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:true,currentIndex:1),
			),
		);
  	}
}