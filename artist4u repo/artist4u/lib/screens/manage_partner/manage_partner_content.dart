import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/screens/manage_partner/bookings.dart';
import 'package:artist4u/screens/manage_partner/refer.dart';
import 'package:artist4u/screens/my_booking/canelled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagePartnerContent extends StatelessWidget{
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
							Tab(text: 'Refer',),
							Tab(text: 'Bookings',),
							Tab(text: 'Profile',),
						],
					),
					title: Text('Manage Partner'),
				),
				body: TabBarView(
					children: [
						Refer(),
						Bookings(),
						Cancelled(),
						// ArtistBio(title),
						// ReviewList(),
					],
				),
			),
		);
	}
}