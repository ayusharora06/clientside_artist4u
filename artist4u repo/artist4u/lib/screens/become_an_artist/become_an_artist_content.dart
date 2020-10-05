import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:artist4u/const.dart';
import 'package:artist4u/modals/artistbio_modal.dart';
import 'package:artist4u/services/post_artistbio.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;


class BecomeAnArtistContent extends StatefulWidget{
	@override
	_BecomeAnArtistContentState createState() => _BecomeAnArtistContentState();
	}

class _BecomeAnArtistContentState extends State<BecomeAnArtistContent> {
	@override
	Widget build(BuildContext context) {
		return ListView(
			children: [
				// ArtistGallery(),
				ArtistForm()
			],
		) ;
	}
}

// class ArtistGallery extends StatefulWidget{
// 	@override
// 	_ArtistGalleryState createState() => _ArtistGalleryState();
// }

// class _ArtistGalleryState extends State<ArtistGallery> {
// 	File _image;
// 	File _video;
// 	List gallerydata=new List(7);
// 	final picker = ImagePicker();
// 	List<dynamic> filecontroller=[null,null,null,null,null,null,null];
// 	List<dynamic> filetype=[null,null,null,null,null,null,null];
// 	Future getImage(int index) async {
// 		final pickedFile = await picker.getImage(source: ImageSource.gallery);

// 		setState(() {
// 			if(pickedFile !=null){ 
// 				_image = File(pickedFile.path);
// 				filecontroller[index]=_image;
// 				filetype[index]='image';
// 			}
// 		});
// 	}
// 	Future getVideo(int index) async {
// 		final pickedFile = await picker.getVideo(source: ImageSource.gallery);

// 		setState(() {
// 			if(pickedFile !=null){ 
// 				_video = File(pickedFile.path);
// 				filecontroller[index]=_video;
// 				filetype[index]='video';
// 			}
// 		});
// 	}
//   	@override
// 	Widget build(BuildContext context) {
// 		return Center(
// 			child: Container(
// 				width: MediaQuery.of(context).size.width*0.95,
// 				height:MediaQuery.of(context).size.width*0.49,
// 				decoration: BoxDecoration(
// 					//borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.025)),
// 					border: Border.all(width: 2,color: Colors.black),
// 					//color: filecontroller[0]!=null?Colors.black:Colors.white,
					
// 				),
// 				child:Stack(
// 					children: [
// 						Center(
// 							child: Row(
// 								mainAxisAlignment: MainAxisAlignment.spaceBetween,
// 								children: [
// 									Icon(Icons.keyboard_arrow_left),
// 									Icon(Icons.keyboard_arrow_right)
// 								],
// 							),
// 						),
// 						CarouselSlider.builder(
// 							itemCount: 7,
// 							options: CarouselOptions(viewportFraction: 1,),
// 							itemBuilder: (BuildContext context, int index){
// 								return Stack(
// 									alignment: Alignment.bottomCenter,
// 									children: [
// 										Center(
// 											child: Row(
// 												mainAxisAlignment: MainAxisAlignment.spaceAround,
// 												children: [
// 													filecontroller[index] == null?FlatButton(
// 														onPressed: (){
// 															getImage(index);
// 														}, 
// 														child: Text('Add Image')):Container(),
// 													Column(
// 														children: [
// 															SizedBox(
// 																height: MediaQuery.of(context).size.width*0.01,
// 															),
// 															SizedBox(
// 																width: 1.0,
// 																height: MediaQuery.of(context).size.width*0.2,
// 																child: const DecoratedBox(
// 																	decoration: const BoxDecoration(
// 																	color: Colors.grey
// 																	),
// 																),
// 															),
// 															SizedBox(
// 																height: MediaQuery.of(context).size.width*0.01,
// 															),
// 															Text('Or'),
// 															SizedBox(
// 																height: MediaQuery.of(context).size.width*0.01,
// 															),
// 															SizedBox(
// 																width: 1.0,
// 																height: MediaQuery.of(context).size.width*0.19,
// 																child: const DecoratedBox(
// 																	decoration: const BoxDecoration(
// 																	color: Colors.grey
// 																	),
// 																),
// 															),
// 														],
// 													),
// 													filecontroller[index] == null?FlatButton(
// 														onPressed: (){
// 															getVideo(index);
// 														}, 
// 														child: Text('Add Video')):Container(),
// 												],
// 											),
// 										),
// 										filecontroller[index] == null
// 											? Text('')
// 											: filetype[index]=='image'?Image.file(filecontroller[index]):
// 												ChewieListItem(file:filecontroller[index]),
										
