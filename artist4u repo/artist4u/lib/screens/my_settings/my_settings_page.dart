import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/my_floating_action_button/my_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my_settings_content.dart';


// ignore: must_be_immutable
class MySettingsPage extends StatelessWidget{
  Map data={};
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				appBar: AppBar(
					title: Text('my Settings'),
					flexibleSpace: Container(
						decoration: BoxDecoration(
							gradient: LinearGradient(
								// begin: Alignment.topLeft,
								// end: Alignment.bottomRight,
								colors: <Color>[
									Color.fromRGBO(104, 178, 160, 1),
									Color.fromRGBO(48, 130, 146, 1),
								]
							)          
						),        
					),
				),
				drawer: HomeDrawer(),
				// //drawerScrimColor: Colors.blueGrey,
				body: MySettingsContent(),
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:false),
				floatingActionButton: MyFloatingActionButton(),
				floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
			),
		);
  	}
}