import 'package:artist4u/modals/get_booking_modal.dart';
import 'package:artist4u/services/get_bookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Upcoming extends StatefulWidget{
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
	List<Map<String, Object>> upcoming=[
		{'name':'Ayush','occupation':'Musician','image':'ayush.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00'},
	];

	Future<GetBookingModal> _booking;

	@override
	void initState(){
		_booking = GetBooking().getBookingUpcoming();
		super.initState();
	}

	Widget build(BuildContext context) {
		return FutureBuilder<GetBookingModal>(
			future: _booking,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
				if(snapshot.hasData){
					var data=snapshot.data.result;
					debugPrint(data.length.toString());
					return ListView.builder(
						itemCount: data.length,
						itemBuilder: (BuildContext context, int index) { 
							return InkWell(
								onTap: (){
									showDialog(
										barrierDismissible: true,
										context: context,  
										builder: (BuildContext context) {  
											return Center(
												child: Container(  
													color: Colors.white,
													width: MediaQuery.of(context).size.width*0.95,
													height:MediaQuery.of(context).size.width*1.1,
													child: Material(
														child: Column(
														children:<Widget>[
															Expanded(flex:1,child:Text('')),
															Expanded(flex:21,child: ArtistImage('artist_image/${upcoming[index]['image']}')),
															Expanded(flex:1,child:Text('')),
															Expanded(flex:3,child: ArtistName(data[index].artistname,MediaQuery.of(context).size.width*0.06)),
															Expanded(flex:3,child: ArtistOccupation(data[index].artisttype,MediaQuery.of(context).size.width*0.04)),
															Expanded(flex:3,child: StartTime(data[index].eventdetails[0].time.toString())),
															Expanded(flex:3,child:StartDate(data[index].eventdetails[0].date)),
															Expanded(flex:3,child: Amount(data[index].price)),
															Expanded(flex:3,child: VenueAddress(data[index].location)),
														]
													),
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
											Expanded(flex:1,child: ArtistImage('artist_image/${upcoming[index]['image']}')),
											Expanded(
												flex:2,
												child: Column(
													children: <Widget>[
														Align(alignment:Alignment.topRight,child: ArtistName(data[index].artistname,MediaQuery.of(context).size.width*0.045)),
														ArtistOccupation(data[index].artisttype,MediaQuery.of(context).size.width*0.04),
														Align(alignment:Alignment.topRight,child:StartTime(data[index].eventdetails[0].time)),
														Align(alignment:Alignment.topRight,child:StartDate(data[index].eventdetails[0].date)),
														Align(alignment:Alignment.topRight,child:Amount(data[index].location)),
														Align(alignment:Alignment.topRight,child:CancelButton())
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
		return Row(
			mainAxisAlignment: MainAxisAlignment.end,
			children: [
				Text(
					'Venue:'
				),
				Icon(Icons.home),
				Text(
					venuename,
					// style: TextStyle(
					// 	color: Color.fromRGBO(2, 0, 110, 1),
					// 	fontWeight: FontWeight.w500,
					// 	fontSize: 18,
					// 	fontFamily: 'Sriracha-Regular'
					// ),
				),
			],
		);
	}
}

// ignore: must_be_immutable
class VenueAddress extends StatelessWidget{
	String venueaddress;
	VenueAddress(this.venueaddress);
	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.end,
			children: [
				Expanded(
				  child: Text(
				  	'Address:'
				  ),
				),
				Expanded(
					child:Icon(Icons.place)
				),
				Expanded(
				  child: Wrap(
				    children: [
				      Text(
				      	venueaddress,
				      	// style: TextStyle(
				      	// 	color: Color.fromRGBO(2, 0, 110, 1),
				      	// 	fontWeight: FontWeight.w500,
				      	// 	fontSize: 18,
				      	// 	fontFamily: 'Sriracha-Regular'
				      	// ),
				      ),
				    ],
				  ),
				),
			],
		);
	}
}

// ignore: must_be_immutable
class Amount extends StatelessWidget{
	String amount;
	Amount(this.amount);
	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment:MainAxisAlignment.end,
			children: [
				Text(
					'Amount:'
				),
				Icon(Icons.attach_money),
				Text(
					'Rs $amount',
					// style: TextStyle(
					// 	color: Color.fromRGBO(2, 0, 110, 1),
					// 	fontWeight: FontWeight.w500,
					// 	fontSize: 18,
					// 	fontFamily: 'Sriracha-Regular'
					// ),
				),
			],
		);
	}
}

class CancelButton extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return FlatButton(
			color: Colors.red,
			child: Text(
				'Cancel Booking',
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
		return Row(
			mainAxisAlignment:MainAxisAlignment.end,
			children: [
				Text(
					'Date:'
				),
				Icon(Icons.event_note),
				Text(
					date,
					// style: TextStyle(
					// 	color: Color.fromRGBO(2, 0, 110, 1),
					// 	fontWeight: FontWeight.w500,
					// 	fontSize: 18,
					// 	fontFamily: 'Sriracha-Regular'
					// ),
				),
			],
		);
	}
}

// ignore: must_be_immutable
class StartTime extends StatelessWidget{
	String time;
	StartTime(this.time);
	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				Expanded(
					child: Text(''),
				),
				Expanded(
				  child: Row(
				  	children: [
				  		Text(
				  			'Time:'
				  		),
				  		Icon(Icons.timer),
				  	],
				  ),
				),
				
				Expanded(
				  child: Align(
					  alignment: Alignment.bottomRight,
				    child: Text(
				    	time,
				    	// style: TextStyle(
				    	// 	color: Color.fromRGBO(2, 0, 110, 1),
				    	// 	fontWeight: FontWeight.w500,
				    	// 	fontSize: 18,
				    	// 	fontFamily: 'Sriracha-Regular'
				    	// ),
				    ),
				  ),
				),
			],
		);
	}
}