import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/screens/artist_bio_page/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'artist_bio.dart';

class ArtistBioPageContent extends StatelessWidget{
	final String title;
	final String artistType;
	final String id;
	ArtistBioPageContent(this.title,this.artistType,this.id);
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: 2,
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
						indicatorColor: Colors.white,
						unselectedLabelColor: Colors.white70,
            			labelColor: Colors.white,
						tabs: [
							Tab(text: 'Info',),
							Tab(text: 'Reviews',),
						],
					),
					title: Text(
						this.title,
						style: TextStyle(
							fontStyle: FontStyle.italic
						),
					),
				),
				body: TabBarView(
					children: [
						ArtistBio(title,artistType,id),
						ReviewList(),
					],
				),
			),
		);
	}
}