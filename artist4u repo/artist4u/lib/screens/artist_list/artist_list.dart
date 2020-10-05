import 'dart:convert';

import 'package:artist4u/const.dart';
import 'package:artist4u/modals/get_artist_list_modal.dart';
import 'package:artist4u/services/get_artistlist.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class ArtisList extends StatefulWidget{
	String title;
	ArtisList(this.title);
  @override
  State<StatefulWidget> createState() {
    return _ArtisListState();
  }
  
}
List<Map<String, dynamic>> artistlist;
class _ArtisListState extends State<ArtisList> {
	Future<GetArtistListl> _artistList;
	@override
	void initState(){
		debugPrint(widget.title.toLowerCase());
		_artistList = GetArtistListModalFromServer().getArtistListModalFromServer(widget.title.toLowerCase());
		super.initState();
	}
	@override
 	Widget build(BuildContext context) {
		 return FutureBuilder<GetArtistListl>(
			future: _artistList,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
				if(snapshot.hasData){
					return ListView.builder(
						itemCount: snapshot.data.result.length,
						itemBuilder: (context,index){
							var data = snapshot.data.result[index];
							var profileimage = 'http://$ip:3000/artisttype/${data.artistType}/${data.id}/profile/${data.profile.originalname.toString().replaceAll('\\','/')}';
							var typesofshow = jsonDecode(data.typesofshow[0]);
							return Card(
						// shape: RoundedRectangleBorder(
              			// 	side: BorderSide(color: Colors.blueGrey, width: 2.0),
						// ),
						elevation: 10,
						child:Container(
							child: Row(
								children: <Widget>[
									Expanded(
										flex:3,
										child:GestureDetector(
											onTap: (){
												showDialog(  
													barrierDismissible: true,
													context: context,  
													builder: (BuildContext context) {  
														return Center(
															child: Container(  
																//title: Text("Selection Error"),
																width: MediaQuery.of(context).size.width*0.95,
																height:MediaQuery.of(context).size.width*0.95,
																// child: OnTapVideo(
																// 	url: artistlist[index]['preview'],
																// ),
																// actions: [
																// 	FlatButton(
																// 		onPressed: () => Navigator.pop(context, false), // passing false
																// 		child: Text('Close'),
																// 	),],  
															)	,
														);  
													},  
												);
												// .then((val){
													
												// });
											},
											child: Container(
												height: MediaQuery.of(context).size.width*0.32,
												decoration: BoxDecoration(
													borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width)),
													image: DecorationImage(image: NetworkImage(profileimage),fit:BoxFit.fill)
												),
												// child: Image.network(profileimage)
											),
										)
									),
									Expanded(flex:0,child: SizedBox(width:MediaQuery.of(context).size.width*0.02)),
									Expanded(
										flex:6,
										child: Column(
											children:<Widget>[
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: <Widget>[
														Expanded(
															flex:4,
															child: Container(
																width: MediaQuery.of(context).size.width*0.45,
																child: Wrap(
																	children:<Widget>[ 
																		Text(
																			data.name,
																			style: TextStyle(
																				color: Colors.black,
																				fontWeight: FontWeight.w500,
																				fontSize: 18,
																				//fontFamily: 'Sriracha-Regular'
																			),
																		),
																	]
																),
															),
														),
														Expanded(
														flex:2,
															child: Container(
																child: Row(
																	children:<Widget>[
																		Expanded(
																			child: IconButton(
																				icon: Icon(Icons.share) , 
																				onPressed: () {
																					setState(() {
																					print(index);
																					});
																				},
																			),
																		),
																		Expanded(
																			child: IconButton(
																				color: Colors.red,
																				icon: this.a==false ? Icon(Icons.favorite) : Icon(Icons.favorite_border), 
																				onPressed: () {
																					setState(() {
																					print(index);
																					});
																				},
																			),
																		),
																	]
																	),
															),
														)
													],
												),
												Row(
													children: <Widget>[
														data.recommended != false.toString() ? 
															// child:Chip(
															// 	backgroundColor: Color.fromRGBO(104, 178, 160, 1),
															// 	label: Text(
															// 		"Recommended",
															// 		style: TextStyle(
															// 			fontSize: MediaQuery.of(context).size.height*0.013,
															// 		)
															// 	),
															// ),
														Expanded(
															flex:3,
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
																				fontSize: MediaQuery.of(context).size.height*0.015,
																				color: Colors.white,	
																			)
																		),
																	),
																	height: MediaQuery.of(context).size.height*0.04,
																	width:MediaQuery.of(context).size.width*0.32,
																),
																elevation: 12,
															),
														):Text(''),
														data.peopleschoice != 0.toString() ? 
															Expanded(
																flex:4,
																child: Card(
																	color: Color.fromRGBO(205, 224, 201,1),
																	elevation: 12,
																	shape: RoundedRectangleBorder(
																		//side: BorderSide(color: Colors.blueGrey, width: 2.0),
																		borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.32)),
																	),
																	child:Container(
																		decoration: BoxDecoration(
																			color: Color.fromRGBO(104, 178, 160,1),
																			borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.35)),
																			//border: Border.all(width: 1,color: Colors.black),
																		),
																		child:Center(
																		  child: Chip(
																		  	avatar: CircleAvatar(
																		  		backgroundColor: Color.fromRGBO(205, 224, 201,1),
																		  		child:Icon(
																		  			Icons.star,
																		  			color: data.peopleschoice =='1'? Colors.blue: data.peopleschoice =='2' ? Colors.orange:
																		  			Colors.yellow ,
																		  		)
																		  	),
																		  	backgroundColor: Color.fromRGBO(104, 178, 160,1),
																		  	label: Text(
																		  		"People's Choice",
																		  		style: TextStyle(
																					  color: Colors.white,
																		  			fontSize: MediaQuery.of(context).size.height*0.016,
																		  		)
																		  	),
																		  ),
																		),
																		height: MediaQuery.of(context).size.height*0.04,
																		width:MediaQuery.of(context).size.width*0.32,
																	),
																),
														):Text(''),
													],
												),
												SizedBox(height:MediaQuery.of(context).size.width*0.01),
												Align(
													alignment: AlignmentDirectional.topStart,
													child: Wrap(
														children:<Widget>[ 
															Text(data.description)
														]
													)
												),
												SizedBox(height:MediaQuery.of(context).size.width*0.01),
												Align(
													alignment: AlignmentDirectional.topStart,
														child:Text(
															'Experience: missing',
															style: TextStyle(
																fontWeight: FontWeight.bold,		
															),
														)
												),
												SizedBox(height:MediaQuery.of(context).size.width*0.01),
												Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: <Widget>[
														Expanded(
															flex:3,
															child: Container(
																width: MediaQuery.of(context).size.width*0.45,
																alignment: AlignmentDirectional.topStart,
																child: typesofshow.length<4?Wrap(
																	children: <Widget>[
																		for ( var i in typesofshow )
																		Padding(
																			padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.009),
																				child: Container(
																					padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
																					decoration: BoxDecoration(
																						borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
																						gradient: LinearGradient(
																							colors: [
																								Color.fromRGBO(104, 178, 160, 1),
																								Color.fromRGBO(133, 195, 210, 1),
																							],
																						),
																						//border: Border.all(width: 1,color: Colors.black),
																					),
																					child:Text(
																						'${i.toString()}',
																						style: TextStyle(
																					  		color: Colors.white,
																		  						fontSize: MediaQuery.of(context).size.height*0.014,
																		  					)
																					)
																				),
																		)
																	],
																):Text('3+ Languages'),
															),
														),
														Expanded(
															flex:2,
															child: Align(
																alignment: Alignment.bottomRight,
																child: FlatButton(
																	color: Colors.green,
																	child: Text(
																		'Book Now',
																		style: TextStyle(
																			color: Colors.white,
																			fontSize: MediaQuery.of(context).size.height*0.017, 
																		),
																	),
																	onPressed: (){
																		Navigator.pushNamed(context, '/artistbiopage',arguments: {'title':data.name,'artisttype':data.artistType,"id":data.id});
																	},
																),
														),
														),
													],
												),
												// Align(
												// 	alignment: Alignment.bottomRight,
												// 	child: FlatButton(
												// 		color: Colors.green,
												// 		child: Text(
												// 			'Book Now',
												// 			style: TextStyle(
												// 				color: Colors.white
												// 			),
												// 		),
												// 		onPressed: (){
												// 			Navigator.pushNamed(context, '/artistbiopage',arguments: {'title':artistlist[index]['name']});
												// 		},
												// 	),
												// ),   										
											]
										),
									),
								],
							),
						)
					);
						}
					);
				}else{
					return Center(child:CircularProgressIndicator());
				}
			});
	}
	var a=true;
	var disable=false;
  // 	@override
 	// Widget build(BuildContext context) {
  //   	return SliverList(
	// 		delegate: SliverChildBuilderDelegate(
	// 			(BuildContext context, int index) {
	// 				return Card(
	// 					// shape: RoundedRectangleBorder(
  //             			// 	side: BorderSide(color: Colors.blueGrey, width: 2.0),
	// 					// ),
	// 					elevation: 10,
	// 					child:Container(
	// 						child: Row(
	// 							children: <Widget>[
	// 								Expanded(
	// 									flex:3,
	// 									child:GestureDetector(
	// 										onTap: (){
	// 											showDialog(  
	// 												barrierDismissible: true,
	// 												context: context,  
	// 												builder: (BuildContext context) {  
	// 													return Center(
	// 														child: Container(  
	// 														//title: Text("Selection Error"),
	// 														width: MediaQuery.of(context).size.width*0.95,
	// 														height:MediaQuery.of(context).size.width*0.95,
	// 														child: OnTapVideo(
	// 															url: artistlist[index]['preview'],
	// 														),
	// 														// actions: [
	// 														// 	FlatButton(
	// 														// 		onPressed: () => Navigator.pop(context, false), // passing false
	// 														// 		child: Text('Close'),
	// 														// 	),],  
	// 													),
	// 													);  
	// 												},  
	// 											);
	// 											// .then((val){
													
	// 											// });
	// 										},
	// 										child: ClipRRect(
	// 											borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
	// 												child: Image.asset('artist_image/${artistlist[index]['image']}'
	// 											)
	// 										),
	// 									)
	// 								),
	// 								Expanded(flex:0,child: SizedBox(width:MediaQuery.of(context).size.width*0.02)),
	// 								Expanded(
	// 									flex:6,
	// 									child: Column(
	// 										children:<Widget>[
	// 											Row(
	// 												mainAxisAlignment: MainAxisAlignment.spaceBetween,
	// 												children: <Widget>[
	// 													Expanded(
	// 														flex:4,
	// 														child: Container(
	// 															width: MediaQuery.of(context).size.width*0.45,
	// 															child: Wrap(
	// 																children:<Widget>[ 
	// 																	Text(
	// 																		artistlist[index]['name'],
	// 																		style: TextStyle(
	// 																			color: Colors.black,
	// 																			fontWeight: FontWeight.w500,
	// 																			fontSize: 18,
	// 																			//fontFamily: 'Sriracha-Regular'
	// 																		),
	// 																	),
	// 																]
	// 															),
	// 														),
	// 													),
	// 													Expanded(
	// 													flex:2,
	// 														child: Container(
	// 															child: Row(
	// 																children:<Widget>[
	// 																	Expanded(
	// 																		child: IconButton(
	// 																			icon: Icon(Icons.share) , 
	// 																			onPressed: () {
	// 																				setState(() {
	// 																				print(index);
	// 																				});
	// 																			},
	// 																		),
	// 																	),
	// 																	Expanded(
	// 																		child: IconButton(
	// 																			color: Colors.red,
	// 																			icon: this.a==false ? Icon(Icons.favorite) : Icon(Icons.favorite_border), 
	// 																			onPressed: () {
	// 																				setState(() {
	// 																				print(index);
	// 																				});
	// 																			},
	// 																		),
	// 																	),
	// 																]
	// 																),
	// 														),
	// 													)
	// 												],
	// 											),
	// 											Row(
	// 												children: <Widget>[
	// 													artistlist[index]['recommended'] != false ? 
	// 														// child:Chip(
	// 														// 	backgroundColor: Color.fromRGBO(104, 178, 160, 1),
	// 														// 	label: Text(
	// 														// 		"Recommended",
	// 														// 		style: TextStyle(
	// 														// 			fontSize: MediaQuery.of(context).size.height*0.013,
	// 														// 		)
	// 														// 	),
	// 														// ),
	// 													Expanded(
	// 														flex:3,
	// 														child: Card(
	// 															shape: RoundedRectangleBorder(
	// 																	//side: BorderSide(color: Colors.blueGrey, width: 2.0),
	// 																	borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.32)),
	// 																),
	// 															child:Container(
	// 																decoration: BoxDecoration(
	// 																	borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.32)),
	// 																	//border: Border.all(width: 1,color: Colors.black),
	// 																	gradient: LinearGradient(
	// 																		colors: [
	// 																			Color.fromRGBO(104, 178, 160, 1),
	// 																			Color.fromRGBO(48, 130, 146, 1),
	// 																		],
	// 																	),
	// 																),
	// 																child: Center(
	// 																	child: Text(
	// 																		"Recommended",
	// 																		style: TextStyle(
	// 																			fontSize: MediaQuery.of(context).size.height*0.015,
	// 																			color: Colors.white,	
	// 																		)
	// 																	),
	// 																),
	// 																height: MediaQuery.of(context).size.height*0.04,
	// 																width:MediaQuery.of(context).size.width*0.32,
	// 															),
	// 															elevation: 12,
	// 														),
	// 													):Text(''),
	// 													artistlist[index]['people choice'] != false ? 
	// 														Expanded(
	// 															flex:4,
	// 															child: Card(
	// 																color: Color.fromRGBO(205, 224, 201,1),
	// 																elevation: 12,
	// 																shape: RoundedRectangleBorder(
	// 																	//side: BorderSide(color: Colors.blueGrey, width: 2.0),
	// 																	borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.32)),
	// 																),
	// 																child:Container(
	// 																	decoration: BoxDecoration(
	// 																		color: Color.fromRGBO(104, 178, 160,1),
	// 																		borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.35)),
	// 																		//border: Border.all(width: 1,color: Colors.black),
	// 																	),
	// 																	child:Center(
	// 																	  child: Chip(
	// 																	  	avatar: CircleAvatar(
	// 																	  		backgroundColor: Color.fromRGBO(205, 224, 201,1),
	// 																	  		child:Icon(
	// 																	  			Icons.star,
	// 																	  			color: artistlist[index]['people choice'] =='1'? Colors.blue: artistlist[index]['people choice'] =='2' ? Colors.orange:
	// 																	  			Colors.yellow ,
	// 																	  		)
	// 																	  	),
	// 																	  	backgroundColor: Color.fromRGBO(104, 178, 160,1),
	// 																	  	label: Text(
	// 																	  		"People's Choice",
	// 																	  		style: TextStyle(
	// 																				  color: Colors.white,
	// 																	  			fontSize: MediaQuery.of(context).size.height*0.016,
	// 																	  		)
	// 																	  	),
	// 																	  ),
	// 																	),
	// 																	height: MediaQuery.of(context).size.height*0.04,
	// 																	width:MediaQuery.of(context).size.width*0.32,
	// 																),
	// 															),
	// 													):Text(''),
	// 												],
	// 											),
	// 											SizedBox(height:MediaQuery.of(context).size.width*0.01),
	// 											Align(
	// 												alignment: AlignmentDirectional.topStart,
	// 												child: Wrap(
	// 													children:<Widget>[ 
	// 														Text(artistlist[index]['description'])
	// 													]
	// 												)
	// 											),
	// 											SizedBox(height:MediaQuery.of(context).size.width*0.01),
	// 											Align(
	// 												alignment: AlignmentDirectional.topStart,
	// 													child:Text(
	// 														'Experience: ${artistlist[index]['expirience']}',
	// 														style: TextStyle(
	// 															fontWeight: FontWeight.bold,		
	// 														),
	// 													)
	// 											),
	// 											SizedBox(height:MediaQuery.of(context).size.width*0.01),
	// 											Row(
	// 												mainAxisAlignment: MainAxisAlignment.spaceBetween,
	// 												children: <Widget>[
	// 													Expanded(
	// 														flex:3,
	// 														child: Container(
	// 															width: MediaQuery.of(context).size.width*0.45,
	// 															alignment: AlignmentDirectional.topStart,
	// 															child: artistlist[index]['comfort'].length<4?Wrap(
	// 																children: <Widget>[
	// 																	for ( var i in artistlist[index]['comfort'] )
	// 																	Padding(
	// 																		padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.009),
	// 																			child: Container(
	// 																				padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
	// 																				decoration: BoxDecoration(
	// 																					borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
	// 																					gradient: LinearGradient(
	// 																						colors: [
	// 																							Color.fromRGBO(104, 178, 160, 1),
	// 																							Color.fromRGBO(133, 195, 210, 1),
	// 																						],
	// 																					),
	// 																					//border: Border.all(width: 1,color: Colors.black),
	// 																				),
	// 																				child:Text(
	// 																					'${i.toString()}',
	// 																					style: TextStyle(
	// 																				  		color: Colors.white,
	// 																	  						fontSize: MediaQuery.of(context).size.height*0.014,
	// 																	  					)
	// 																				)
	// 																			),
	// 																	)
	// 																],
	// 															):Text('3+ Languages'),
	// 														),
	// 													),
	// 													Expanded(
	// 														flex:2,
	// 														child: Align(
	// 															alignment: Alignment.bottomRight,
	// 															child: FlatButton(
	// 																color: Colors.green,
	// 																child: Text(
	// 																	'Book Now',
	// 																	style: TextStyle(
	// 																		color: Colors.white,
	// 																		fontSize: MediaQuery.of(context).size.height*0.017, 
	// 																	),
	// 																),
	// 																onPressed: (){
	// 																	Navigator.pushNamed(context, '/artistbiopage',arguments: {'title':artistlist[index]['name']});
	// 																},
	// 															),
	// 													),
	// 													),
	// 												],
	// 											),
	// 											// Align(
	// 											// 	alignment: Alignment.bottomRight,
	// 											// 	child: FlatButton(
	// 											// 		color: Colors.green,
	// 											// 		child: Text(
	// 											// 			'Book Now',
	// 											// 			style: TextStyle(
	// 											// 				color: Colors.white
	// 											// 			),
	// 											// 		),
	// 											// 		onPressed: (){
	// 											// 			Navigator.pushNamed(context, '/artistbiopage',arguments: {'title':artistlist[index]['name']});
	// 											// 		},
	// 											// 	),
	// 											// ),   										
	// 										]
	// 									),
	// 								),
	// 							],
	// 						),
	// 					)
	// 				);
	// 			},
	// 			childCount:artistlist.length,
	// 		),
	// 	);
  // 	}
}

