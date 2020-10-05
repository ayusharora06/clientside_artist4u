import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBottomNavigationBar extends StatefulWidget{
	bool fullbar=false;
	int currentIndex=-1;
	MyBottomNavigationBar({this.fullbar,this.currentIndex});
	@override
	State<StatefulWidget> createState() {
		return _MyBottomNavigationBar();
	}

}
class _MyBottomNavigationBar extends State<MyBottomNavigationBar>{
	Map indexroutmap={0:'/favorites',1:'/mywallet',2:'/',3:'/'};
	@override
	Widget build(BuildContext context) {
		return BottomAppBar(
			shape: CircularNotchedRectangle(),
			clipBehavior: Clip.antiAlias,
			child: Container(
				height: MediaQuery.of(context).size.height*0.07,
				child: Row(
					children:<Widget>[
						Expanded(
							flex: 3,
							child: SizedBox(
								height: MediaQuery.of(context).size.height*0.08,
								child:Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: [
										Expanded(
											child: RawMaterialButton(
												fillColor:widget.currentIndex==0?Colors.black.withOpacity(0.8):Colors.white,
												shape: CircleBorder(),
												onPressed: () {},
												elevation:0,
												child: IconButton(
												icon: Icon(
													Icons.favorite_border,
													size: widget.currentIndex==0?MediaQuery.of(context).size.height*0.035:MediaQuery.of(context).size.height*0.03,
													color: widget.currentIndex==0?Colors.white:Colors.black,
												
												), 
												onPressed: (){
													if(widget.currentIndex==0){
														return;
													}
													Navigator.pushNamed(context, '/favorites');
												}
												),
											),
											
										),
										
										Expanded(
											child: RawMaterialButton(
												fillColor:widget.currentIndex==1?Colors.black.withOpacity(0.8):Colors.white,
												shape: CircleBorder(),
												onPressed: () {},
												elevation:0,
												child: IconButton(
												icon: Icon(
													Icons.account_balance_wallet,
													size: widget.currentIndex==1?MediaQuery.of(context).size.height*0.035:MediaQuery.of(context).size.height*0.03,
													color: widget.currentIndex==1?Colors.white:Colors.black,
												
												), 
												onPressed: (){
													if(widget.currentIndex==1){
														return;
													}
													Navigator.pushNamed(context, '/mywallet');
												}
												),
											),
											
										),
										Expanded(
											child: RawMaterialButton(
												fillColor:widget.currentIndex==2?Colors.black.withOpacity(0.8):Colors.white,
												shape: CircleBorder(),
												onPressed: () {},
												elevation:0,
												child: IconButton(
												icon: Icon(
													Icons.home,
													size: widget.currentIndex==2?MediaQuery.of(context).size.height*0.035:MediaQuery.of(context).size.height*0.03,
													color: widget.currentIndex==2?Colors.white:Colors.black,
												
												), 
												onPressed: (){
													if(widget.currentIndex==2){
														return;
													}
													Navigator.pushNamed(context, '/');
												}
												),
											),
											
										),
										Expanded(
											child: RawMaterialButton(
												fillColor:widget.currentIndex==3?Colors.black.withOpacity(0.8):Colors.white,
												shape: CircleBorder(),
												onPressed: () {},
												elevation:0,
												child: IconButton(
												icon: Icon(
													Icons.account_circle,
													size: widget.currentIndex==3?MediaQuery.of(context).size.height*0.04:MediaQuery.of(context).size.height*0.03,
													color: widget.currentIndex==3?Colors.white:Colors.black,
												
												), 
												onPressed: (){
													if(widget.currentIndex==3){
														return;
													}
													Navigator.pushNamed(context, '/myaccount');
												}
												),
											),
											
										),
									],
								)
								// child: BottomNavigationBar(
								// 	type: BottomNavigationBarType.fixed,
								// 	iconSize: MediaQuery.of(context).size.height*0.025,
								// 	elevation: 0,
								// 	//backgroundColor: Colors.lightBlueAccent,
								// 	//selectedItemColor: Colors.blue,
								// 	//unselectedItemColor: Colors.grey,
								// 	currentIndex: _currentIndex,
								// 	items: [
					
								// 		BottomNavigationBarItem(
								// 			icon: Icon(Icons.favorite),
								// 			title: Text(
								// 				'Favorite',
								// 				style: TextStyle(
								// 					fontSize: MediaQuery.of(context).size.height*0.022,
								// 				),  
								// 			),
								// 		),

								// 		BottomNavigationBarItem(
								// 			icon: Icon(Icons.account_balance_wallet),
								// 			title: Text('Wallet',
								// 				style: TextStyle(
								// 					fontSize: MediaQuery.of(context).size.height*0.022,
								// 				),  
								// 			),
								// 		),

								// 		BottomNavigationBarItem(
								// 			icon: Icon(Icons.home),
								// 			title: Text('Home',
								// 				style: TextStyle(
								// 					fontSize: MediaQuery.of(context).size.height*0.022,
								// 				),  
								// 			),
								// 		),

								// 		BottomNavigationBarItem(
								// 			icon: Icon(Icons.account_circle),
								// 			title: Text('User',
								// 				style: TextStyle(
								// 					fontSize: MediaQuery.of(context).size.height*0.022,
								// 				),  
								// 			),
								// 		),                    
								// 	],
								// 	onTap: (index){
								// 		// debugPrint(index.toString());
								// 		// if(index==_currentIndex){
								// 		// 	debugPrint(_currentIndex.toString());
								// 		// 	return;
								// 		// }
								// 		setState(() {
								// 		  _currentIndex=index;
								// 		});
								// 		if(index==2){
								// 			Navigator.popUntil(context, ModalRoute.withName('/'));
								// 		}else{
								// 			Navigator.pushNamed(context, indexroutmap[index]);
								// 		}
								// 	},
									
								// ),
							),
						),
						widget.fullbar==false?Expanded(
							flex: 1,
							child: FractionallySizedBox(
								child: SizedBox(
									height: MediaQuery.of(context).size.height*0,
									child: Container(
										//color: Colors.lightBlueAccent,
									),
								),
							)
						):Text(''),
					]
				),
			),
		);
	}
}