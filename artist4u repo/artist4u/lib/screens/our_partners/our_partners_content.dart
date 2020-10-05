import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurPartnersContent extends StatefulWidget{
	@override
	_OurPartnersContent createState() => _OurPartnersContent();
}

class _OurPartnersContent extends State<OurPartnersContent> {
	var data = [
		{'name':'Ayush','location':' Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085','website':false},
		{'name':'shubham','location':' Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085','website':'www.abasdadasdc.com'},
		{'name':'Gaba','location':' Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085','website':'www.abc.com'},
		{'name':'shubham','location':' Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085','website':'www.abc.com'},
		{'name':'Gaba','location':' Twin, District Centre, Sector 10, Rohini, New Delhi, Delhi 110085','website':'www.abc.com'}
	];
    @override
    Widget build(BuildContext context) {
		var orientation = MediaQuery.of(context).orientation;
     	return GridView.builder(
			 itemCount: data.length,
         	gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (orientation == Orientation.portrait? 2:3)), 
			itemBuilder: (BuildContext context,int index){
				return InkWell(
					onTap: (){
						showDialog(
							barrierDismissible: true,
							context: context,
							builder: (BuildContext context){
								return Center(
									child: Card(  
										//title: Text("Selection Error"),
										// width: MediaQuery.of(context).size.width*0.95,
										// height:MediaQuery.of(context).size.width*0.95,
										child: Container(
										width: MediaQuery.of(context).size.width*0.95,
										height:MediaQuery.of(context).size.width*0.95,
											child: Column(
												children: [
													Expanded(
														flex:7,
													child: Container(
														//margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
														height:MediaQuery.of(context).size.height*0.14,
														decoration: BoxDecoration(
															//border:Border.all(width:1),
															// borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
															image: DecorationImage(
																image: AssetImage(
																	'artist_image/ayush.jpg',
																),
																fit: BoxFit.fill
															)
														),
													),
													),
													Expanded(
														flex:1,
														child: Text(
															'${data[index]["name"]}',
															style: TextStyle(
																fontWeight: FontWeight.bold
															),
														),
													),
													Expanded(flex:1,child:Text('${data[index]["location"]}')),
													Expanded(flex:1,
														child:data[index]['website']!=false?
														Text('${data[index]["website"]}'):
														Text('')
													),
												],
											),
										)
									)
								);
							}
						
						);
					},
					child: Container(
						margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
						decoration: BoxDecoration(
							border:Border.all(width:1),
							// borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
							// image: DecorationImage(image: AssetImage('artist_image/$tag.jpg'))
						),
						child:Column(
							children: [
								Expanded(
									flex:7,
								child: Container(
									//margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
									height:MediaQuery.of(context).size.height*0.14,
									decoration: BoxDecoration(
										//border:Border.all(width:1),
										// borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
										image: DecorationImage(
											image: AssetImage(
												'artist_image/ayush.jpg',
											),
											fit: BoxFit.fill
										)
									),
								),
								),
								Expanded(
									flex:1,
									child: Text(
										'${data[index]["name"]}',
										style: TextStyle(
											fontWeight: FontWeight.bold
										),
									),
								),
								Expanded(flex:1,child:Text('${data[index]["location"]}')),
								Expanded(flex:1,
									child:data[index]['website']!=false?
									Text('${data[index]["website"]}'):
									Text('')
								),
							],
						)
					),
				);
			}
		);
    }
}