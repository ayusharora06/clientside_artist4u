import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cancelled extends StatelessWidget{
	List<Map<String, Object>> cancel=[
		{'name':'ayush','image':'ayush.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','reasondescription':'didnt like the performance','reason':'not good'},
		{'name':'shubham','image':'shubham.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','reasondescription':null,'reason':'not good'},
		{'name':'garvit','image':'garvit.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','reasondescription':'didnt like the performance','reason':'not good'}
	];
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: cancel.length,
			itemBuilder: (BuildContext context, int index) { 
				return InkWell(
					onTap: (){
						showDialog(
							barrierDismissible: true,
							context: context,  
							builder: (BuildContext context) {  
								return AlertDialog(
									title: Reason(cancel[index]['reason']),
									content:cancel[index]['reasondescription']!=null?Reason(cancel[index]['reasondescription']):Text(''),
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
				    	  		Expanded(flex:1,child: ArtistImage('artist_image/${cancel[index]['image']}')),
				    	  		Expanded(
				    	  			flex:2,
				    	  			child: Column(
				    	  				children: <Widget>[
				    	  					Align(alignment:Alignment.topRight,child: ArtistName(cancel[index]['name'])),
				    	  					Align(alignment:Alignment.topRight,child:VenueName(cancel[index]['venuename'])),
				  							Align(alignment:Alignment.topRight,child:StartTime(cancel[index]['starttime'])),
				  							Align(alignment:Alignment.topRight,child:StartDate(cancel[index]['startdate'])),
				    	  					Align(alignment:Alignment.topRight,child:Amount(cancel[index]['amount'])),
				    	  					Align(alignment:Alignment.topRight,child:Reason(cancel[index]['reason']))
				    	  				],
				    	  			),
				    	  		)
				    	  	],
				    	  )
				    ),
				);
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
	ArtistName(this.name);
	@override
	Widget build(BuildContext context) {
		return Text(
			name,
			style: TextStyle(
				color: Color.fromRGBO(2, 0, 110, 1),
				fontWeight: FontWeight.w500,
				fontSize: 18,
				fontFamily: 'Sriracha-Regular'
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

// ignore: must_be_immutable
class Reason extends StatelessWidget{
	String reason;
	Reason(this.reason);
	@override
	Widget build(BuildContext context){
		return Text(
			reason,
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
class ReasonDescription extends StatelessWidget{
	String reasondescription;
	ReasonDescription(this.reasondescription);
	@override
	Widget build(BuildContext context) {
		return Text(
			reasondescription,
			// style: TextStyle(
			// 	color: Color.fromRGBO(2, 0, 110, 1),
			// 	fontWeight: FontWeight.w500,
			// 	fontSize: 18,
			// 	fontFamily: 'Sriracha-Regular'
			// ),
		);
	}
}