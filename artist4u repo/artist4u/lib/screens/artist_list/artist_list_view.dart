import 'package:artist4u/app_bar/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'artist_list.dart';
class ArtisListView extends StatelessWidget{
	final String title;
	ArtisListView(this.title);
	Widget build(BuildContext context) {
		// return CustomScrollView(
		// 	slivers: <Widget>[
		// 		MyAppBar(title),
    //     ArtisList(this.title)
		// 	]
		// );
    return NestedScrollView(
			headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
				return <Widget>[
					MyAppBar(this.title),
				];
			},
			body: ArtisList(this.title)
        );
	}
}