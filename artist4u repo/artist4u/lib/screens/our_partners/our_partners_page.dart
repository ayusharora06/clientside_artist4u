import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'our_partners_content.dart';

class OurPartners extends StatefulWidget{
	@override
	State<StatefulWidget> createState() {
		return _OurPartners();
	}
}
class _OurPartners extends State<OurPartners>{
    Map data={};
  	@override
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				appBar: AppBar(
					title: Text('Our Partners'),
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
				 //drawerScrimColor: Colors.blueGrey,
				body:OurPartnersContent() ,
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:true,),
			),
		);
  	}
}