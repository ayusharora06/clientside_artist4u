import 'dart:convert';

import 'package:artist4u/modals/get_booking_modal.dart';
import 'package:artist4u/services/get_bookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Completed extends StatefulWidget{
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
	List<Map<String, Object>> completed=[
		{'name':'ayush','image':'ayush.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','review':'Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome '},
		{'name':'shubham','image':'shubham.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','review':null},
		{'name':'garvit','image':'garvit.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','review':'Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome '}
	];

	Future<GetBookingModal> _booking;

	@override
	void initState(){
		_booking = GetBooking().getBookingCompleted();
		super.initState();
	}

	Widget build(BuildContext context) {
		return FutureBuilder<GetBookingModal>(
			future: _booking,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
				if(snapshot.hasData){
					var data=snapshot.data.result;
					// debugPrint((json.decode(data[0].eventdetails)[0]).toString());
					// debugPrint(data.length.toString());
					// return Text("a");
          			return ListView.builder(
						itemCount: data.length,
						itemBuilder: (BuildContext context, int index) { 
							// return Text(index.toString());
							return InkWell(
								onTap: (){
									showDialog(
										barrierDismissible: true,
										context: context,  
										builder: (BuildContext context) {
											// debugPrint(data[index].cancelreason);  
											return Center(
												child: Container(  
													color: Colors.white,
													width: MediaQuery.of(context).size.width*0.95,
													height:MediaQuery.of(context).size.width*1.1,
													child: Material(
														child: Text(data[index].review)
													), 
												)
											);
										}
									);
								},
								child: Card(
									shape: RoundedRectangleBorder(
										side: BorderSide(color: Colors.blueGrey, width: 2.0),
									),
									child:Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											// Expanded(flex:1,child: ArtistImage('artist_image/${upcoming[index]['image']}')),
											Expanded(
												flex:2,
												child: Column(
													children: <Widget>[
														Align(alignment:Alignment.topRight,child: ArtistName(data[index].artistname,MediaQuery.of(context).size.width*0.045)),
														ArtistOccupation(data[index].artisttype,MediaQuery.of(context).size.width*0.04),
														Align(alignment:Alignment.topRight,child:StartTime(json.decode(data[0].eventdetails)[0]['starttime'].toString())),
														Align(alignment:Alignment.topRight,child:StartDate(json.decode(data[0].eventdetails)[0]['date'].toString())),
														Align(alignment:Alignment.topRight,child:Amount(data[index].price)),
														Align(alignment:Alignment.topRight,child:Review(data[index].review)),
														Align(alignment:Alignment.topRight,child:ReviewButton())
													],
												),
											)
										],
									)
								),
							);
						}
					);
				}else{
					return Center(child: CircularProgressIndicator());
				}
			}
		);
	}
}
// ignore: must_be_immutable
class ArtistImage extends StatelessWidget{
	String image;
	ArtistImage(this.image);
	@override
	Widget build(BuildContext context) {
		return ClipRRect(
			borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
				child: Image.asset(image)
		);
	}

}
// ignore: must_be_immutable
class ArtistName extends StatelessWidget{
	String name;
	var size;
	ArtistName(this.name,this.size);
	@override
	Widget build(BuildContext context) {
		return Text(
			name,
			style: TextStyle(
				color: Colors.black,
				fontWeight: FontWeight.w500,
				fontSize: size,
				fontFamily: 'SpecialElite-Regular'
			),
		);
	}
}
// ignore: must_be_immutable
class ArtistOccupation extends StatelessWidget{
	String name;
	var size;
	ArtistOccupation(this.name,this.size);
	@override
	Widget build(BuildContext context) {
		return Text(
			"($name)",
			style: TextStyle(
				color: Colors.black,
				fontSize: size,
				fontStyle: FontStyle.italic
			),
		);
	}
}

// ignore: must_be_immutable
class VenueName extends StatelessWidget{
	String venuename;
	VenueName(this.venuename);
	@override
	Widget build(BuildContext context) {
		return Text(
			venuename,
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		);
	}
}

// ignore: must_be_immutable
class VenueAddress extends StatelessWidget{
	String venueaddress;
	VenueAddress(this.venueaddress);
	@override
	Widget build(BuildContext context) {
		return Text(
			venueaddress,
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		);
	}
}

// ignore: must_be_immutable
class Amount extends StatelessWidget{
	String amount;
	Amount(this.amount);
	@override
	Widget build(BuildContext context) {
		return Text(
			'Rs $amount',
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		);
	}
}

class ReviewButton extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return FlatButton(
			color: Colors.blueGrey,
			child: Text(
				'Write a Review',
				style: TextStyle(
					color: Colors.white
				),
			),
			onPressed: (){
				debugPrint('button tapped');
			},
		);
	}
}

// ignore: must_be_immutable
class StartDate extends StatelessWidget{
	String date;
	StartDate(this.date);
	@override
	Widget build(BuildContext context) {
		return Text(
			date,
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		);
	}
}

// ignore: must_be_immutable
class StartTime extends StatelessWidget{
	String time;
	StartTime(this.time);
	@override
	Widget build(BuildContext context) {
		return Text(
			time,
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		);
	}
}

// ignore: must_be_immutable
class Review extends StatelessWidget{
	String review;
	bool partial;
	Review(this.review,{this.partial});
	@override
	Widget build(BuildContext context) {
		return partial==false?Text(
			review,
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		):Text(review.substring(0,15));
	}
}