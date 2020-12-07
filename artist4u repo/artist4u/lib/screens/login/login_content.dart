// ignore: unused_import
import 'package:artist4u/modals/otp.dart';
import 'package:artist4u/modals/user_modal.dart';
import 'package:artist4u/services/post_login.dart';
// ignore: unused_import
import 'package:artist4u/services/post_otp.dart';
import 'package:artist4u/services/post_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
	var phonecontroller = TextEditingController();
	var emailcontroller = TextEditingController();
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
							onPressed: ()async {
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
					controller: phonecontroller,
					decoration: new InputDecoration(labelText: "Enter your number"),
				keyboardType: TextInputType.number,
				),
				Center(child: Text('\n Or')),
				TextField(
					controller: emailcontroller,
					decoration: new InputDecoration(labelText: "Enter yourEmail"),
				),
				FlatButton(
					onPressed:() async{
      					// ignore: unused_local_variable
						// final Otp otp=await PostOtp().postotploginphone(
						// 	phonecontroller.text
						// );
      					// ignore: unused_local_variable
						// final Otp otp=await PostOtp().postotploginemail(
						// 	emailcontroller.text
						// );
      					// ignore: unused_local_variable
						final UserModal user=await PostLogin().postLoginPhone(
							phonecontroller.text,
							// phonecontroller.text
						).then((UserModal result){
							// debugPrint(result.toString());
							if(result==null){
								showDialog(
									barrierDismissible: true,
										context: context,  
										builder: (BuildContext context) {  
											return AlertDialog(content: Text("Something went wrong or phone number incorrect"),);
										}
								);
							}
						});
						SharedPreferences userdata=await SharedPreferences.getInstance();
						String islogedin=userdata.getString('message');
						islogedin=='authenticated'?Navigator.of(context)
    .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false):Center(child:CircularProgressIndicator());
					}, 
					child: Text('Send OTP phone')
				),

				FlatButton(
					onPressed:() async{
      					// ignore: unused_local_variable
						// final Otp otp=await PostOtp().postotploginemail(
						// 	emailcontroller.text
						// );
      					// ignore: unused_local_variable
						final UserModal user=await PostLogin().postLoginEmail(
							emailcontroller.text,
							// phonecontroller.text
						).then((UserModal result){
							// debugPrint(result.toString());
							if(result==null){
								showDialog(
									barrierDismissible: true,
										context: context,  
										builder: (BuildContext context) {  
											return AlertDialog(content: Text("Something went wrong or email incorrect"),);
										}
								);
							}
						});
						SharedPreferences userdata=await SharedPreferences.getInstance();
						String islogedin=userdata.getString('message');
						islogedin=='authenticated'?Navigator.pushNamed(context, '/home'):Center(child:CircularProgressIndicator()); 
						// .then((result)async{
						// 	var otpcontroller=TextEditingController();
						// 	showDialog(
						// 		context: context,
						// 		builder: (BuildContext context){
						// 			return AlertDialog(
						// 				content: Column(
						// 					children: <Widget>[
						// 						TextField(
						// 							controller: otpcontroller,
						// 							decoration: new InputDecoration(labelText: "Enter your OTP"),
						// 							keyboardType: TextInputType.number,
						// 						),
						// 				],
						// 				),
						// 			);
						// 		}
						// 	);
						// 	// ignore: unused_local_variable
						// 	final Otp otp=await PostOtp().postotploginemail(
						// 		otpcontroller.text
						// 	).then((finalresult)async{
						// 		SharedPreferences userdata=await SharedPreferences.getInstance();
						// 		String islogedin=userdata.getString('message');
						// 		islogedin=='authenticated'?Navigator.pushNamed(context, '/home'):Center(child:CircularProgressIndicator()); 
						// 	});
						// });
					}, 
					child: Text('Send OTP email')
				),
			]
		);
  	}
}


class SignUpArea extends StatefulWidget{
  @override
  _SignUpArea createState() => _SignUpArea();
}

class _SignUpArea extends State<SignUpArea> {
	var namecontroller=TextEditingController();
	var emailcontroller=TextEditingController();
	var phonecontroller=TextEditingController();
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
								controller: namecontroller,
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
								controller: emailcontroller,
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
								controller: phonecontroller,
								decoration: new InputDecoration(labelText: "Enter your Phone"),
							),
						),
					],
				),
				FlatButton(
					onPressed: () async{
      				// ignore: unused_local_variable
						final UserModal user=await PostSignup().postSignup(
							namecontroller.text,
							emailcontroller.text,
							phonecontroller.text
						).then((UserModal result){
							// debugPrint(result.toString());
							if(result==null){
								showDialog(
									barrierDismissible: true,
										context: context,  
										builder: (BuildContext context) {  
											return AlertDialog(content: Text("Something went wrong or couldnt get your info to server"),);
										}
								);
							}
						});
						SharedPreferences userdata=await SharedPreferences.getInstance();
						String islogedin=userdata.getString('message');
						islogedin=='authenticated'?Navigator.pushNamed(context, '/home'):Center(child:CircularProgressIndicator()); 
					},
					child: Text('Submit')
				)
			]
		);
  	}
}