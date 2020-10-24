import 'package:artist4u/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'artist_types.dart';
import 'feature_sliver.dart';
import 'offer_corousel_sliver.dart';

class HomePageContent extends StatelessWidget{
  final String title='Artist4u';
	@override
	Widget build(BuildContext context) {
		return NestedScrollView(
			headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
				return <Widget>[
					MyAppBar(this.title),
					OfferCorouselSliver(),
         			FeatureSliverList()
				];
			},
			body: Stack(
				children: <Widget>[
					// Container(
					// 	margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.02,top:MediaQuery.of(context).size.width*0.11),
					// 	decoration: BoxDecoration(
					// 		// border: Border.all(
					// 		// 	color: Colors.red[500],
					// 		// ),
					// 		// color:Color.fromRGBO(135, 175, 199 ,1),//6B96B0
					// 		color:Color.fromRGBO(107, 150, 176,1),
					// 		borderRadius: BorderRadius.circular(20)
					// 	),
					// 	width: MediaQuery.of(context).size.width,
					// 	height:MediaQuery.of(context).size.height*0.6
					// ),
					ArtistType(),
				],
			)
        );
    // return ArtistType();
	}
}

