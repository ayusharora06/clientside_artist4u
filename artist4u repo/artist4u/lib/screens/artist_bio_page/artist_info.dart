import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Map<String,dynamic> data={'name':'Shubham Khanduri','image':'shubham.jpg', 'people choice':'1','recommended':true,'description':'Rajput made his film debut in the buddy drama Kai Po Che! (2013), for which he received a nomination for the Filmfare Award for Best Male Debut. He then starred in the romantic comedy Shuddh Desi Romance (2013) and as the titular detective in the action thriller Detective Byomkesh Bakshy! (2015). His highest-grossing releases came with a supporting role in the satire PK (2014), followed by the titular role in the sports biopic M.S. Dhoni: The Untold Story (2016). For his performance in the latter, he received his first nomination for the Filmfare Award for Best Actor.[6][7] Rajput went on to star in the commercially successful films Kedarnath (2018) and Chhichhore (2019)','expirience':{'year':1},'comfort':['English','hindi','tamil','hindi','tamil','hindi','tamil','hindi','tamil'],'event type':['Devotional', 'Charity','Corporate'],'id':1,'min_price':'2,500','max_price':'5,000'};
String artistname;
class ArtistBasicInfo extends StatelessWidget{
	final String name;
	ArtistBasicInfo(this.name){
		artistname=name;
	}
	@override
	Widget build(BuildContext context) {
		return Column(
		  	children: <Widget>[
				Row(
					children: <Widget>[
						Expanded(flex:4,child: ArtistImage()),
						Expanded(flex:2,child: Experience()),
						Expanded(flex:2,child: Duration()),
						Expanded(flex:2,child: PeoplesChoice())
					],
				),
				Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Expanded(
						flex:15,
						child: Wrap(
							children: <Widget>[
								Text(
									data['name'],
									style: TextStyle(
										color: Colors.black,
										fontWeight: FontWeight.w500,
										fontSize: MediaQuery.of(context).size.width*0.06,
										//fontFamily: 'Sriracha-Regular'
									),
								),
								//(width:MediaQuery.of(context).size.width*0.02),
								data['recommended'] ==true ?
								Align(
									alignment: Alignment.centerLeft,
									child: Card(
										shape: RoundedRectangleBorder(
												//side: BorderSide(color: Colors.blueGrey, width: 2.0),
												borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.32)),
											),
										child:Container(
											decoration: BoxDecoration(
												borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.32)),
												//border: Border.all(width: 1,color: Colors.black),
												gradient: LinearGradient(
													colors: [
														Color.fromRGBO(104, 178, 160, 1),
														Color.fromRGBO(48, 130, 146, 1),
													],
												),
											),
											child: Center(
												child: Text(
													"Recommended",
													style: TextStyle(
														fontSize: MediaQuery.of(context).size.height*0.014,
														color: Colors.white,	
													)
												),
											),
											height: MediaQuery.of(context).size.height*0.025,
											width:MediaQuery.of(context).size.width*0.22,
										),
										elevation: 12,
									),
								): Text(''),
							],
						),
					),
					Expanded(
						flex:1,
						child: IconButton(
							icon: Icon(Icons.share,color: Color.fromRGBO(48, 130, 146, 1),size: MediaQuery.of(context).size.width*0.075,) , 
							
							onPressed: () {
								
							},
						),
					),
					Expanded(
						flex:1,
						child:Container()
					),
				],
			)
		  ],
		);
	}

}
class ArtistImage extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: (){
				showDialog(  
					barrierDismissible: true,
					context: context,  
					builder: (BuildContext context) {  
						return Card(
							color: Colors.black,
							// child: Container(  
							// 	//title: Text("Selection Error"),
							// 	// width: MediaQuery.of(context).size.width*0.95,
							// 	// height:MediaQuery.of(context).size.width*0.95,
							// 	child:Image.asset('artist_image/$artistname.jpg'),
							// ),
							// child:Image.asset('artist_image/$artistname.jpg'),
						);  
					},  
				);
			},
			child: Container(
				width:MediaQuery.of(context).size.width*0.25,
				child:ClipRRect(
					borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
						// child: Image.asset('artist_image/$artistname.jpg')
				)
			),
		);
  	}

}
class Experience extends StatelessWidget{
  @override
  	Widget build(BuildContext context) {
    	return Column(
    		children:<Widget>[
    			Container(
    				width: MediaQuery.of(context).size.width*0.15,
   					height:MediaQuery.of(context).size.width*0.15,
   					decoration: BoxDecoration(
   						borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.05)),
   						border: Border.all(width: MediaQuery.of(context).size.width*0.003,color: Colors.black),
						color: Colors.white,
						boxShadow: [
							BoxShadow(
								color:Colors.black,
								blurRadius: MediaQuery.of(context).size.width*0.004,
								spreadRadius: 0,
								offset: Offset( -MediaQuery.of(context).size.width*0.006, MediaQuery.of(context).size.width*0.004)
							)
						],
   					),
    				child: Center(
    					child: data['expirience'] == null?Text('0'):Text(
							'${data['expirience']['year']} yrs',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize: MediaQuery.of(context).size.width*0.035,
							),
						)
    					,
    				)
    			),
				Container(
   						height:MediaQuery.of(context).size.width*0.02,
				),
    			Text(
					'Experience',
					style:TextStyle(
						fontSize: MediaQuery.of(context).size.width*0.025,
						fontWeight: FontWeight.bold,
					),

				)
    		]
    	);
  	}
}
class Duration extends StatelessWidget{
  @override
  	Widget build(BuildContext context) {
    	return Column(
    		children:<Widget>[
    			Container(
    				width: MediaQuery.of(context).size.width*0.15,
   					height:MediaQuery.of(context).size.width*0.15,
   					decoration: BoxDecoration(
   						borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.05)),
   						border: Border.all(width: MediaQuery.of(context).size.width*0.003,color: Colors.black),
						color: Colors.white,
						boxShadow: [
							BoxShadow(
								color:Colors.black,
								blurRadius: MediaQuery.of(context).size.width*0.004,
								spreadRadius: 0,
								offset: Offset( -MediaQuery.of(context).size.width*0.006, MediaQuery.of(context).size.width*0.004)
							)
						],
   					),
					child:Center(
						child: Text(
							'3 hrs',
							style:TextStyle(
								fontSize: MediaQuery.of(context).size.width*0.035,
								fontWeight: FontWeight.bold,
							),
						),
					)
    			),
				Container(
					height:MediaQuery.of(context).size.width*0.02,
						
				),
    			Text(
					'Duration',
					style:TextStyle(fontSize: MediaQuery.of(context).size.width*0.025,fontWeight: FontWeight.bold,),
				)
    		]
    	);
  	}

}

