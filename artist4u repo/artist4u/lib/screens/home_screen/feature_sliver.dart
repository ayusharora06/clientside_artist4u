import 'package:flutter/material.dart';
import 'features.dart';
class FeatureSliverList extends StatelessWidget{
	final List<IconData> features =[
		Icons.local_offer,
		Icons.account_box,
		Icons.account_balance_wallet,
		Icons.money_off,
	];
	@override
	Widget build(BuildContext context) {
		return SliverToBoxAdapter(
            child: Container(
              	child:HomeFeatures(),
				decoration: BoxDecoration(
					borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height*0.03)),
					//border:Border.all(color:Colors.black)
					// color: Colors.grey.withOpacity(0.15)
				),
				//color: Colors.cyanAccent,
				height: MediaQuery.of(context).size.height*0.12,
				margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.007),
			)
		);
	  }

}