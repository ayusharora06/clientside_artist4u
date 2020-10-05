import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/screens/track_your_progress/track_your_progress_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TrackYourProgressPage extends StatelessWidget{
  Map data={};
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				appBar: AppBar(
					title: Text('Track Your Progress'),
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
				body: Container(child: TrackYourProgressContent(),
				// decoration: BoxDecoration(
				// 	image: DecorationImage(
				// 		image: AssetImage("background/galaxy.jpg"),
				// 		fit: BoxFit.cover,
				// 	),
				// ),
				),
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar:true),
				// floatingActionButton: MyFloatingActionButton(),
				// floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
			),
		);
  	}

}