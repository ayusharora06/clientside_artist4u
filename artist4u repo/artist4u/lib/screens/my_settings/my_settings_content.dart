import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySettingsContent extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return ListView(
			children: <Widget>[
				ListTile(
					title: Text('Change Name'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){},
				),
				ListTile(
					title:Text('Notification Settings'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){},
				),
				ListTile(
					title:Text('Change Password'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){},
				),
				ListTile(
					title:Text('Change E-mail'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){},
				),
				ListTile(
					title:Text('Change Number'),
					trailing: Icon(Icons.keyboard_arrow_right),
					onTap: (){},
				),				
			],
		);
	}
}