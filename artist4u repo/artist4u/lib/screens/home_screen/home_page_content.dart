import 'package:artist4u/app_bar/app_bar.dart';
import 'package:artist4u/modals/artist_type_model.dart';
import 'package:artist4u/screens/home_screen/offer_corousel.dart';
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
			body: ArtistType()
        );
    // return ArtistType();
	}
}

