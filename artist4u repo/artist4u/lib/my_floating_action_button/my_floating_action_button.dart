import 'package:flutter/material.dart';
class MyFloatingActionButton extends StatelessWidget{
	Widget build(BuildContext context) {
		return FloatingActionButton(
			child: Icon(Icons.chat,),
			onPressed: null,
			backgroundColor: Colors.black,
		);
  	}
}