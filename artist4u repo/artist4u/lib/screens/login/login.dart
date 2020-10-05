import 'package:artist4u/screens/login/login_content.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{
	@override
  	Widget build(BuildContext context) {
		return SafeArea(
			child:Scaffold(
				 //drawerScrimColor: Colors.blueGrey,
				body:LoginContent(),
			),
		);
  	}
}