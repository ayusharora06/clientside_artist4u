import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/my_floating_action_button/my_floating_action_button.dart';
import 'package:flutter/material.dart';

import 'home_page_content.dart';
class HomeScreen extends StatelessWidget{
  	@override
  	Widget build(BuildContext context) {
		  return SafeArea(
				child:Scaffold(
					drawer: HomeDrawer(),
					 //drawerScrimColor: Colors.blueGrey,
					body: HomePageContent(),
					backgroundColor: Color.fromRGBO(255, 252, 252, 1),
					bottomNavigationBar:MyBottomNavigationBar(fullbar:false,currentIndex:2),
					floatingActionButton: MyFloatingActionButton(),
					floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
				),
			);
    }
}