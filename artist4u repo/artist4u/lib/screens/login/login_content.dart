import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class LoginContent extends StatefulWidget{
	@override
	_LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
	@override
	Widget build(BuildContext context) {
		return Column(
			children: [
				Expanded(
					flex:1,
					child: Align(
						alignment: Alignment.topRight,
						child: Container(
							margin: EdgeInsets.only(top:5,right: 5),
							width:MediaQuery.of(context).size.width*0.17,
							child: FlatButton(
								onPressed: (){
									Navigator.pushNamed(context, '/home');
								}, 
								color: Colors.grey.withOpacity(0.2),
								shape: RoundedRectangleBorder(
									borderRadius: BorderRadius.circular(18.0),
									side: BorderSide(color: Color.fromRGBO(104, 178, 160, 1),width:2),
								),

								child:Text('Skip'),
							),
						),
					)
				),
				Expanded(
					flex:18,
					child: DefaultTabController(
						length: 2,
						child: Scaffold(
							appBar: AppBar(
								elevation: 0.0,
								backgroundColor: Colors.white10,
								flexibleSpace:TabBar(
									labelColor: Colors.black,
									indicatorColor: Color.fromRGBO(104, 178, 160, 1),
									tabs: [
										Tab(text: 'Login',),
										Tab(text: 'Sign up',),
									],
								),
							),
							body: TabBarView(
								children: [
									LoginArea(),
									SignUpArea(),
									// ArtistBio(title),
									// ReviewList(),
								],
							),
						),
					),
				),
			],
		);
	}
}
class LoginArea extends StatefulWidget{
  @override
  _LoginAreaState createState() => _LoginAreaState();
}

class _LoginAreaState extends State<LoginArea> {
	@override
	Widget build(BuildContext context) {
		return ListView(
			padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.04),
			children: [
				SizedBox(height: MediaQuery.of(context).size.height*0.25,),
				Row(
					mainAxisAlignment: MainAxisAlignment.spaceAround,
					children: [
						FlatButton(
							onPressed: (){
								
							}, 
							color: Color.fromRGBO(219, 50, 54,1),
							shape: RoundedRectangleBorder(
								borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*0.1,),
								// side: BorderSide(color: Color.fromRGBO(104, 178, 160, 1),width:2),
							),

							child:Text('Google+',style: TextStyle(color: Colors.white),),
						),
						FlatButton(
							onPressed: (){
								
							}, 
							color: Color.fromRGBO(59, 89, 152,1),
							shape: RoundedRectangleBorder(
								borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*0.1,),
								// side: BorderSide(color: Color.fromRGBO(104, 178, 160, 1),width:2),
							),

							child:Text('Facebook',style: TextStyle(color: Colors.white),),
						),
					],
				),
				Row(
					children: [
						
						Expanded(
							child: new Container(
								margin: const EdgeInsets.only(left: 10.0, right: 20.0),
								child: Divider(
									color: Colors.black,
									height: 36,
								)
							),
						),
						Text("OR"),
						Expanded(
							child: new Container(
								margin: const EdgeInsets.only(left: 20.0, right: 10.0),
								child: Divider(
									color: Colors.black,
									height: 36,
								)
							),
						),
					],
				),
				TextField(
					decoration: new InputDecoration(labelText: "Enter your number"),
				keyboardType: TextInputType.number,
				),
				Center(child: Text('\n Or')),
				TextField(
					decoration: new InputDecoration(labelText: "Enter your Email"),
				keyboardType: TextInputType.number,
				),
				FlatButton(onPressed: null, child: Text('Send OTP')),
			]
		);
  	}
}


class SignUpArea extends StatefulWidget{
  @override
  _SignUpArea createState() => _SignUpArea();
}

class _SignUpArea extends State<SignUpArea> {
	@override
	Widget build(BuildContext context) {
		return ListView(
			padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.04),
			children: [
				SizedBox(height: MediaQuery.of(context).size.height*0.25,),
				Row(
					children: [
						Expanded(child: Text('Name')),
						Expanded(
							flex:3,
							child: TextField(
								decoration: new InputDecoration(labelText: "Enter your Name"),
							),
						),
					],
				),
				Row(
					children: [
						Expanded(child: Text('Email')),
						Expanded(
							flex:3,
							child: TextField(
								decoration: new InputDecoration(labelText: "Enter your Email"),
							),
						),
					],
				),
				Row(
					children: [
						Expanded(child: Text('Phone')),
						Expanded(
							flex:3,
							child: TextField(
								decoration: new InputDecoration(labelText: "Enter your Phone"),
							),
						),
					],
				),
				FlatButton(onPressed: null, child: Text('Submit'))
			]
		);
  	}
}