import 'package:artist4u/modals/offers_modal.dart';
import 'package:artist4u/services/get_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../const.dart';

class OfferCorousel extends StatefulWidget{
	@override
  	State<StatefulWidget> createState() {
   		return _OfferCorousel();
 	}

}

class _OfferCorousel extends State<OfferCorousel>{
	int num=1;
	Future<OfferModal> _offers;
	@override
	void initState(){
		_offers = GetOffer().getOffer();
		super.initState();
	}
  	@override
  	Widget build(BuildContext context) {
		return FutureBuilder<OfferModal>(
			future: _offers,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
				if(snapshot.hasData){
					return Swiper(
							itemCount: snapshot.data.result.length,
							itemBuilder: (BuildContext context,int index){
								var data = snapshot.data.result[index];
								var image = 'http://$ip:3000/${data.image.toString().replaceAll('\\','/')}';
								return Container(
									decoration: BoxDecoration(
										image: DecorationImage(
											image: NetworkImage("$image"),
											fit: BoxFit.cover,
										),
									),
								);
							},
							viewportFraction: 1,
							scale: 0,
							autoplayDelay:100,
							//autoplayDisableOnInteraction:false,
							pagination: new SwiperPagination(
								builder: new DotSwiperPaginationBuilder(
									size: 5,
									activeSize: 7,
									color: Colors.grey, activeColor: Colors.black)
							),
							control: null
					);
				}else{
					return Center(child: CircularProgressIndicator());
				}
			},
		);
  	}

}