// 									],
// 								);
// 							}
// 						),
// 					],
// 				)
// 			)
// 		);
// 	}
// }

// ignore: must_be_immutable
class ChewieListItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
   var file;

  ChewieListItem({
    @required this.file,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
	VideoPlayerController videoPlayerControllerForGallery;
	
	ChewieController _chewieController;
	@override
	void initState() {
		super.initState();
		// Wrapper on top of the videoPlayerController
		videoPlayerControllerForGallery=VideoPlayerController.file(
			widget.file
		);
		_chewieController = ChewieController(
			videoPlayerController: videoPlayerControllerForGallery,
			aspectRatio: 16 / 16,
			// Prepare the video to be played and display the first frame
			autoInitialize: true,
			looping: false,
			// Errors can occur for example when trying to play a video
			// from a non-existent URL
			errorBuilder: (context, errorMessage) {
				return Center(
					child: Text(
						'url not found',
						style: TextStyle(color: Colors.white),
					),
				);
			},
		);
	}
	@override
	Widget build(BuildContext context) {
		return Chewie(
			controller: _chewieController,
		);
	}
	@override
	void dispose() {
		// IMPORTANT to dispose of all the used resources
		videoPlayerControllerForGallery.dispose();
		_chewieController.dispose();
		super.dispose();		
	}
}

class ArtistForm extends StatefulWidget{
  @override
  _ArtistFormState createState() => _ArtistFormState();
}

class _ArtistFormState extends State<ArtistForm> {
	ArtistBioModal _artistBioModal;
	var name=TextEditingController();
	var artist_type=TextEditingController();
	String gender='';
	String dateofbirth;
	var phonenumber=TextEditingController();
	var email=TextEditingController();
	var street=TextEditingController();
	var city=TextEditingController();
	var state=TextEditingController();
	var country=TextEditingController();
	List typeofshow;
	List specialization;
	String minhours;
	String maxhours;
	var description=TextEditingController();
	String team;
	String outstationtravel;
	String unifiedprice;
	var price=TextEditingController();
	List<Map> dynamicprices=[];
	bool agreed=false;
	// bool agreed;

	File _image;
	File _video;
	List gallerydata=new List(7);
	final picker = ImagePicker();
	// List<dynamic> gallery=[null,null,null,null,null,null,null];
	List<dynamic> filecontroller=[null,null,null,null,null,null,null];
	List<dynamic> filetype=[null,null,null,null,null,null,null];
	Future getImage(int index) async {
		final pickedFile = await picker.getImage(source: ImageSource.gallery);

		setState(() {
			if(pickedFile !=null){ 
				_image = File(pickedFile.path);
				filecontroller[index]=_image;
				filetype[index]='image';
				// gallery[index]=_image;
			}
		});
	}
	Future getVideo(int index) async {
		final pickedFile = await picker.getVideo(source: ImageSource.gallery);
		
		// final pickedFile =await FilePicker.getFile(type: FileType.video);
		setState(() {
			if(pickedFile !=null){ 
				var path = pickedFile.path.split('.');
				path.last='mp4';
				String newpath=path.join('.');
				// debugPrint("\n\n\n${newpath}\n${pickedFile.path}\n\n");

				_video = File(pickedFile.path);
				filecontroller[index]=_video;
				filetype[index]='video';
				// gallery[index]=File(newpath);
			}
		});
	}


	final _formKey = GlobalKey<FormState>();
	// String gender = '';
	String teamtype='';
	//Map dateofbirth={'year':'----','month':'--','day':'--'};
	List selectedshow=[];
	List<TextEditingController> selectedshowcontroller=[];
	bool sameprice=true;
	File _profileimage;
	File _proofimage;
	bool upfortravel=false;
	// final picker = ImagePicker();
	List<Map<String,dynamic>> typesofshow=[
		{'name':'Religious','selected':false},
		{'name':'charity','selected':false},
		{'name':'devotional','selected':false},
		{'name':'campus','selected':false},
		{'name':'Coorporate','selected':false},
		{'name':'wedding','selected':false},
	];
	List selectedspecialization=[];
	List<Map<String,dynamic>> typesofspecialization=[
		{'name':'Bollywood','selected':false},
		{'name':'PokerFace','selected':false},
		{'name':'Hollywood','selected':false},
		{'name':'Mentalist','selected':false},
		{'name':'Classic','selected':false},
		{'name':'Mentalist','selected':false},
		{'name':'Classic','selected':false},
		{'name':'Mentalist','selected':false},
		{'name':'Classic','selected':false},
	];

	List minhour=[1,2,3,4,5,6,7,8];
	List maxhour=[1,2,3,4,5,6,7,8];
 // ignore: avoid_init_to_null
	var _minselected=null;
 // ignore: avoid_init_to_null
	var _maxselected=null;


	Future getProfileImage() async {
		final pickedFile = await picker.getImage(source: ImageSource.gallery);
		setState(() {
			if(pickedFile !=null){ 
				_profileimage = File(pickedFile.path);
			}
		});
	}
	Future getProofImage() async {
		final pickedFile = await picker.getImage(source: ImageSource.gallery);
		setState(() {
			if(pickedFile !=null){ 
				_proofimage = File(pickedFile.path);
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		return Form(
			key: _formKey,
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					SizedBox(
						height:MediaQuery.of(context).size.height*0.02 ,
					),
					Row(
						children: [
							Column(
								children: [
									_profileimage!=null?IconButton(icon: Icon(Icons.cancel), onPressed: () {
										setState(() {
											this._profileimage=null;
										});
									},
									):Text(''),
									InkWell(
										onTap: (){getProfileImage();},
										child: Container(
											margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
											decoration: BoxDecoration(
												border: Border.all(color: Colors.black,),
												borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
											),
											height: MediaQuery.of(context).size.height*0.2,
											width: MediaQuery.of(context).size.height*0.2,
											child:_profileimage==null?
												Center(child: Icon(Icons.add_circle)):
												Container(
													decoration: BoxDecoration(
														borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
														image: DecorationImage(image: FileImage(_profileimage),fit:BoxFit.cover)
													)
												)
										),
									),
								],
							),
							Expanded(
								flex: 1,
								child: Container(
									margin: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.04),
									child: TextFormField(
                    					controller:name,
										decoration: new InputDecoration(
											// border: InputBorder.none,
											// focusedBorder: InputBorder.none,
											// enabledBorder: InputBorder.none,
											// errorBorder: InputBorder.none,
											// disabledBorder: InputBorder.none,
											contentPadding:
												EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
											hintText: 'Enter Name'
										),
										validator: (value) {
											if (value.isEmpty) {
												return 'Please enter some text';
											}
											
											return null;
										},
									),
								),
							),

							Expanded(
								flex: 1,
								child: Container(
									margin: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.04),
									child: TextFormField(
										controller: artist_type,
										decoration: new InputDecoration(
											// border: InputBorder.none,
											// focusedBorder: InputBorder.none,
											// enabledBorder: InputBorder.none,
											// errorBorder: InputBorder.none,
											// disabledBorder: InputBorder.none,
											contentPadding:
												EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
											hintText: 'Enter artist type'
										),
										validator: (value) {
											if (value.isEmpty) {
												return 'Please enter some text';
											}
											
											return null;
										},
									),
								),
							),
						],
					),
					SizedBox(
						height:MediaQuery.of(context).size.height*0.02 ,
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Row(
							children: [
								Text(
									'Gallery',
									style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize:MediaQuery.of(context).size.height*0.021,
									),
								),
								Text(
									'  (max 7)',
									style: TextStyle(
										fontSize:MediaQuery.of(context).size.height*0.015
									),
								)
							],
						),
					),
					Center(
						child: Container(
							width: MediaQuery.of(context).size.width*0.95,
							height:MediaQuery.of(context).size.width*0.49,
							decoration: BoxDecoration(
								//borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.025)),
								border: Border.all(width: 2,color: Colors.black),
								//color: filecontroller[0]!=null?Colors.black:Colors.white,
								
							),
							child:Stack(
								children: [
									Center(
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: [
												Icon(Icons.keyboard_arrow_left),
												Icon(Icons.keyboard_arrow_right)
											],
										),
									),
									CarouselSlider.builder(
										itemCount: 7,
										options: CarouselOptions(viewportFraction: 1,),
										itemBuilder: (BuildContext context, int index){
											return Stack(
												alignment: Alignment.bottomCenter,
												children: [
													Center(
														child: Row(
															mainAxisAlignment: MainAxisAlignment.spaceAround,
															children: [
																filecontroller[index] == null?FlatButton(
																	onPressed: (){
																		getImage(index);
																	}, 
																	child: Text('Add Image')):Container(),
																Column(
																	children: [
																		SizedBox(
																			height: MediaQuery.of(context).size.width*0.01,
																		),
																		SizedBox(
																			width: 1.0,
																			height: MediaQuery.of(context).size.width*0.2,
																			child: const DecoratedBox(
																				decoration: const BoxDecoration(
																				color: Colors.grey
																				),
																			),
																		),
																		SizedBox(
																			height: MediaQuery.of(context).size.width*0.01,
																		),
																		Text('Or'),
																		SizedBox(
																			height: MediaQuery.of(context).size.width*0.01,
																		),
																		SizedBox(
																			width: 1.0,
																			height: MediaQuery.of(context).size.width*0.19,
																			child: const DecoratedBox(
																				decoration: const BoxDecoration(
																				color: Colors.grey
																				),
																			),
																		),
																	],
																),
																filecontroller[index] == null?FlatButton(
																	onPressed: (){
																		getVideo(index);
																	}, 
																	child: Text('Add Video')):Container(),
															],
														),
													),
													filecontroller[index] == null
														? Text('')
														: filetype[index]=='image'?Image.file(filecontroller[index]):
															ChewieListItem(file:filecontroller[index]),
													
												],
											);
										}
									),
								],
							)
						)
					),
					
					SizedBox(
						height:MediaQuery.of(context).size.height*0.04 ,
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Gender',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					Row(
						children: <Widget>[
							Radio(
								groupValue: gender,
								//title: Text('Male'),
								value: 'Male',
								onChanged: (val) {
									setState(() {
									gender = val;
									});
								},
							),
							Text('Male'),
					
							Radio(
								groupValue: gender,
								//title: Text('Female'),
								value: 'Female',
								onChanged: (val) {
									setState(() {
									gender = val;
									});
								},
							),
							Text('Female'),
							Radio(
								groupValue: gender,
								//title: Text('Male'),
								value: 'Others',
								onChanged: (val) {
									setState(() {
									gender = val;
									});
								},
							),
							Text('Others'),
							//Text('$gender', style: TextStyle(fontSize: 23),)
							
						],
					),
					Column(
						children: [
							Container(
								margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
								child: RaisedButton(
									color: Color.fromRGBO(76, 76, 76 ,1),
									child: Text(
										'Date of Birth',
										style: TextStyle(
											color:Colors.white,
										),
									),
									onPressed: (){
										showDatePicker(
											// selectableDayPredicate: (DateTime val) {
											// 	for (var d in booked){
											// 		debugPrint(d.toString());
											// 		if(val.year==DateTime.now().year && val.month==DateTime.now().month && val.day==DateTime.now().day){
											// 			return true;
											// 		}
											// 		if(d['year']==val.year){
											// 			if(d['month']==val.month){
											// 				if(d['day']==val.day){
											// 					return false;
											// 				}else{
											// 					return true;
											// 				}
											// 			}else{
											// 				return true;
											// 			}
											// 		}else{
											// 			return true;
											// 		}
											// 	}
											// 	//return true;
											// },
											context: context, 
											initialDate: DateTime.now(),
											firstDate: DateTime(DateTime.now().year-60),
											lastDate: DateTime.now()
										).then(
											(date){
												setState(() {
													if(date!=null){
														// dateofbirth['year']=date.year.toString();
														// dateofbirth['month']=date.month.toString();
														dateofbirth="${date.day.toString()}/${date.month.toString()}/${date.year.toString()}";
													}
												});
												
												//debugPrint(index.toString());
											}
										);								
									},
								),
							),
							Text("($dateofbirth)")
						],
					),


					SizedBox(height: MediaQuery.of(context).size.height*0.04,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Contact',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					Row(
						children: [
							Expanded(
								flex:1,
								child: Container(
									margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
									child: Text('+91')
								),
							),
							Expanded(
								flex:8,
								child: Container(
									margin: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.08),
									child: TextFormField(
										controller: phonenumber,
										decoration: new InputDecoration(
											// border: InputBorder.none,
											// focusedBorder: InputBorder.none,
											// enabledBorder: InputBorder.none,
											// errorBorder: InputBorder.none,
											// disabledBorder: InputBorder.none,
											contentPadding:
												EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
											hintText: 'XXXXXXXXXX'
										),
										// keyboardType: TextInputType.number,
										validator: (value) {
											if (value.isEmpty) {
												return 'Please enter Mobile Number';
											}
											
											return null;
										},
									),
								),
							),
						],
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.02,),

					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.02),
						child: TextFormField(
							controller: email,
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'youremail@domain.com'
							),
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter Mobile Number';
								}
								
								return null;
							},
						),
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.04,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Address',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.02),
						child: Column(
							children: [
								TextFormField(
									controller: street,
									decoration: new InputDecoration(
										// border: InputBorder.none,
										// focusedBorder: InputBorder.none,
										// enabledBorder: InputBorder.none,
										// errorBorder: InputBorder.none,
										// disabledBorder: InputBorder.none,
										contentPadding:
											EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
										hintText: 'Street Address, District'
									),
									validator: (value) {
										if (value.isEmpty) {
											return 'Please enter Address';
										}
										
										return null;
									},
								),
								Row(
									children: [
										Expanded(
											flex:3,
											child: TextFormField(
												controller: city,
												decoration: new InputDecoration(
													// border: InputBorder.none,
													// focusedBorder: InputBorder.none,
													// enabledBorder: InputBorder.none,
													// errorBorder: InputBorder.none,
													// disabledBorder: InputBorder.none,
													contentPadding:
														EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
													hintText: 'City'
												),
												validator: (value) {
													if (value.isEmpty) {
														return 'Please enter Address';
													}
													
													return null;
												},
											),
										),
										Expanded(flex:1,child:Text('')),
										Expanded(
											flex:3,
										  child: TextFormField(
											  controller: state,
										  	decoration: new InputDecoration(
										  		// border: InputBorder.none,
										  		// focusedBorder: InputBorder.none,
										  		// enabledBorder: InputBorder.none,
										  		// errorBorder: InputBorder.none,
										  		// disabledBorder: InputBorder.none,
										  		contentPadding:
										  			EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
										  		hintText: 'State'
										  	),
										  	validator: (value) {
										  		if (value.isEmpty) {
										  			return 'Please enter Address';
										  		}
										  		
										  		return null;
										  	},
										  ),
										),
									],
								),
								
								TextFormField(
									controller: country,
									decoration: new InputDecoration(
										// border: InputBorder.none,
										// focusedBorder: InputBorder.none,
										// enabledBorder: InputBorder.none,
										// errorBorder: InputBorder.none,
										// disabledBorder: InputBorder.none,
										contentPadding:
											EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
										hintText: 'Country'
									),
									validator: (value) {
										if (value.isEmpty) {
											return 'Please enter Address';
										}
										
										return null;
									},
								),
							],
						),
					),
					
					
					SizedBox(height: MediaQuery.of(context).size.height*0.04,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Types of Shows',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.02,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03),
						child: Wrap(
							children: [
								for ( var index=0;index<typesofshow.length;index++)
								Padding(
									padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.01,),
									child: Column(
										children: [
											Text(typesofshow[index]['name']),
											Checkbox(
												//title: Text(index['name']),
												value: typesofshow[index]['selected'],
												onChanged: (bool value) {
													setState(() { 
														typesofshow[index]['selected']=value; 
														if(value==true){
															selectedshow.add((typesofshow[index]['name']));
															selectedshowcontroller.add(TextEditingController());
															//debugPrint(_selectedratio.toString());
															
														}else{
															selectedshow.remove((typesofshow[index]['name']));
															selectedshowcontroller.remove(TextEditingController());
															//debugPrint(_selectedratio.toString());
														}
													});
													// debugPrint(selectedshow.toString());
												},
												//secondary: const Icon(Icons.hourglass_empty),
											),
										],
									),
								),
							],
						),
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.02,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Specialization',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.01,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.03),
						child: Wrap(
							children: [
								for ( var index in typesofspecialization)
									Padding(
										padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.01,),
										child: Column(
											children: [
											Text(index['name']),
											Checkbox(
											//title: Text(index['name']),
												value: index['selected'],
												onChanged: (bool value) {
													setState(() { 
														index['selected']=value; 
														if(value==true){
															selectedspecialization.add((index['name']));
														}else{
															selectedspecialization.remove((index['name']));
														}
													});
													//debugPrint(selectedspecialization.toString());
												},
												//secondary: const Icon(Icons.hourglass_empty),
											),
										],
									),
								),
							],
						),
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Container(
								margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
								child: Text(
									'Event Duration',
									style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize:MediaQuery.of(context).size.height*0.021,
									),
								)
							),
							DropdownButton(
								hint: Text('Min'),
								value: _minselected,
								onChanged: (newValue) {
									setState(() {
										_minselected = newValue;
										//price=typeofduration[newValue];
									});
									
								},
								items: minhour.map((hour) {
									return DropdownMenuItem(
										child: new Text(hour.toString()),
										value: hour,
									);
								}).toList(),
							),
							DropdownButton(
								hint: Text('Max'),
								value: _maxselected,
								onChanged: (newValue) {
									setState(() {
										_maxselected = newValue;
										//price=typeofduration[newValue];
									});
									
								},
								items: maxhour.map((hour) {
									return DropdownMenuItem(
										child: new Text(hour.toString()),
										value: hour,
									);
								}).toList(),
							),
							Text('Hrs'),
							Text('')
						],
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.04,),
					TextFormField(
						controller: description,
						maxLines: 10,
						decoration: InputDecoration(
							contentPadding:
								EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
							hintText: "Write about yourself",
							border: OutlineInputBorder(
								borderRadius: BorderRadius.all(Radius.circular(10.0)),
								borderSide: BorderSide(color: Colors.grey),
							),
						),
						validator: (value) {
							if (value.isEmpty) {
								return 'Please write about yourself';
							}
							return null;
						},
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.04,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Team Type',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					Row(
						children: <Widget>[
							Radio(
								groupValue: teamtype,
								//title: Text('Male'),
								value: 'Solo',
								onChanged: (val) {
									setState(() {
									teamtype = val;
									});
								},
							),
							Text('Solo'),
					
							Radio(
								groupValue: teamtype,
								//title: Text('Female'),
								value: 'Duo',
								onChanged: (val) {
									setState(() {
									teamtype = val;
									});
								},
							),
							Text('Duo'),
							Radio(
								groupValue: teamtype,
								//title: Text('Male'),
								value: 'Team',
								onChanged: (val) {
									setState(() {
									teamtype = val;
									});
								},
							),
							Text('Team'),
							//Text('$gender', style: TextStyle(fontSize: 23),)
							
						],
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.01,),
					Row(
						children: [
							Container(
								margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
								child: Text(
									'Outstation Travel',
									style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize:MediaQuery.of(context).size.height*0.021,
									),
								)
							),
							Checkbox(
								value: upfortravel,
								onChanged: (bool value) {
									setState(() { 
										upfortravel=value;
									});
								},
								//secondary: const Icon(Icons.hourglass_empty),
							),
						],
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.01,),
					Row(
						children: [
							Container(
								margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
								child: Text(
									'Unified Price',
									style: TextStyle(
										fontWeight: FontWeight.bold,
										fontSize:MediaQuery.of(context).size.height*0.021,
									),
								)
							),
							Checkbox(
							//title: Text(index['name']),
								value: sameprice,
								onChanged: (bool value) {
									setState(() { 
										sameprice=value; 
										// if(value==true){
										// 	selectedspecialization.add((index['name']));
										// }else{
										// 	selectedspecialization.remove((index['name']));
										// }
									});
									//debugPrint(selectedspecialization.toString());
								},
								//secondary: const Icon(Icons.hourglass_empty),
							),
						],
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04,right:MediaQuery.of(context).size.width*0.01),
						child: sameprice==true?TextFormField(
							controller:price,
							// keyboardType: TextInputType.number,
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'Event Price (Rs)'
							),
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter the price';
								}
								// debugPrint(pricecontroller.text);
								return null;
							},
						):Column(
							children: [
								for ( var index=0;index<selectedshow.length;index++)
									TextFormField(
										controller: selectedshowcontroller[index],
										// keyboardType: TextInputType.number,
										decoration: new InputDecoration(
											// border: InputBorder.none,
											// focusedBorder: InputBorder.none,
											// enabledBorder: InputBorder.none,
											// errorBorder: InputBorder.none,
											// disabledBorder: InputBorder.none,
											contentPadding:
												EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
											hintText: '${selectedshow[index]}'
										),
										validator: (value) {
											if (value.isEmpty) {
												return 'Please enter the price';
											}
											return null;
										},
									),
								
							],
						),
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.04,),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'ID Proof',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Pan Card, Adhar Card, etc',
						)
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.01,),
					Column(
						children: [
							_proofimage!=null?IconButton(icon: Icon(Icons.cancel), onPressed: () {
										setState(() {
											this._proofimage=null;
										});
									},

							):Text(''),
							InkWell(
								onTap: (){getProofImage();},
								child: Container(
									margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
									decoration: BoxDecoration(
										border: Border.all(color: Colors.black,),
										// borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
									),
									height: MediaQuery.of(context).size.height*0.2,
									width: MediaQuery.of(context).size.height*0.2,
									child:_proofimage==null?
										Center(child: Icon(Icons.add_circle)):
										Container(
											decoration: BoxDecoration(
												//borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
												image: DecorationImage(image: FileImage(_proofimage),fit:BoxFit.cover)
											)
										)
								),
							),
						],
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Note: In case of adhar and pan card add single image with back and forth',
						)
					),
					SizedBox(height: MediaQuery.of(context).size.height*0.02,),
					_artistBioModal==null?Container(): Container(
						child:Text("${_artistBioModal.name}, ${_artistBioModal.artistType}")
					),
					Row(
						children: [
							Checkbox(
								//title: Text(index['name']),
								value: agreed,
								onChanged: (bool value) {
									setState(() { 
										agreed=value; 
									});
									// debugPrint(selectedshow.toString());
								},
								//secondary: const Icon(Icons.hourglass_empty),
							),
							Text('agreed with tnc'),
						],
					),
					Center(
						child: RaisedButton(
							color: Color.fromRGBO(104, 178, 160, 1),
							onPressed: () async{
								dynamicprices=[];
								for(int i=0;i<selectedshow.length;i++){
									dynamicprices.add({selectedshow[i]:selectedshowcontroller[i].text});
								}
								// Validate returns true if the form is valid, or false
								// otherwise.
								// if (_formKey.currentState.validate()) {
								// 	if(_maxselected==null){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Select Max Hours')));
								// 		return;
								// 	}
								// 	if(_minselected==null){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Select Min Hours')));
								// 		return;
								// 	}
								// 	// If the form is valid, display a Snackbar.
								// 	if(gender==''){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Select Gender')));
								// 		return;
								// 	}
								// 	if(dateofbirth['year']=='----' || dateofbirth['month']=='--' || dateofbirth['day']=='--'){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Select DOB')));
								// 		return;
								// 	}
								// 	if(selectedshow.length==0){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Provide Type of show preference')));
								// 		return;
								// 	}
								// 	if(selectedspecialization.length==0){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please Provide specialization preference')));
								// 		return;
								// 	}
								// 	if(_maxselected<_minselected){
								// 		Scaffold.of(context).showSnackBar(SnackBar(content: Text('Max hours is less than min hours')));
								// 		return;
								// 	}
								// 	Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
								// }
								final ArtistBioModal artistbio=await PostArtistBio().postArtistBio(
									name.text,
									artist_type.text,
									gender,
									dateofbirth,
									phonenumber.text.toString(),
									email.text,
									street.text,
									city.text,
									state.text,
									country.text,
									selectedshow,
									selectedspecialization,
									_minselected.toString(),
									_maxselected.toString(),
									description.text,
									teamtype,
									upfortravel.toString(),
									sameprice.toString(),
									price.text.toString(),
									dynamicprices,
									agreed.toString()
								)
								.then((ArtistBioModal value){
									debugPrint(artist_type.text);
									uploadimage(_profileimage,'profile',artist_type.text,value.id);
									uploadimage(_proofimage,'idproof',artist_type.text,value.id);
									uploadgallary(filecontroller,artist_type.text,value.id);
								});
								setState(() {
								  _artistBioModal=artistbio;
								//   var artistid=artistbio.id.toString();
								//   uploadimage(_profileimage,artist_type.text,artistid);
								});
							},
							child: Text(
								'Submit',
								style: TextStyle(
									color: Colors.white
								),
							),
						),
					),
				],
			),
		);
  
	}
	void uploadimage(File image,String type,String artist_type, String id) async{
		var url='http://$ip:3000/artistbio/add_artistbio/$type/$artist_type/$id';
		var request = http.MultipartRequest('PATCH',Uri.parse(url));
		request.files.add(await http.MultipartFile.fromPath("$type", image.path));
		request.headers.addAll({
			'Content-type':'multipart/form-data'
		});
		request.send();		
	}

	void uploadgallary(List<dynamic> gallery,String artist_type, String id) async{
		var url='http://$ip:3000/artistbio/add_artistbio/gallery/$artist_type/$id';
		var request = http.MultipartRequest('PATCH',Uri.parse(url));
		for(int i=0;i<gallery.length;i++){
			if(gallery[i]!=null)
			request.files.add(
				await http.MultipartFile.fromPath("gallery", gallery[i].path)
			);
		}
		request.send();
		// request.files.add(;await http.MultipartFile.fromPath("$type", image.path))
		// request.headers.addAll({
		// 	'Content-type':'multipart/form-data'
		// });
		// request.send();		
	}
}