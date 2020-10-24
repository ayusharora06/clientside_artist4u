import 'package:artist4u/drawers/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: must_be_immutable
class HomeDrawerCollection extends StatefulWidget{
  @override
  _HomeDrawerCollectionState createState() => _HomeDrawerCollectionState();
}

class _HomeDrawerCollectionState extends State<HomeDrawerCollection> {
  Map<String,dynamic> mydata={
		'name':'Ayush Arora',
		'email': 'ayusharora819@gmail.com',
		'isArtist':false
	};
  Future<Map<String,dynamic>> userdata;
	@override
	void initState(){
		userdata=getUserData();
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Drawer(
			child: ListView(
				children: <Widget>[

					//Drawer Header
					DrawerHeader(
				    	child: UserInfo()
		      		),



					//Drawer Content
		
					//My Account
					ListTile(
						title: Text('My Account'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
							
							Navigator.pushNamed(context, '/myaccount');
						},
					),

					FutureBuilder<Map<String,dynamic>>(
						future: userdata,
						builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
							if(snapshot.hasData){
								var data=snapshot.data;
								// debugPrint(data.toString());
								return data['isartist']!=true?ListTile(
									title:Text('Become an Artist'),
									trailing: Icon(Icons.keyboard_arrow_right),
									onTap: (){Navigator.pushNamed(context, '/becomeanartist');},
								):ListTile(
									title:Text('Manage Artist account'),
									trailing: Icon(Icons.keyboard_arrow_right),
									onTap: (){},
								);
							}else{
								return Center(child:CircularProgressIndicator());
							}
						}
					),
					FutureBuilder<Map<String,dynamic>>(
						future: userdata,
						builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
							if(snapshot.hasData){
								var data=snapshot.data;
								// debugPrint(data.toString());
								return data['ispartner']!=true?ListTile(
									title:Text('Become a Partner'),
									trailing: Icon(Icons.keyboard_arrow_right),
									onTap: (){Navigator.pushNamed(context, '/becomeapartner');},
								):ListTile(
									title:Text('Manage Partner account'),
									trailing: Icon(Icons.keyboard_arrow_right),
									onTap: (){},
								);
							}else{
								return Center(child:CircularProgressIndicator());
							}
						}
					),
					// ListTile(
					// 	title:Text('Become a Partner'),
					// 	trailing: Icon(Icons.keyboard_arrow_right),
					// 	onTap: (){Navigator.pushNamed(context, '/becomeapartner');},
					// ),
		
					//Help
					ListTile(
						title: Text('Help'),
						trailing: Icon(Icons.keyboard_arrow_right),
					),
		
					//Contact Us
					ListTile(
            //contact us
						title: Text('Customer Service'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/contactus');
						},
					),
		
		
					Divider(
					color:Colors.black,
					),
		
					//Legal
					ListTile(
						title: Text('Legal'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/legal');
						},
					),
		
					//Term of Use
					ListTile(
						title: Text('Terms of Use'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/termsofuse');
						},
					),
		
					//Privacy Policy
					ListTile(
						title: Text('Privacy Policy'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/privacypolicy');
						},
					),
		
					//Disclaimer
					ListTile(
						title: Text('Disclaimer'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/disclaimer');
						},
					),

					ListTile(
						title: Text('Our Partners'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/ourpartners');
						},
					),
		
					//About Us
					ListTile(
						title: Text('About Us'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){
						
							Navigator.pushNamed(context, '/aboutus');
						},
					),
					Divider(
					color:Colors.black,
					),
					ListTile(
					title: Text('Share'),
					trailing: Icon(Icons.keyboard_arrow_right),
					),
					Divider(
					color:Colors.black,
					),
		
					//Login / Sign Out
					ListTile(
					title: Text('Sign out'),
					trailing: Icon(Icons.keyboard_arrow_right),
					),
                      
				],
			),
		);
            
	}
}
Future<Map<String,dynamic>> getUserData() async{
	SharedPreferences userdata=await SharedPreferences.getInstance();
	Map<String,dynamic> user={
		"ispartner":userdata.getBool('ispartner'),
		"isartist":userdata.getBool('isartist'),
		// userdata.getString('otp', jsonResponse['token']);
		// "token":userdata.getString('token'),
	};
	// await userdata.clear();
	return user;
} 