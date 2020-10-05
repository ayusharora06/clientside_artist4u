import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Completed extends StatelessWidget{
	List<Map<String, Object>> completed=[
		{'name':'ayush','image':'ayush.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','review':'Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome '},
		{'name':'shubham','image':'shubham.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','review':null},
		{'name':'garvit','image':'garvit.jpg','venuename':'Crown Plaza', 'venueaddress':'Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085', 'amount':'15000','startdate':'15/10/2020','starttime':'10:00','review':'Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome Awesome '}
	];
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: completed.length,
			itemBuilder: (BuildContext context, int index) { 
				return InkWell(
					onTap: (){
						showDialog(
							barrierDismissible: true,
							context: context,  
							builder: (BuildContext context) {  
								return AlertDialog(
									content: completed[index]['review']!=null?Review(completed[index]['review'],partial: false,):Text('No Review Given')
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
				    	  		Expanded(flex:1,child: ArtistImage('artist_image/${completed[index]['image']}')),
				    	  		Expanded(
				    	  			flex:2,
				    	  			child: Column(
				    	  				children: <Widget>[
				    	  					Align(alignment:Alignment.topRight,child: ArtistName(completed[index]['name'])),
				    	  					Align(alignment:Alignment.topRight,child:VenueName(completed[index]['venuename'])),
				  							Align(alignment:Alignment.topRight,child:StartTime(completed[index]['starttime'])),
				  							Align(alignment:Alignment.topRight,child:StartDate(completed[index]['startdate'])),
				    	  					Align(alignment:Alignment.topRight,child:Amount(completed[index]['amount'])),
				    	  					Align(alignment:Alignment.topRight,child:completed[index]['review']==null?ReviewButton():Review(completed[index]['review'],partial:true))
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
		):Text(review.substring(0,25));
	}
}