import 'package:artist4u/modals/post_event.dart';
import 'package:artist4u/services/post_event.dart';
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class BookNowContent extends StatefulWidget{
	final String artistname;
	final String artisttype='actor';

	BookNowContent(this.artistname);

  @override
  _BookNowContentState createState() => _BookNowContentState();
}

class _BookNowContentState extends State<BookNowContent> {
	final List<String> typeofevent=['Charity','Wedding','Family Fucntion', 'Devotional','Corporate','inauguration ','Birthday', 'Seminar'];
	final Map typeofeventprice={'Charity':16000.0,'Wedding':17000.0,'Family Fucntion':18000.0, 'Corporate':19000.0};
 // ignore: avoid_init_to_null
	var selectedevent=null;
	var price=15000.0;
	var gatheringprice=1.0;
	var eventprice=1;
	final List<String> gatheringsize=['0-50','50-100','100-250','250-500','More than 500'];
	final Map gatheringsizeprice={'0-50':1.1,'50-100':1.2,'100-250':1.3,'250-500':1.4,'More than 500':1.5};
	List<Map> eventsdate=[
		{'day':1,'date':null,'time':null,'duration':0.0}
	];
	var _selectedGathering;
	var _currentSliderValue=0.0;
	List<double> durationvalue=[];
	var requirements = TextEditingController();
	var location = TextEditingController();
  var refercode=TextEditingController();
	Widget build(BuildContext context) {
		return Scaffold(
			body: ListView(
				children: <Widget>[
					Column(
						children: <Widget>[
							Stack(
								children: [
									ClipPath(
										clipper: WaveClipperTwo(flip: true),
										child: Container(
											height: MediaQuery.of(context).size.height*0.17,
											color: Color.fromRGBO(67, 67, 67, 1),
										),
									),
									Align(alignment:Alignment.bottomLeft,child: ArtistImage(widget.artistname,margin:true)),
									Align(
										alignment:Alignment.bottomRight,
										child: Container(
											//color: Colors.red,
											margin: EdgeInsetsDirectional.only(top:MediaQuery.of(context).size.height*0.2,end:MediaQuery.of(context).size.width*0.025),
											width:MediaQuery.of(context).size.width*0.5,
											child: Center(
												child: Column(
													children: [
														Text(
															'Shubham Khanduri',
															style:TextStyle(
																fontSize: MediaQuery.of(context).size.height*0.028,
																fontWeight: FontWeight.bold,
																// decoration: TextDecoration.underline,
															),
														),
														Text(
															'(Musician)',
															style: new TextStyle(
																fontSize: MediaQuery.of(context).size.height*0.02,
																//fontWeight: FontWeight.bold,
																// decoration: TextDecoration.underline,
															),
														)
													],
												),
											),
										),
										),
								],
							),
							//ArtistImage(widget.artistname),
							SizedBox(height: MediaQuery.of(context).size.height*0.02,),
							//type of event
							// Row(
							// 	mainAxisAlignment: MainAxisAlignment.spaceBetween,
							// 	children: [
							// 		Expanded(
							// 			flex:1,
							// 			child: Container(),
							// 		),
							// 		// Expanded(
							// 		// 	flex:8,
							// 		// 	child: DropdownButton(
							// 		// 		hint: Text('Type of Event'),
							// 		// 		value: _selectedEvent,
							// 		// 		onChanged: (newValue) {
							// 		// 			setState(() {
							// 		// 				_selectedEvent = newValue;
							// 		// 				price=typeofeventprice[newValue];
							// 		// 			});
												
							// 		// 		},
							// 		// 		items: typeofevent.map((event) {
							// 		// 			return DropdownMenuItem(
							// 		// 				child: new Text(event),
							// 		// 				value: event,
							// 		// 			);
							// 		// 		}).toList(),
							// 		// 	),
							// 		// ),
							// 		Expanded(
							// 			flex: 4,
							// 			child: Container(),
							// 		),
							// 		//gathering size
							// 		Expanded(
							// 			flex:8,
							// 			child: DropdownButton(
							// 				hint: Text('Gathering Size'),
							// 				value: _selectedGathering,
							// 				onChanged: (newValue) {
							// 				setState(() {
							// 					_selectedGathering = newValue;
							// 					gatheringprice=gatheringsizeprice[newValue];
							// 				});
							// 				},
							// 				items: gatheringsize.map((gathering) {
							// 					return DropdownMenuItem(
							// 						child: new Text(gathering),
							// 						value: gathering,
							// 					);
							// 				}).toList(),
							// 			),
							// 		),
							// 		Expanded(
							// 			flex:1,
							// 			child: Container(),
							// 		),
							// 	],
							// ),
							Align(
								alignment: Alignment.bottomLeft,
								child: Container(
									margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.02),
									child: Row(
										children: [
											Text(
												'Type of Event',
												style: new TextStyle(
													fontSize: MediaQuery.of(context).size.height*0.02,
													fontWeight: FontWeight.bold,
													decoration: TextDecoration.underline,
												),
											),
											Text(' '),
											Icon(Icons.speaker	)
										],
									),
								),
							),
							Container(
								width: MediaQuery.of(context).size.width,
								margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.01),
								child: Card(
									elevation: 6,
									child: Wrap(
										children: [
											for ( var i in typeofevent)
												Container(
												margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.004),
													child: ChoiceChip(
														label: Text('$i'),
														labelStyle: TextStyle(
															color: selectedevent!=i?Colors.black:Colors.white
														),
														backgroundColor: Colors.transparent,
														shape: StadiumBorder(side: BorderSide()),
														selectedColor: Colors.black,
														selected: selectedevent == i,
														onSelected: (bool selected) {
															setState(() {
																selectedevent = selected ? i : null;
															});
														}
													),
												)
										],
									),
								),
							),
							Align(
								alignment: Alignment.bottomLeft,
								child: Container(
									margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.015,left:MediaQuery.of(context).size.height*0.02),
									child: Row(
										children: [
											Text(
												'Gathering Size',
												style: new TextStyle(
													fontSize: MediaQuery.of(context).size.height*0.02,
													fontWeight: FontWeight.bold,
													decoration: TextDecoration.underline,
												),
											),
											Text(' '),
											Icon(Icons.people)
										],
									),
								),
							),
							Container(
								width: MediaQuery.of(context).size.width,
								margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.01),
								child: Card(
									elevation: 6,
									child: Wrap(
										children: [
											for ( var i in gatheringsize)
												Container(
													margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.004),
													child: ChoiceChip(
														label: Text('$i'),
														labelStyle: TextStyle(
															color: _selectedGathering!=i?Colors.black:Colors.white
														),
														backgroundColor: Colors.transparent,
														shape: StadiumBorder(side: BorderSide()),
														selectedColor: Colors.black,
														selected: _selectedGathering == i,
														onSelected: (bool selected) {
															setState(() {
																_selectedGathering = selected ? i : null;
															});
														}
													),
												)
										],
									),
								),
							),

