import 'package:flutter/material.dart';
class HomeFeatures extends StatelessWidget{
	// List<IconData> features =[
	// 	Icons.local_offer,
	// 	Icons.account_box,
	// 	Icons.account_balance_wallet,
	// 	Icons.money_off,
	// ];
	final List<String> features=[
		'offer','booking','reward'
	];
	@override
	Widget build(BuildContext context) {
		return FeatureList(features);
	}
}

class FeatureList extends StatelessWidget{
	//List<IconData> featurelist;
	final List<String> featurelist;
	FeatureList(this.featurelist);
  	@override
  	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(vertical:5),
		  	child: Row(
				children:<Widget>[
					Expanded(
						flex:100,
						child: Column(
							children:<Widget>[
								Expanded(
									flex:8,
									child:Container(
										height: 0,
										margin: EdgeInsets.only(left:10,right:10),
										decoration: BoxDecoration(
											//color: Colors.orange,
											// border: Border.all(
											// 	width: 1.5,
											// 	color: Colors.blueGrey),
											shape: BoxShape.circle,
											image: DecorationImage(image:AssetImage('icons/${featurelist[0]}.png'))
										),
										width: MediaQuery.of(context).size.width*0.19,
										//child: IconButton(icon: Icon(featurelist[item]), onPressed: () {  },),
									
									),
								),
								Expanded(
									flex:2,
									child: Text(featurelist[0]),
								)
							]
						),
					),
					Expanded(
						flex:1,
						child:SizedBox(
							//width: 1.0,
							height:MediaQuery.of(context).size.width*0.12,
							child: const DecoratedBox(
								decoration: const BoxDecoration(
								color: Colors.grey
								),
							),
						)
					),
					Expanded(
						flex:100,
						child: Column(
							children:<Widget>[
								Expanded(
									flex:8,
									child:Container(
										height: 0,
										margin: EdgeInsets.only(left:10,right:10),
										decoration: BoxDecoration(
											//color: Colors.orange,
											// border: Border.all(
											// 	width: 1.5,
											// 	color: Colors.blueGrey),
											shape: BoxShape.circle,
											image: DecorationImage(image:AssetImage('icons/${featurelist[1]}.png'))
										),
										width: MediaQuery.of(context).size.width*0.19,
										//child: IconButton(icon: Icon(featurelist[item]), onPressed: () {  },),
									
									),
								),
								Expanded(
									flex:2,
									child: Text(featurelist[1]),
								)
							]
						),
					),
					Expanded(
						flex:1,
						child:SizedBox(
							//width: 1.0,
							height: MediaQuery.of(context).size.width*0.12,
							child: const DecoratedBox(
								decoration: const BoxDecoration(
								color: Colors.grey
								),
							),
						)
					),
					Expanded(
						flex:100,
						child: Column(
							children:<Widget>[
								Expanded(
									flex:8,
									child:Container(
										height: 0,
										margin: EdgeInsets.only(left:10,right:10),
										decoration: BoxDecoration(
											//color: Colors.orange,
											// border: Border.all(
											// 	width: 1.5,
											// 	color: Colors.blueGrey),
											shape: BoxShape.circle,
											image: DecorationImage(image:AssetImage('icons/${featurelist[2]}.png'))
										),
										width: MediaQuery.of(context).size.width*0.19,
										//child: IconButton(icon: Icon(featurelist[item]), onPressed: () {  },),
									
									),
								),
								Expanded(
									flex:2,
									child: Text(featurelist[2]),
								)
							]
						),
					)
				]
			),
		);
  	}

}