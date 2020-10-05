import 'package:artist4u/modals/offers_modal.dart';
import 'package:artist4u/services/get_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../const.dart';

class OfferCorousel extends StatefulWidget{
	final List<String> imagelist=[
		'coupons/1.jpg',
		'coupons/2.jpg',
		'coupons/3.jpg',
		'coupons/4.jpg',    
	];
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
		// return Swiper(
		// 	itemCount: widget.imagelist.length,
		// 	itemBuilder: (BuildContext context,int index){
		// 		return Image.asset(widget.imagelist[index]);
		// 	},
		// 	viewportFraction: 0.7,
  		// 	scale: 0.25,
		// 	autoplayDelay:100,
      
		// 	//autoplayDisableOnInteraction:false,
		// 	pagination: new SwiperPagination(
		// 		builder: new DotSwiperPaginationBuilder(
		// 			size: 5,
		// 			activeSize: 7,
		// 			color: Colors.grey, activeColor: Colors.black)
		// 	),
		// 	control: null
		// );

		return FutureBuilder<OfferModal>(
			future: _offers,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

				if(snapshot.hasData){
					return Swiper(
							itemCount: snapshot.data.result.length,
							itemBuilder: (BuildContext context,int index){
								var data = snapshot.data.result[index];
								var image = 'http://$ip:3000/${data.image.toString().replaceAll('\\','/')}';
								return Image.network('$image');
							},
							viewportFraction: 0.7,
							scale: 0.25,
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