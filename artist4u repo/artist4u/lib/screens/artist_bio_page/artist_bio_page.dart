import 'package:artist4u/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:artist4u/drawers/home_drawer.dart';
import 'package:artist4u/my_floating_action_button/my_floating_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'artist_bio_page_content.dart';
class ArtistBioPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ArtistBioPage();
  }
}
class _ArtistBioPage extends State<ArtistBioPage>{
    Map data={};
  	@override
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
    // print('${data['artisttype']},${data['id']}');
		return SafeArea(
			child:Scaffold(
				drawer: HomeDrawer(),
				 //drawerScrimColor: Colors.blueGrey,
				body:ArtistBioPageContent(data['title'],data['artisttype'],data['id']) ,
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				bottomNavigationBar:MyBottomNavigationBar(fullbar: false,),
				floatingActionButton: MyFloatingActionButton(),
				floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
			),
		);
  	}
}