							//event dates
							Align(
								alignment: Alignment.bottomLeft,
								child: Container(
									margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.015,left:MediaQuery.of(context).size.height*0.02),
									child: Row(
										children: [
											Text(
												'Event Detail',
												style: new TextStyle(
													fontSize: MediaQuery.of(context).size.height*0.02,
													fontWeight: FontWeight.bold,
													decoration: TextDecoration.underline,
												),
											),
											Text(' '),
											Icon(Icons.library_books)
										],
									),
								),
							),
							Column(
								children: <Widget>[
									for ( var index in eventsdate)
										Container(
											margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.01),
											child: Card(
												elevation: 6,
												child: Column(
													children: [
														Row(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children: <Widget>[
																Expanded(
																	flex:2,
																	child: Column(
																		mainAxisAlignment: MainAxisAlignment.spaceBetween,
																		children:<Widget>[
																			FlatButton(
																				// height: MediaQuery.of(context).size.height*0.06,
																				// style: Button3dStyle(
																				// 	topColor: Color.fromRGBO(104, 178, 160, 1),
																				// 	backColor:Color.fromRGBO(48, 130, 146, 1),
																				// 	z: MediaQuery.of(context).size.height*0.004,
																				// 	//borderRadius: BorderRadius.zero
																				// ),
																				child: Row(
																					mainAxisAlignment: MainAxisAlignment.center,
																					children: [
																						Text(
																							' Date',
																						),
																						Icon(Icons.event_note)
																					],
																				),
																				// textColor: Colors.white,
																				// color: Color.fromRGBO(104, 178, 160, 1),
																				onPressed: (){
																					showDatePicker(
																						// selectableDayPredicate: (DateTime val) {
																						// 	for (var d in booked){
																						// 		debugPrint(d.toString());
																						// 		if(val.year==DateTime.now().year && val.month==DateTime.now().month && val.day==DateTime.now().day){
																						// 			return true;
																						// 		}
																						// 		if(d['year']==val.year){
																						// 			if(d['month']==val.month){
																						// 				if(d['day']==val.day){
																						// 					return false;
																						// 				}else{
																						// 					return true;
																						// 				}
																						// 			}else{
																						// 				return true;
																						// 			}
																						// 		}else{
																						// 			return true;
																						// 		}
																						// 	}
																						// 	//return true;
																						// },
																						context: context, 
																						initialDate: DateTime.now(), 
																						firstDate: DateTime.now(), 
																						lastDate: DateTime(DateTime.now().year+2)
																					).then(
																						(date){
																							setState(() {
																								if(date!=null){
																									index['date']={'day':date.day.toString(),'month':date.month.toString(),'year':date.year.toString()};
																								}
																							});
																							
																							//debugPrint(index.toString());
																						}
																					);								
																				},
																			),
																			// eventsdate.length>1? IconButton(
																			// 	icon: Icon(Icons.delete), 
																			// 	onPressed: (){
																			// 		setState(() {
																			// 			eventsdate.remove(index);
																			// 			eventprice=eventsdate.length;
																			// 		});
																			// 	},
																			// ):Text(''),
																			Text(
																				index['date'] ==null? 'DD/MM/YYYY': '${index["date"]["day"]}- ${index["date"]["month"]}-${index["date"]["year"]}'
																			),
																		]
																	),
																),
																Expanded(
																	flex:2,
																	child: Column(
																		mainAxisAlignment: MainAxisAlignment.spaceBetween,
																		children: <Widget>[
																			FlatButton(
																				child: Row(
																					mainAxisAlignment: MainAxisAlignment.center,
																					children: [
																						Text("Time"),
																						Icon(Icons.timer)
																					],
																				),
																				onPressed: () {
																					showTimePicker(
																						context: context, 
																						initialTime: TimeOfDay.now(),
																					).then(
																						(time){
																							if(time!=null){
																								setState(() {
																										index['starttime']={'hour':time.hour,'minute':time.minute};
																								});
																							}
																						}
																					);
																				},
																			),
																			Text(
																				index['starttime']==null?'HH:MM':'${index["starttime"]["hour"].toString()}Hrs ${index["starttime"]["minute"].toString()}Min'
																			)
																		],
																	),
																),

																//delete button
																eventsdate.length>1? Expanded(
																	flex:1,
																	child: IconButton(
																		icon: Icon(Icons.delete), 
																		onPressed: (){
																			setState(() {
																				eventsdate.remove(index);
																				durationvalue.removeAt(1);
																				debugPrint(durationvalue.toString());
																				eventprice=eventsdate.length;
																			});
																		},
																	),
																):Expanded(flex:1,child: Text('')),
															],
														),
														Text(''),
														Text(
															'Duration'
														),
														Slider(
															value: index['duration'],
															min: 0,
															max: 8,
															divisions: 8,
															label: index['duration'].round().toString(),
															onChanged: (double value) {
																setState(() {
																	index['duration'] = value;
																	index['duration']=value;
																});
															},
														),
														Text(
															'${index['duration'].toString()} Hrs'
														)
													],
												),
											),
										),
										IconButton(
											icon: Icon(Icons.add_circle), 
											onPressed: (){
												setState(() {
													eventsdate.add({'day':eventsdate.length+1,'date':null,'time':null,'duration':0.0});
													durationvalue.add(0.0);
													debugPrint(eventsdate.toString());
													eventprice=eventsdate.length;
												});
											},
										)
									],
								
							),
							Container(
								margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.01),
								child: TextField(
									controller:location,
									decoration: InputDecoration(
										hintText: "Enter show address",
										border: OutlineInputBorder(
										borderRadius: BorderRadius.all(Radius.circular(10.0)),
										borderSide: BorderSide(color: Colors.grey),
										),
									),
								),
							),
							Container(
								margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.01),
								child: TextField(
									controller:requirements,
									maxLines: 10,
									decoration: InputDecoration(
										hintText: "Let artist know you special requirements",
										border: OutlineInputBorder(
										borderRadius: BorderRadius.all(Radius.circular(10.0)),
										borderSide: BorderSide(color: Colors.grey),
										),
									),
								),
							),

							Container(
								margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.01),
								child: TextField(
									controller:refercode,
									decoration: InputDecoration(
										hintText: "Enter Refer Code",
										border: OutlineInputBorder(
										borderRadius: BorderRadius.all(Radius.circular(10.0)),
										borderSide: BorderSide(color: Colors.grey),
										),
									),
								),
							),
						],
					),
				]
			),
      		bottomNavigationBar: BottomAppBar(
				child: Container(
					height: MediaQuery.of(context).size.height*0.075,
					child: Row(
						mainAxisSize: MainAxisSize.max,
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Column(
								children: [
									Text(
										'Final Price',
										style:  TextStyle(
											fontSize: MediaQuery.of(context).size.height*0.017,
											fontWeight: FontWeight.bold,
											decoration: TextDecoration.underline,
										),
									),
									Text(
										'${(price*eventprice*gatheringprice).toString()}',
										style:  TextStyle(
											fontSize: MediaQuery.of(context).size.height*0.025,
											fontWeight: FontWeight.bold,
											// decoration: TextDecoration.underline,
										),

									),
									Text(
										'(incl. all taxes)',
										style:  TextStyle(
											fontSize: MediaQuery.of(context).size.height*0.015,
											// fontWeight: FontWeight.bold,
											// decoration: TextDecoration.underline,
										),
									)
								],
							),
							ButtonTheme(
								height: MediaQuery.of(context).size.height*0.075,
								minWidth: MediaQuery.of(context).size.width*0.4,
								child: FlatButton(
									// onPressed: (){
									// 	showDialog(
									// 		barrierDismissible: true,
									// 		context: context,  
									// 		builder: (BuildContext context) {  
									// 			return AlertDialog(
									// 				content:Column(
									// 					children: [
									// 						// Text('Confirm your Order'),
									// 						// ArtistImage(widget.artistname),
									// 						// Text(widget.artistname),
									// 						// selectedevent!=null?Text(selectedevent):Text(''),
									// 						// _selectedGathering!=null?Text(_selectedGathering):Text(''),
									// 						// for(var i in eventsdate)
									// 						// 	Container(
									// 						// 		child: Column(
									// 						// 			children: [
									// 						// 				Center(child: Text('Day '+i['day'].toString())),

									// 						// 				i['date']!=null?Text("${i['date']['day']}/${i['date']['month']}/${i['date']['year']}"):Text(''),

									// 						// 				i['starttime']!=null?Text("${i['starttime']['hour']}hrs ${i['starttime']['minute']}"):Text(''),

									// 						// 				i['duration']!=null?Text("${i['duration']}"):Text('')
									// 						// 			],
									// 						// 		),
									// 						// 	),
									// 						// Text('${(price*eventprice*gatheringprice).toString()}'),
									// 						RaisedButton(
									// 							color: Color.fromRGBO(104, 178, 160, 1),
									// 							child: Text(
									// 								'Submit',
									// 								style: TextStyle(
									// 									color: Colors.white
									// 								),
									// 							),
									// 						),
															
									// 					],
									// 				),
									// 			);
									// 		}
									// 	);
									// },
									onPressed: () async{
                    debugPrint(eventsdate.toString());
          // ignore: unused_local_variable
										final PostEventmodal event=await PostEvent().postEvent(
											widget.artistname,
											widget.artisttype,
											selectedevent.toString(),
											_selectedGathering.toString(),
											eventsdate,
											location.text,
											requirements.text,
											refercode.text,
											'${(price*eventprice*gatheringprice).toString()}'
          // ignore: missing_return
										).then((PostEventmodal result){
											debugPrint(result.toString());
										});
										setState(() {
										});
									},
									color: Color.fromRGBO(104, 178, 160, 1),
									child: Text(
										'Pay Now',
										style:  TextStyle(
											color: Colors.white,
											fontSize: MediaQuery.of(context).size.height*0.025,
										),
									)
								),
							)
						],
					),
				),
			),
		);
	}
}
// ignore: must_be_immutable
class ArtistImage extends StatelessWidget{
	final String tag;
	bool margin=true;
	ArtistImage(this.tag,{this.margin});
  	@override
  	Widget build(BuildContext context) { 
    	return Container(
			margin: margin==true?EdgeInsetsDirectional.only(top:MediaQuery.of(context).size.height*0.12,start:MediaQuery.of(context).size.height*0.01):EdgeInsets.all(MediaQuery.of(context).size.height*0),
			decoration: BoxDecoration(
				border:Border.all(width:2),
				borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
				// image: DecorationImage(image: AssetImage('artist_image/$tag.jpg'))
			),
			
			width:MediaQuery.of(context).size.width*0.4,
			height: MediaQuery.of(context).size.width*0.4,
			// child: FittedBox(
			// 	child: Image.asset('artist_image/$tag.jpg'),
			// 	fit: BoxFit.fill,
    	  	// ),
    	);
  	}
}