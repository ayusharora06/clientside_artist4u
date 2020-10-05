import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LegalContent extends StatefulWidget{
	int balance=750;
	List<Map<String, Object>> passbook=[
		{'name':'ayush','image':'ayush.jpg','date':'01/01/2020','price':'15000','refund':'150'},
		{'name':'ayush','image':'ayush.jpg','date':'01/01/2020','price':'15000','refund':'150'},
		{'name':'ayush','image':'ayush.jpg','date':'01/01/2020','price':'15000','refund':'150'},
	];
	@override
	_LegalContent createState() => _LegalContent();
}

class _LegalContent extends State<LegalContent> {
	@override
	Widget build(BuildContext context) {
		return Text('Legal');
	}
}