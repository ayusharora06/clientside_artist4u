import 'package:artist4u/drawers/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_now_content.dart';
class BookNowPage extends StatefulWidget{
	@override
	State<StatefulWidget> createState() {
		return _BookNowPage();
	}
}
class _BookNowPage extends State<BookNowPage>{
    Map data={};
  	@override
  	Widget build(BuildContext context) {
      data= ModalRoute.of(context).settings.arguments;
		return SafeArea(
			child:Scaffold(
				appBar: AppBar(
					title: Text('Book Now'),
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
				body:BookNowContent(data['artistname']) ,
				backgroundColor: Color.fromRGBO(255, 252, 252, 1),
				//bottomNavigationBar:PriceBar(),
			),
		);
  	}
}