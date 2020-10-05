import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ContactUsContent extends StatefulWidget{
	@override
	_ContactUsContentState createState() => _ContactUsContentState();
}

class _ContactUsContentState extends State<ContactUsContent> {
	List<String> cardfaqpayment=['Query1','Query2'];
	List<String> upifaqpayment=['Query1','Query2'];
	List<String> cashfaqpayment=['Query1','Query2'];
	List<String> upcomingfaqbooking=['Query1','Query2'];
	List<String> completedfaqbooking=['Query1','Query2'];
	List<String> cardfaqrefund=['Query1','Query2'];
	List<String> upifaqrefund=['Query1','Query2'];
	List<String> cashfaqrefund=['Query1','Query2'];
	List<String> scratchcardfaq=['Query1','Query2'];
	List<String> artistrelatedfaq=['Query1','Query2'];

	
	
	@override
	Widget build(BuildContext context) {
		return ListView(
			children: [
				ExpansionTile(
					title: Text(
						"Payment",
						style: TextStyle(
							//fontSize: 18.0,
							fontWeight: FontWeight.bold
						),
					),
					children: <Widget>[
						//Card
						ExpansionTile(
							title: Text(
								'Card',
							),
							children: <Widget>[
								for  (var i in cardfaqpayment)
									ListTile(
										title: Text(i),
									)
							],
						),

						//UPI
						ExpansionTile(
							title: Text(
								'Card',
							),
							children: <Widget>[
								for  (var i in upifaqpayment)
									ListTile(
										title: Text(i),
									)
							],
						),
						//cash
						ExpansionTile(
							title: Text(
								'Card',
							),
							children: <Widget>[
								for  (var i in cashfaqpayment)
									ListTile(
										title: Text(i),
									)
							],
						),
						
					],
				),
				ExpansionTile(
					title: Text(
						"Booking",
						style: TextStyle(
							//fontSize: 18.0,
							fontWeight: FontWeight.bold
						),
					),
					children: <Widget>[
						//upcoming
						ExpansionTile(
							title: Text(
								'Upcoming',
							),
							children: <Widget>[
								for  (var i in upcomingfaqbooking)
									ListTile(
										title: Text(i),
									)
							],
						),

						//completed
						ExpansionTile(
							title: Text(
								'Completed',
							),
							children: <Widget>[
								for  (var i in completedfaqbooking)
									ListTile(
										title: Text(i),
									)
							],
						),
						
					],
				),
				ExpansionTile(
					title: Text(
						"Refund",
						style: TextStyle(
							//fontSize: 18.0,
							fontWeight: FontWeight.bold
						),
					),
					children: <Widget>[
						//Card
						ExpansionTile(
							title: Text(
								'Card',
							),
							children: <Widget>[
								for  (var i in cardfaqrefund)
									ListTile(
										title: Text(i),
									)
							],
						),

						//UPI
						ExpansionTile(
							title: Text(
								'Card',
							),
							children: <Widget>[
								for  (var i in upifaqrefund)
									ListTile(
										title: Text(i),
									)
							],
						),
						//cash
						ExpansionTile(
							title: Text(
								'Card',
							),
							children: <Widget>[
								for  (var i in cashfaqrefund)
									ListTile(
										title: Text(i),
									)
							],
						),
						
					],
				),
				ExpansionTile(
					title: Text(
						"Scratch Card",
						style: TextStyle(
							//fontSize: 18.0,
							fontWeight: FontWeight.bold
						),
					),
					children: <Widget>[
						for  (var i in scratchcardfaq)
									ListTile(
										title: Text(i),
									)
					],
				),
				ExpansionTile(
					title: Text(
						"Arist Related",
						style: TextStyle(
							//fontSize: 18.0,
							fontWeight: FontWeight.bold
						),
					),
					children: <Widget>[
						for  (var i in artistrelatedfaq)
									ListTile(
										title: Text(i),
									)
						
					],
				),
			],
		);
	}
}