class PeoplesChoice extends StatelessWidget{
  @override
  	Widget build(BuildContext context) {
   		return data['people choice'] !=false ? Column(
   			children:<Widget>[
   				Container(
   					width: MediaQuery.of(context).size.width*0.15,
   					height:MediaQuery.of(context).size.width*0.15,
   					decoration: BoxDecoration(
   						borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.05)),
   						border: Border.all(width: MediaQuery.of(context).size.width*0.003,color: Colors.black),
						color: Colors.white,
						boxShadow: [
							BoxShadow(
								color:Colors.black,
								blurRadius: MediaQuery.of(context).size.width*0.004,
								spreadRadius: 0,
								offset: Offset( -MediaQuery.of(context).size.width*0.006, MediaQuery.of(context).size.width*0.004)
							)
						],
   					),
   					child:Center(
   						child:Icon(
   							Icons.star,
   							color: data['people choice'] =='1'? Colors.blue: data['people choice'] =='2' ? Colors.orange:
   							Colors.yellow ,
   						),
   					)
   				),
				Container(
   						height:MediaQuery.of(context).size.width*0.02,
				),
   				Text(
					   'People\'s choice',
					   style:TextStyle(fontSize: MediaQuery.of(context).size.width*0.025,fontWeight: FontWeight.bold,)
				)
   			]
   		):Text('');
  	}
}
class AboutArtist extends StatelessWidget{
  	@override
	Widget build(BuildContext context) {
		return 	Container(
			padding:EdgeInsets.all(
				(MediaQuery.of(context).size.width*0.05)
			),
    		decoration: BoxDecoration(
    			borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.05)),
    			border: Border.all(width: MediaQuery.of(context).size.width*0.002,color: Color.fromRGBO(104, 178, 160, 1)),
    			color: Colors.white,
    			boxShadow: [
    				BoxShadow(
    					color:Color.fromRGBO(48, 130, 146, 1),
    					blurRadius: MediaQuery.of(context).size.width*0.002,
    					spreadRadius: 0,
    					offset: Offset( -MediaQuery.of(context).size.width*0.004, MediaQuery.of(context).size.width*0.004)
    				)
    			],
    		),
					child: ConfigurableExpansionTile(
						initiallyExpanded: true,
						animatedWidgetFollowingHeader: const Icon(
						Icons.expand_more,
							color: Color(0xFF707070),
						),
						header: Text(
							'Introduction',
							style: TextStyle(
								color: Colors.black,
								fontWeight: FontWeight.bold,
								fontSize: MediaQuery.of(context).size.width*0.05,
								fontFamily: 'SpecialElite-Regular',
							),
						),
						children:<Widget>[
							Text(
								data['description'],
								textAlign: TextAlign.justify,
								style: TextStyle(
									fontFamily: 'SpecialElite-Regular',
								),
							)
						],
					),
				)
				// Container(
				// 	width: MediaQuery.of(context).size.width*0.95,
				// 	child: Text(data['description'],textAlign: TextAlign.justify,),
				// ),
			;
	}
}
class ComfortLanguage extends StatelessWidget{
  	@override
  	Widget build(BuildContext context) {
    	return Container(
			padding:EdgeInsets.all(
				(MediaQuery.of(context).size.width*0.05)
			),
    		decoration: BoxDecoration(
    			borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.05)),
    			border: Border.all(width: MediaQuery.of(context).size.width*0.002,color: Color.fromRGBO(104, 178, 160, 1)),
    			color: Colors.white,
    			boxShadow: [
    				BoxShadow(
    					color:Color.fromRGBO(48, 130, 146, 1),
    					blurRadius: MediaQuery.of(context).size.width*0.002,
    					spreadRadius: 0,
    					offset: Offset( -MediaQuery.of(context).size.width*0.004, MediaQuery.of(context).size.width*0.004)
    				)
    			],
    		),
    		child: ConfigurableExpansionTile(
    			initiallyExpanded: true,
    			animatedWidgetFollowingHeader: const Icon(
    			Icons.expand_more,
    				color: Color(0xFF707070),
    			),
    			header: Text(
    					'languages Preferred: ',
    					// style: TextStyle(
    					// 	color: Color.fromRGBO(2, 0, 110, 1),
    					// 	fontWeight: FontWeight.bold,
    					// 	fontSize: 15,
    					// ),
    					style: TextStyle(
    						color: Colors.black,
    						fontWeight: FontWeight.bold,
    						fontSize: MediaQuery.of(context).size.width*0.05,
    						fontFamily: 'SpecialElite-Regular',
    					),
    				),
    				children: [
    					Container(
    						alignment: AlignmentDirectional.centerStart,
    						child: Wrap(
    							children: <Widget>[
    								for ( var i in data['comfort'] ) 
    									Padding(
    										padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.009),
    											child: Container(
    												padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
    												decoration: BoxDecoration(
    													borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
    													//border: Border.all(width: 1,color: Colors.black),
														color: Colors.blueGrey
    												),
    											child:Text(
													' ${i.toString()} ',
													style: TextStyle(
														color: Colors.white,
														fontSize: MediaQuery.of(context).size.width*0.036
													),
												)
    										),
    									)						
    							],
    						),
    					),
    				],
    			),
    		)
					
					// Wrap(
					// 	children: <Widget>[
					// 		for ( var i in data['comfort'] ) 
					// 			Padding(
					// 				padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.009),
					// 					child: Container(
					// 						padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
					// 					decoration: BoxDecoration(
					// 						borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
					// 						border: Border.all(width: 1,color: Colors.black),
					// 					),
					// 					child:Text(' ${i.toString()} ')
					// 			  	),
					// 			)						
					// 	],
					// ),
				
			
    	  
    	;
  	}
}
class PreferredEvents extends StatelessWidget{
  	@override
  	Widget build(BuildContext context) {
    	return Container(
			padding:EdgeInsets.all(
				(MediaQuery.of(context).size.width*0.05)
			),
    		decoration: BoxDecoration(
    			borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.05)),
    			border: Border.all(width: MediaQuery.of(context).size.width*0.002,color: Color.fromRGBO(104, 178, 160, 1)),
    			color: Colors.white,
    			boxShadow: [
    				BoxShadow(
    					color:Color.fromRGBO(48, 130, 146, 1),
    					blurRadius: MediaQuery.of(context).size.width*0.002,
    					spreadRadius: 0,
    					offset: Offset( -MediaQuery.of(context).size.width*0.004, MediaQuery.of(context).size.width*0.004)
    				)
    			],
    		),
    		child: ConfigurableExpansionTile(
    			initiallyExpanded: true,
    			animatedWidgetFollowingHeader: const Icon(
    			Icons.expand_more,
    				color: Color(0xFF707070),
    			),
    			header: Text(
    					'Events Preferred: ',
    					// style: TextStyle(
    					// 	color: Color.fromRGBO(2, 0, 110, 1),
    					// 	fontWeight: FontWeight.bold,
    					// 	fontSize: 15,
    					// ),
    					style: TextStyle(
    						color: Colors.black,
    						fontWeight: FontWeight.bold,
    						fontSize: MediaQuery.of(context).size.width*0.05,
    						fontFamily: 'SpecialElite-Regular',
    					),
    				),
    				children: [
    					Container(
    						alignment: AlignmentDirectional.centerStart,
    						child: Wrap(
    							children: <Widget>[
    								for ( var i in data['event type'] ) 
    									Padding(
    										padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.009),
    											child: Container(
    												
    												padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
    											decoration: BoxDecoration(
    												borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
    												//border: Border.all(width: 1,color: Colors.black),
													color: Colors.blueGrey.withOpacity(0.8),
    											),
    											child:Text(
													' ${i.toString()} ',
													style: TextStyle(
														color: Colors.white,
														fontSize: MediaQuery.of(context).size.width*0.036
													),
												)
    										),
    									)						
    							],
    						),
    					),
    				],
    			),
    		);
  	}
}
class Price extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
		mainAxisAlignment: MainAxisAlignment.spaceBetween,
		children: <Widget>[
			Expanded(
				flex: 1,
				child:Container()
			),
			Expanded(
				flex:12,
				//alignment: Alignment.bottomLeft,
				child: Text(
					'Book For:',
					style: TextStyle(
						color: Colors.black87,
						fontWeight: FontWeight.bold,
						fontSize:  MediaQuery.of(context).size.width*0.045,
					),
				),
			),
			Expanded(
				flex:12,
				child: Align(
					alignment: Alignment.bottomRight,
					child: Text(
						'(${data['min_price']} - ${data['max_price']})',
						style: TextStyle(
							color:Colors.black,
							//fontWeight: FontWeight.bold,
							fontSize:  MediaQuery.of(context).size.width*0.047,
						),
					),
				),
			),
			Expanded(
				flex: 1,
				child:Container()
			),
		],
	);
  }

}