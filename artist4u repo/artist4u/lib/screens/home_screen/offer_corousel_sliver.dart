import 'package:flutter/material.dart';
import 'offer_corousel.dart';
class OfferCorouselSliver extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
					child: Container(
						margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
						height: MediaQuery.of(context).size.height*0.25,
						child:OfferCorousel()
					),
				);
  }

}