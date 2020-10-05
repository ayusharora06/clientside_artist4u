import 'package:artist4u/drawers/home_drawer_collection.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return Container(
			width: MediaQuery.of(context).size.width*0.75, 
			child:HomeDrawerCollection()
		);
	}
}