import 'dart:io';
import 'dart:async';
import 'package:artist4u/modals/post_partner_modal.dart';
import 'package:artist4u/screens/manage_partner/manage_partner_page.dart';
import 'package:artist4u/services/post_partner_bio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../const.dart';

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
	var name=TextEditingController();
	var phonenumber=TextEditingController();
	var website=TextEditingController();
	var email=TextEditingController();
	var street=TextEditingController();
	var city=TextEditingController();
	var state=TextEditingController();
	var country=TextEditingController();
	var description=TextEditingController();
	var accountholdersname=TextEditingController();
	var accountnumber=TextEditingController();
 // ignore: non_constant_identifier_names
	var IFSC=TextEditingController();
 	// ignore: avoid_init_to_null
	File _profileimage=null;
   // ignore: avoid_init_to_null
  	File _proofimage=null;
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
							controller: name,
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
							controller: email,
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
					Container(
						margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
						child: TextFormField(
							controller: website,
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
						controller: description,
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
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),
						child: Text(
							'Account Details',
							style: TextStyle(
								fontWeight: FontWeight.bold,
								fontSize:MediaQuery.of(context).size.height*0.021,
							),
						)
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.1),
						child: TextFormField(
							controller: accountholdersname,
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'Account Holder\'s Name'
							),
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter Account Holder\'s Name';
								}
								
								return null;
							},
						),
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.1),
						child: TextFormField(
							controller: accountnumber,
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'Account Number'
							),
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter Account Number';
								}
								
								return null;
							},
						),
					),
					Container(
						margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.02,right:MediaQuery.of(context).size.width*0.1),
						child: TextFormField(
							controller: IFSC,
							decoration: new InputDecoration(
								// border: InputBorder.none,
								// focusedBorder: InputBorder.none,
								// enabledBorder: InputBorder.none,
								// errorBorder: InputBorder.none,
								// disabledBorder: InputBorder.none,
								contentPadding:
									EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
								hintText: 'IFSC'
							),
							validator: (value) {
								if (value.isEmpty) {
									return 'Please enter IFSC';
								}
								
								return null;
							},
						),
					),
					VerticalSpace(),
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
										border: Border.all(color: Colors.black,width: 0.5),
										borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.02),
									),
									height: MediaQuery.of(context).size.height*0.2,
									width: MediaQuery.of(context).size.height*0.2,
									child:_proofimage==null?
										// Center(child: Icon(Icons.add_circle)):
										Text(''):
										Container(
											decoration: BoxDecoration(
												color: Colors.black,
												borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.02),
												image: DecorationImage(image: FileImage(_proofimage),fit:BoxFit.cover)
											)
										)
								),
							),
						],
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
					RaisedButton(
							color: Color.fromRGBO(104, 178, 160, 1),
							onPressed: () async{
								if (_formKey.currentState.validate()) {}
								if(_profileimage==null){}
								if(_proofimage==null){}
        // ignore: unused_local_variable
								final PostPartnerBioModal artistbio=await PostPartnerBio().postPartnerBio(
									name.text,
									phonenumber.text,
									email.text,
									website.text,
									street.text,
									city.text,
									state.text,
									country.text,
									description.text,
									accountholdersname.text,
									accountnumber.text,
									IFSC.text,
									agreed.toString()
								)
        // ignore: missing_return
								.then((PostPartnerBioModal value){
										// debugPrint(value.toString());
										uploadimage(_profileimage,'profile',"5f834cd904d3662828e79622");
										uploadimage(_proofimage,'idproof',"5f834cd904d3662828e79622");
									// uploadimage(_proofimage,'idproof',artist_type.text,value.id);
									// uploadgallary(filecontroller,artist_type.text,value.id);
								}).then((value){
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => ManagePartnerPage()), ModalRoute.withName('/home'));
                });
								setState(() {
                  debugPrint("asd");
								//   _artistBioModal=artistbio;
								//   var artistid=artistbio.id.toString();
								//   uploadimage(_profileimage,artist_type.text,artistid);
                });
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

void uploadimage(File image,String type,String userid) async{
	var url='http://$ip:3000/partner/addpartner/$type/$userid';
	var request = http.MultipartRequest('PATCH',Uri.parse(url));
	request.files.add(await http.MultipartFile.fromPath("$type", image.path));
	request.fields['userid']='$userid';
	request.headers.addAll({
		'Content-type':'multipart/form-data',
		"Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJAZ21haWwuY29tIiwiaWQiOiI1ZjgzNGNkOTA0ZDM2NjI4MjhlNzk2MjIiLCJwaG9uZSI6Ijk5OTA1MDA0MTUiLCJpYXQiOjE2MDI1ODgyMDksImV4cCI6MTYwMjYwMjYwOX0.PHLZzrdV1J10G5FKWiKmPgwqVliFzuQgdA73NV6hI_0"
	});
	request.send();		
}