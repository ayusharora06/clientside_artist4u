import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_account_content.dart';
// ignore: must_be_immutable
class MyAccountPage extends StatelessWidget{
  Map data={};
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return WillPopScope(
			onWillPop: () {Navigator.popUntil(context, ModalRoute.withName('/'));return;},
			child: SafeArea(
				child:Scaffold(
					appBar: AppBar(
					title: Text('My Account'),
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
					body: MyAccountContent(),
					backgroundColor: Color.fromRGBO(255, 252, 252, 1),
					bottomNavigationBar:MyBottomNavigationBar(fullbar:true,currentIndex: 3,),
					//floatingActionButton: MyFloatingActionButton(),
					//floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
				),
			),
		);
  	}

}