class OnTapVideo extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
	final String url;
	OnTapVideo({
		@required this.url,
		//this.dispose,
		Key key,
	}) : super(key: key);

	@override
	_OnTapVideoState createState() => _OnTapVideoState();
}

class _OnTapVideoState extends State<OnTapVideo> {
	ChewieController _chewieController;
	VideoPlayerController onTapVideoController;
	@override
	void initState() {
		super.initState();
		onTapVideoController=VideoPlayerController.network(widget.url);
		// Wrapper on top of the videoPlayerController
		_chewieController = ChewieController(
			//videoPlayerController: widget.videoPlayerController,
			videoPlayerController: onTapVideoController,
			aspectRatio: 5 / 4,
			// Prepare the video to be played and display the first frame
			autoInitialize: true,
			looping: false,
			// Errors can occur for example when trying to play a video
			// from a non-existent URL
			errorBuilder: (context, errorMessage) {
				return Center(
					child: Text(
						'url not found',
						style: TextStyle(color: Colors.white),
					),
				);
			},
		
		);
	}
	@override
	Widget build(BuildContext context) {
		return Chewie(
			controller: _chewieController,
		);
	}
	@override
	void dispose() {
		// IMPORTANT to dispose of all the used resources
		_chewieController.dispose();
		onTapVideoController.dispose();
    	super.dispose();
		
	}
}
