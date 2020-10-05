import 'package:artist4u/drawers/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeDrawerCollection extends StatelessWidget{
  Map<String,dynamic> mydata={
		'name':'Ayush Arora',
		'email': 'ayusharora819@gmail.com',
		'isArtist':false
	};
	// var a=UserInfo();
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

					mydata['isArtist']!=true?ListTile(
					title:Text('Become an Artist'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){Navigator.pushNamed(context, '/becomeanartist');},
					):ListTile(
						title:Text('Manage Artist account'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){},
					),
					ListTile(
						title:Text('Become a Partner'),
						trailing: Icon(Icons.keyboard_arrow_right),
						onTap: (){Navigator.pushNamed(context, '/becomeapartner');},
					),
		
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
            