import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWalletContent extends StatefulWidget{
	int balance=750;
	List<Map<String, Object>> passbook=[
		{'name':'Ayush Arora','image':'ayush.jpg','date':'01/01/2020','price':'15000','refund':'150'},
		{'name':'Shubham Girish Khanduri','image':'ayush.jpg','date':'01/01/2020','price':'15000','refund':'150'},
		{'name':'Ayush','image':'ayush.jpg','date':'01/01/2020','price':'15000','refund':'150'},
	];
	@override
	_MyWalletContentState createState() => _MyWalletContentState();
}

class _MyWalletContentState extends State<MyWalletContent> {
	@override
	Widget build(BuildContext context) {
		var orientation = MediaQuery.of(context).orientation;
		return ListView(
			children:<Widget>[
				Container(
					margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.02,top:MediaQuery.of(context).size.width*0.02),
					height:orientation==Orientation.portrait?MediaQuery.of(context).size.height*0.25:MediaQuery.of(context).size.height*0.35,
					decoration: BoxDecoration(
						border: Border.all(width:2),
						borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
					),
					child:Column(
						children:<Widget>[
							Expanded(
								flex:3,
								child:Text(
									'₹ ${widget.balance.toString()}',
									style: TextStyle(
										fontSize:orientation==Orientation.portrait?MediaQuery.of(context).size.height*0.075:MediaQuery.of(context).size.width*0.075,
									),
								)
							),
							Expanded(
								flex: 2,
								child: Text(
									'Available Balance',
									style: TextStyle(
										fontSize: MediaQuery.of(context).size.height*0.025,
										fontWeight: FontWeight.bold
									),
								)
							),
							Expanded(
								flex:1,
								child: Text(
									'Book now and redeem',
									style: TextStyle(
										color: Colors.blueAccent,
										decoration: TextDecoration.underline,
									),
								)
							),
							Expanded(
								flex:1,
								child: Text(
									'Redeem Policy',
									style: TextStyle(
										color: Colors.blueAccent,
										decoration: TextDecoration.underline,
									),
								)
							),


						]
					)
				),
				for (var i in widget.passbook)
					Container(
						height:MediaQuery.of(context).size.width*0.3,
						child: Card(
							elevation: 4,
							// shape: RoundedRectangleBorder(
							// 	side: BorderSide(color: Colors.blueGrey, width: 2.0),
							// ),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children:<Widget>[
									ClipRRect(
										borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
										child: Image.asset('artist_image/${i['image']}',height: MediaQuery.of(context).size.width*0.25,),
									),
									Column(
										crossAxisAlignment: CrossAxisAlignment.end,
										children: [
											Expanded(
												child: Container(
													width: MediaQuery.of(context).size.width*0.4,
													child: Text(
														i['name'],
														overflow: TextOverflow.fade,
														maxLines: 1,
														softWrap: false,
														style: TextStyle(
															color: Colors.black,
															fontWeight: FontWeight.w500,
															fontSize: 18,
															//fontFamily: 'Sriracha-Regular'
														),
													),
												),
											),
											Expanded(
												child: Container(
													// color:Colors.red,
													width:MediaQuery.of(context).size.width*0.4 ,
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															Text(
																'Date:',
																style: TextStyle(
																	fontWeight: FontWeight.bold
																),
															),
															Text(
																'${i['date']}',
															),
														],
													),
												)
											),
											Expanded(
												child: Container(
													// color:Colors.red,
													width:MediaQuery.of(context).size.width*0.4 ,
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															Text(
																'Total Price:',
																style: TextStyle(
																	fontWeight: FontWeight.bold
																),
															),
															Text(
																'${i['price']}/-',
															),
														],
													),
												)
											),
											Expanded(
												child: Container(
													// color:Colors.red,
													width:MediaQuery.of(context).size.width*0.4 ,
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: [
															Text(
																'Cashback:',
																style: TextStyle(
																	fontWeight: FontWeight.bold
																),
															),
															Text(
																'${i['refund']}/-',
															),
														],
													),
												)
											),

										],
									),
								]
							),
						),
					)
			]
		);
	}
}