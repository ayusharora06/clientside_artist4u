import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Map<String,dynamic> data={'name':'Shubham Khanduri','image':'shubham.jpg', 'people choice':'1','recommended':true,'description':'Rajput made his film debut in the buddy drama Kai Po Che! (2013), for which he received a nomination for the Filmfare Award for Best Male Debut. He then starred in the romantic comedy Shuddh Desi Romance (2013) and as the titular detective in the action thriller Detective Byomkesh Bakshy! (2015). His highest-grossing releases came with a supporting role in the satire PK (2014), followed by the titular role in the sports biopic M.S. Dhoni: The Untold Story (2016). For his performance in the latter, he received his first nomination for the Filmfare Award for Best Actor.[6][7] Rajput went on to star in the commercially successful films Kedarnath (2018) and Chhichhore (2019)','expirience':{'year':1},'comfort':['English','hindi','tamil','hindi','tamil','hindi','tamil','hindi','tamil'],'event type':['Devotional', 'Charity','Corporate'],'id':1,'min_price':'2,500','max_price':'5,000'};
String artistname;
// ignore: must_be_immutable
class ArtistBasicInfo extends StatelessWidget{
	final String name;
	String recommended;
	String profile;
	String duration;
	String peopleschoice;
  String experience;
	ArtistBasicInfo({this.name,this.recommended,this.profile,this.duration,this.peopleschoice,this.experience}){
		artistname=name;
	}
	@override
	Widget build(BuildContext context) {
		return Column(
		  	children: <Widget>[
				Row(
					children: <Widget>[
						ArtistImage(this.profile),
						Expanded(flex:2,child: Experience(this.experience)),
						Expanded(flex:2,child: Duration(this.duration)),
						Expanded(flex:2,child: PeoplesChoice(this.peopleschoice))
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
									artistname,
									style: TextStyle(
										color: Colors.black,
										fontWeight: FontWeight.w500,
										fontSize: MediaQuery.of(context).size.width*0.06,
										//fontFamily: 'Sriracha-Regular'
									),
								),
								//(width:MediaQuery.of(context).size.width*0.02),
								recommended =='true' ?
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
// ignore: must_be_immutable
class ArtistImage extends StatelessWidget{
	String profile;
	ArtistImage(this.profile);
	@override
	Widget build(BuildContext context) {
		// debugPrint('\n\n\nasdasd $profile asdasd\n\n\n');
		return GestureDetector(
			onTap: (){
				showDialog(  
					barrierDismissible: true,
					context: context,  
					builder: (BuildContext context) {  
						return Container(
							padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.25,horizontal: MediaQuery.of(context).size.height*0.05),
							// width:MediaQuery.of(context).size.height*0.18,
							// height:MediaQuery.of(context).size.height*0.18,
							child:Image.network(profile,fit: BoxFit.fill,)
						);
					},  
				);
			},
			child: Container(
				width:MediaQuery.of(context).size.height*0.18,
				height:MediaQuery.of(context).size.height*0.18,
				child:ClipRRect(
					borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
						child: Image.network(profile,fit: BoxFit.fill,),
				)
			),
		);
  	}

}
// ignore: must_be_immutable
class Experience extends StatelessWidget{
  String experience;
  Experience(this.experience);
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
    					child: Text(
							'$experience',
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
// ignore: must_be_immutable
class Duration extends StatelessWidget{
	String duration;
	Duration(this.duration);
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
							'${this.duration}',
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

// ignore: must_be_immutable
class PeoplesChoice extends StatelessWidget{
	String peopleschoice;
	PeoplesChoice(this.peopleschoice);
  @override
  	Widget build(BuildContext context) {
   		return peopleschoice !='0' ? Column(
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
   							color: peopleschoice =='1'? Colors.blue: peopleschoice =='2' ? Colors.orange:
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
// ignore: must_be_immutable
class AboutArtist extends StatelessWidget{
	String description;
	AboutArtist(this.description);
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
								description,
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
// ignore: must_be_immutable
class ComfortLanguage extends StatelessWidget{
	List preferredlanguage;
	ComfortLanguage({this.preferredlanguage});
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
    								for ( var i in preferredlanguage ) 
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
// ignore: must_be_immutable
class PreferredEvents extends StatelessWidget{
	List preferredevents;
	PreferredEvents({this.preferredevents});
  	@override
  	Widget build(BuildContext context) {
		//   debugPrint(preferredevents.toString());
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
    								for ( var i in preferredevents ) 
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

// ignore: must_be_immutable
class Specialization extends StatelessWidget{
	List specialization;
	Specialization({this.specialization});
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
    					'Specialization: ',
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
    								for ( var i in specialization ) 
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

// ignore: must_be_immutable
class Price extends StatelessWidget{
  String single='';
  List multiple=[''];
  String unifiedprice;
  Price({this.single,this.multiple,this.unifiedprice});
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
						unifiedprice=='true'?single:multiple.toString(),
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