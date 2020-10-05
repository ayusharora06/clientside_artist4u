import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BecomeAPartnerContent extends StatefulWidget{
	@override
	_BecomeAPartnerContentState createState() => _BecomeAPartnerContentState();
	}

class _BecomeAPartnerContentState extends State<BecomeAPartnerContent> {
	@override
	Widget build(BuildContext context) {
		return ListView(
			children: [
				// ArtistGallery(),
				PartnerForm()
			],
		) ;
	}
}
class PartnerForm extends StatefulWidget{
  @override
  _PartnerFormState createState() => _PartnerFormState();
}

class _PartnerFormState extends State<PartnerForm> {
	final _formKey = GlobalKey<FormState>();
 	// ignore: avoid_init_to_null
	File _profileimage=null;
	final picker = ImagePicker();
  bool agreed=false;

	Future getProfileImage() async {
		final pickedFile = await picker.getImage(source: ImageSource.gallery);
		setState(() {
			if(pickedFile !=null){ 
				_profileimage = File(pickedFile.path);
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		return Form(
			key: _formKey,
			child: Column(
				children: [
					VerticalSpace(),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
												border: Border.all(color: Colors.black,width: 0.5),
												borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.02),
											),
											height: MediaQuery.of(context).size.height*0.2,
											width: MediaQuery.of(context).size.height*0.2,
											child:_profileimage==null?
												// Center(child: Icon(Icons.add_circle)):
												Text(''):
												Container(
													decoration: BoxDecoration(
														color: Colors.black,
														borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.02),
														image: DecorationImage(image: FileImage(_profileimage),fit:BoxFit.cover)
													)
												)
										),
									),
								],
							),
							Container(
								margin: EdgeInsets.only(right:MediaQuery.of(context).size.width*0.06),
								child: Row(
									children: [
										Text(
											'Be a Certified Partner',
											style: TextStyle(
												fontWeight: FontWeight.bold,
												fontSize:MediaQuery.of(context).size.height*0.02,
											),
										),
										Icon(
											Icons.check_circle,
											size: MediaQuery.of(context).size.width*0.065,
											color: Color.fromRGBO(104, 178, 160,1),
										),
									],
								),
							)
						],
					),
					//VerticalSpace(),
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'Name'
							),
							// keyboardType: TextInputType.number,
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter Name';
								}
								
								return null;
							},
						),
					),

					VerticalSpace(),
					Align(
						alignment: Alignment.centerLeft,
						child: Container(
							margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.06),
							child: Text(
								'Contact',
								style: TextStyle(
									fontWeight: FontWeight.bold,
									fontSize:MediaQuery.of(context).size.height*0.021,
								),
							)
						),
					),
					
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'Email'
							),
							// keyboardType: TextInputType.number,
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter Email ID';
								}
								
								return null;
							},
						),
					),

					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
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
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'Website if Any'
							),
							// keyboardType: TextInputType.number,
							// validator: (value) {
							// 	if (value.isEmpty) {
							// 		return 'Please enter Email ID';
							// 	}
								
							// 	return null;
							// },
						),
					),
					
					VerticalSpace(),
					Align(
						alignment: Alignment.centerLeft,
							child: Container(
								margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.06),
							child: Text(
								'Address',
								style: TextStyle(
									fontWeight: FontWeight.bold,
									fontSize:MediaQuery.of(context).size.height*0.021,
								),
							)
						),
					),
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
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
							// keyboardType: TextInputType.number,
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter Street Address, District';
								}
								
								return null;
							},
						),
					),
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: Row(
							children: [
								Expanded(
									flex:3,
									child: TextFormField(
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
											return 'Please enter City';
										}
										
										return null;
									},
									),
								),
								Expanded(flex:1,child:Text('')),
								Expanded(
									flex:3,
									child: TextFormField(
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
											return 'Please enter State';
										}
										
										return null;
									},
									),
								),
							],
						),
					),
					
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
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
									return 'Please enter Country';
								}
								
								return null;
							},
						),
					),
					VerticalSpace(),
					VerticalSpace(),
					TextFormField(
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
						// validator: (value) {
						// 	if (value.isEmpty) {
						// 		return 'Please write about yourself';
						// 	}
						// 	return null;
						// },
					),

					VerticalSpace(),
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
					RaisedButton(
							color: Color.fromRGBO(104, 178, 160, 1),
							onPressed: () {
								if (_formKey.currentState.validate()) {}
								if(_profileimage==null){}
							},
							child: Text(
								'Register',
								style: TextStyle(
									color: Colors.white
								),
							),
						),
				],
			)
		);
  
	}
}

class VerticalSpace extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return SizedBox(
			height:MediaQuery.of(context).size.height*0.03 ,
		);
	}
}