import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

// ignore: must_be_immutable
class TrackYourProgressContent extends StatefulWidget{
	List yourprogrerss=[
		{'name':'Ayush Arora','venue':'Crown Plaze','date':'12/08/2020','stars':5},
		{'name':'Ayush Arora','venue':'Crown Plaze','date':'12/08/2020','stars':1},
		{'name':'Ayush Arora','venue':'Crown Plaze','date':'12/08/2020','stars':2},
		{'name':'Garvit Gaba','venue':'Crown Plaze','date':'12/08/2020','stars':3},
		{'name':'Shubham','venue':'Crown Plaze','date':'12/08/2020','stars':0},
		{'name':'Anam','venue':'Crown Plaze','date':'12/08/2020','stars':4},
		{'name':'Anam','venue':'Crown Plaze','date':'12/08/2020','stars':4},
		{'name':'Anam','venue':'Crown Plaze','date':'12/08/2020','stars':4},
		{'name':'Anam','venue':'Crown Plaze','date':'12/08/2020','stars':4}
	];
	@override
	_TrackYourProgressContentState createState() => _TrackYourProgressContentState();
}

class _TrackYourProgressContentState extends State<TrackYourProgressContent> {
	@override
	Widget build(BuildContext context) {
		return Container(
			margin: EdgeInsets.only(top:10),
			child: Stack(
				children: <Widget>[
					Yourprogress(widget.yourprogrerss),
					Align(
						alignment: Alignment.topRight,
						child: Container(
							width: MediaQuery.of(context).size.width*0.27,
							child: FlatButton(
								// color: Color.fromRGBO(161, 161, 161,1),
								onPressed: (){}, 
								child: Row(
									children: [
										Icon(
											Icons.info_outline,
											color: Color.fromRGBO(48, 130, 146, 1),
										),
										Text(
											' Help',
											// style: TextStyle(
											// 	color:Colors.white
											// ),
										),
									],
								)
							),
						)
					),
				],
			),
		);
	}
}

// ignore: must_be_immutable
class Yourprogress extends StatelessWidget{
	List yourprogrerss;
	Yourprogress(this.yourprogrerss);
	@override
	Widget build(BuildContext context) {
		return Timeline.builder(
			position: TimelinePosition.Center,
			itemCount: yourprogrerss.length,
			itemBuilder: (BuildContext context, int index) { 
				return TimelineModel(
					Container(
						margin: EdgeInsets.symmetric(horizontal:5),
						height: MediaQuery.of(context).size.height*0.125,
						width: MediaQuery.of(context).size.width*0.5,
						// child:Text(yourprogrerss[index]),
						child:Column(
							children: <Widget>[
								Expanded(
								  child: Text(
								  	yourprogrerss[index]['name'],
								  	style: TextStyle(
								  		fontWeight:FontWeight.bold,
								  		fontSize: MediaQuery.of(context).size.width*0.0425,
										color:Color.fromRGBO(48, 130, 146, 1),
								  	),
								  ),
								),
								Expanded(
									child: Text(
										yourprogrerss[index]['venue']
									)
								),
								Expanded(
									child: Text(
										yourprogrerss[index]['date']
									)
								),
								Expanded(
									child: Row(
										children: <Widget>[
											for (var i=0;i<yourprogrerss[index]['stars'];i++) 
												Icon(Icons.star,color: Colors.orange,)
										]
									)
								)
							],
						),
						decoration: BoxDecoration(
							border: Border.all(width: 1,color: Colors.black),
							color: Color.fromRGBO(240, 238, 238, 1),
							boxShadow: [
								BoxShadow(
									color:Colors.black,
									blurRadius: MediaQuery.of(context).size.width*0.003,
									spreadRadius: 0,
									offset: Offset( -MediaQuery.of(context).size.width*0.003, MediaQuery.of(context).size.width*0.003)
								)
							],
						),
					),
					iconBackground: index==4 || index==6 || index==11 || index==16?Color.fromRGBO(48, 130, 146, 1):Color.fromRGBO(104, 178, 160, 1),
					icon: index==4 || index==6 || index==11 || index==16? Icon(Icons.check,size: 20,color: Colors.white):
					Icon(Icons.blur_circular,size: 10,color: Colors.white,),
					
					position: index%2!=0?TimelineItemPosition.right:TimelineItemPosition.left
				);
			},
		);
	}

}