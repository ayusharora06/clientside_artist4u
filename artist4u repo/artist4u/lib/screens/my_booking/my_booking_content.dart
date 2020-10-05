import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/screens/my_booking/canelled.dart';
import 'package:artist4u/screens/my_booking/upcoming.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'completed.dart';

class MyBookingContent extends StatelessWidget{
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: 3,
			child: Scaffold(
				drawer: HomeDrawer(),
				appBar: AppBar(
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
					bottom: TabBar(
						tabs: [
							Tab(text: 'Upcoming',),
							Tab(text: 'Completed',),
							Tab(text: 'Cancelled',),
						],
					),
					title: Text('My Booking'),
				),
				body: TabBarView(
					children: [
						Upcoming(),
						Completed(),
						Cancelled(),
						// ArtistBio(title),
						// ReviewList(),
					],
				),
			),
		);
	}
}