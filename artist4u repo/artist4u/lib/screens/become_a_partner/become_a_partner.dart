import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/my_floating_action_button/my_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'become_a_partner_content.dart';

class BecomeAPartnerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BecomeAPartnerPage();
  }
}
class _BecomeAPartnerPage extends State<BecomeAPartnerPage>{
    Map data={};
  	@override
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				drawer: HomeDrawer(),
				 //drawerScrimColor: Colors.blueGrey,
				body: BecomeAPartnerContent(),
				appBar: AppBar(
					title: Text('Become a Partner'),
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
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:false),
				floatingActionButton: MyFloatingActionButton(),
				floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
			),
		);
  	}
}