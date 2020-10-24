import 'package:artist4u/modals/otp.dart';
import 'package:artist4u/modals/updateuserinfo.dart';
import 'package:artist4u/services/post_otp.dart';
import 'package:artist4u/services/post_update_user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MySettingsContent extends StatelessWidget{
	String name='Ayush';
	String email='asd';
	String phone='asd';
	var namecontroller = TextEditingController();
	var phonecontroller = TextEditingController();
	var emailcontroller = TextEditingController();
	@override
	Widget build(BuildContext context) {
		return ListView(
			children: <Widget>[
				ListTile(
					title: Text('Change Name'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: ()async {
      // ignore: unused_local_variable
						final Otp otp=await PostOtp().postotp();
						showDialog(  
							barrierDismissible: true,
							context: context,  
							builder: (BuildContext context) {  
								return AlertDialog(
									content: Column(
										children: <Widget>[
										    Text('Current Name: $name'),
											TextFormField(
												controller:namecontroller,
												decoration: new InputDecoration(
													contentPadding:
														EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
													hintText: 'Enter New Name'
												),
												validator: (value) {
													if (value.isEmpty) {
														return 'Please enter Name';
													}
													
													return null;
												},
											),
											RaisedButton(
												color: Color.fromRGBO(104, 178, 160, 1),
												onPressed: () async{
             // ignore: unused_local_variable
													final UpdateUserInfo updateduser=await PostUpdateUserInfo().postupdatename(namecontroller.text);
												},
												child: Text(
													'Submit',
													style: TextStyle(
														color: Colors.white
													),
												),
											),
										],
									),
									
								);
							},  
						);
          			},
				),
				ListTile(
					title:Text('Notification Settings'),
					trailing: Icon(Icons.keyboard_arrow_right),
					
				),
				ListTile(
					title:Text('Change E-mail'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: ()async {
      // ignore: unused_local_variable
						final Otp otp=await PostOtp().postotp();
						showDialog(  
							barrierDismissible: true,
							context: context,  
							builder: (BuildContext context) {  
								return AlertDialog(
									content: Column(
										children: <Widget>[
										    Text('Current Email: $email'),
											TextFormField(
												controller:emailcontroller,
												decoration: new InputDecoration(
													contentPadding:
														EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
													hintText: 'Enter New email'
												),
												validator: (value) {
													if (value.isEmpty) {
														return 'Please enter email';
													}
													
													return null;
												},
											),
											RaisedButton(
												color: Color.fromRGBO(104, 178, 160, 1),
												onPressed: () async{
             // ignore: unused_local_variable
													final UpdateUserInfo updateduser=await PostUpdateUserInfo().postupdateemail(emailcontroller.text);
												},
												child: Text(
													'Submit',
													style: TextStyle(
														color: Colors.white
													),
												),
											),
										],
									),
									
								);
							},  
						);
          			},
				),
				ListTile(
					title:Text('Change Number'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: ()async {
      // ignore: unused_local_variable
						final Otp otp=await PostOtp().postotp();
						showDialog(  
							barrierDismissible: true,
							context: context,  
							builder: (BuildContext context) {  
								return AlertDialog(
									content: Column(
										children: <Widget>[
										    Text('Current Phone: $phone'),
											TextFormField(
												controller:phonecontroller,
												decoration: new InputDecoration(
													contentPadding:
														EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
													hintText: 'Enter New email'
												),
												validator: (value) {
													if (value.isEmpty) {
														return 'Please enter email';
													}
													
													return null;
												},
											),
											RaisedButton(
												color: Color.fromRGBO(104, 178, 160, 1),
												onPressed: () async{
             // ignore: unused_local_variable
													final UpdateUserInfo updateduser=await PostUpdateUserInfo().postupdatephonenumber(phonecontroller.text);
												},
												child: Text(
													'Submit',
													style: TextStyle(
														color: Colors.white
													),
												),
											),
										],
									),
									
								);
							},  
						);
          			},
				),				
			],
		);
	}
}