import 'package:artist4u/const.dart';
import 'package:artist4u/modals/artist_type_model.dart';
import 'package:artist4u/services/get_artist_type.dart';
import 'package:flutter/material.dart';

class ArtistType extends StatefulWidget{
  @override
  _ArtistTypeState createState() => _ArtistTypeState();
}

class _ArtistTypeState extends State<ArtistType> {
	Future<ArtistTypeModel> _artistType;
	@override
	void initState(){
		_artistType = GetArtistType().getArtistType();
		super.initState();
	}

  	@override
  	Widget build(BuildContext context) {
		return 
		FutureBuilder<ArtistTypeModel>(
			future: _artistType,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

				if(snapshot.hasData){
					return ListView.builder(
						itemCount: snapshot.data.result.length,
						itemBuilder: (context,index){
							var data = snapshot.data.result[index];
							var image = 'http://$ip:3000/${data.image.toString().replaceAll('\\','/')}';
							// debugPrint('$index, $image');
							return Container(
								margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.03,vertical: MediaQuery.of(context).size.height*0.006),
								child: InkWell(
									onTap: (){
										Navigator.pushNamed(context, '/artistlist',arguments: {'title':data.artistType});
									},
									child: Container(
										height: MediaQuery.of(context).size.height*0.11,
										decoration: BoxDecoration(
											gradient: LinearGradient(
												colors: [
													// Color.fromRGBO(28, 181, 224, 1),
													// Color.fromRGBO(86, 204, 242,1),
													Color.fromRGBO(104, 178, 160, 1),
													Color.fromRGBO(104, 178, 160, 1),
													// Colors.blue,
													
												],
											),
											borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.03),
										),
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: [
												Expanded(
													flex: 14,
													// child: Image.asset(
													// 	'artists/mehendi.jpg',
													// 	//height: MediaQuery.of(context).size.width*0.35,
													// 	//width: MediaQuery.of(context).size.width*0.35,	
													// ),
													child: ClipPath(
														clipper: BackGroundClipper(),
														child: Container(
															decoration: BoxDecoration(
																	//color: Color.fromRGBO(130, 200, 255, 1),
																	gradient: LinearGradient(
																		colors: [
																			// Color.fromRGBO(0, 0, 70, 1),
																			// Color.fromRGBO(28, 181, 224, 1),
																			Colors.white.withOpacity(0.3),
																			Colors.white70.withOpacity(0.8)
																			
																			// Color.fromRGBO(104, 178, 160, 1),
																			// Color.fromRGBO(48, 130, 146, 1),
																		],
																	),
																	borderRadius: BorderRadius.only(
																		topLeft: Radius.circular(MediaQuery.of(context).size.width*0.02),
																		bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.02),
																	),
															),
															width: MediaQuery.of(context).size.width,
															height: MediaQuery.of(context).size.width*0.25,
															child:Container(
																//width: MediaQuery.of(context).size.width*0.2,
																height: MediaQuery.of(context).size.width*001,
																margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.02),
																alignment: Alignment.centerLeft,
																child: Image.network('$image'),
															)
														),
													),
												),
												Expanded(
													flex:8,
													child: Container(
														padding: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.05),
														child: Center(
															//alignment: AlignmentDirectional.topCenter,
															child: Text(
																
																'${data.artistType}',
																style: TextStyle(
																	//fontWeight: FontWeight.w600,
																	fontSize: MediaQuery.of(context).size.width*0.045,
																	fontFamily: 'SpecialElite-Regular',
																),
															),
														),
													),
													//margin: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.01),
												),
											],
										),
									),
								),
							);
						}
					);
				}else{
					return Center(child: CircularProgressIndicator());
				}
			},
		);
		
		




  	}
}

class BackGroundClipper extends CustomClipper<Path>{
	@override
	getClip(Size size) {
		var path=Path();
		path.lineTo(0, size.height);
		path.lineTo(size.width*0.7, size.height);
		path.lineTo(size.width, 0);
		//path.lineTo(size.width, 0);
		
		return path;
	}
  
	@override
	bool shouldReclip(CustomClipper oldClipper) {
		return true;
  	}

}