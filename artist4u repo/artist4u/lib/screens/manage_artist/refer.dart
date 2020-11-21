import 'package:artist4u/modals/generate_refer.dart';
// ignore: unused_import
import 'package:artist4u/modals/get_booking_modal.dart';
// ignore: unused_import
import 'package:artist4u/services/get_bookings.dart';
import 'package:artist4u/services/post_generate_refer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Refer extends StatefulWidget{
  @override
  _Refer createState() => _Refer();
}

class _Refer extends State<Refer> {

	GetReferModal _refer;

	@override
	void initState(){
		super.initState();
	}

	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Center(
					child:FlatButton(
						onPressed: () async{
							await PostGenerateRefer().postGenerateRefer().then((value){
								Future.delayed(const Duration(milliseconds: 1000*60*10), () {
									setState(() {
										_refer=null;
									});

									});
								setState(() {
									_refer=value;
								});
							});
						},
						child: Text('Generate OTP'),
					)
				),
				Text(_refer!=null?'Your Referal Code is\n ${_refer.refercode}':'Your Referal Code is\n')
			],
		);
	}
}