import 'dart:convert';

import 'package:artist4u/const.dart';
import 'package:artist4u/modals/get_artist_bio.dart';
import 'package:artist4u/services/get_artist_bio.dart';
import 'package:flutter/material.dart';

import 'artist_info.dart';
import 'book_now_button.dart';
import 'gallery.dart';
// ignore: must_be_immutable
class ArtistBio extends StatefulWidget{
	final String name;
	String artistType;
	String id;
	ArtistBio(this.name,this.artistType,this.id);

  @override
  _ArtistBioState createState() => _ArtistBioState();
}

class _ArtistBioState extends State<ArtistBio> {
	Future<GetArtistBioModal> _artistBio;
	@override
	void initState(){
		// debugPrint("${widget.artistType},${widget.id}");
		_artistBio = GetArtistBio().getArtistBio(widget.artistType,widget.id);
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return FutureBuilder<GetArtistBioModal>(
			future: _artistBio,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
				if(snapshot.hasData){
					var data = snapshot.data;
					var profileimage = 'http://$ip:3000/artisttype/${data.artistType}/${data.id}/profile/${data.profile.originalname.toString().replaceAll('\\','/')}';
					// debugPrint('\n\n\n $profileimage \n\n\n');
					return ListView(
						children:<Widget>[
							Container(
								margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
								child:Column(
									children: <Widget>[
										ArtistBasicInfo(name:data.name.toString(),recommended:data.recommended,profile:profileimage,duration:"${data.minhours}-${data.maxhours} hrs",peopleschoice:data.peopleschoice,experience:data.experience),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										Gallery(),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										AboutArtist(data.description),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										ComfortLanguage(preferredlanguage:jsonDecode(data.languagepreffered[0])),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										PreferredEvents(preferredevents:jsonDecode(data.typesofshow[0])),
										SizedBox(height:MediaQuery.of(context).size.width*0.05),
                    Specialization(specialization:jsonDecode(data.specialization[0])),
										SizedBox(height:MediaQuery.of(context).size.width*0.05),
										Price(single:data.price,multiple: jsonDecode(data.differentprices[0]),unifiedprice: data.unifiedprice,),
										SizedBox(height:MediaQuery.of(context).size.width*0.05),
										BookNowButton(widget.name),		
									],
								)
							),
						]
					);
				}else{
					return Center(child:CircularProgressIndicator());
				}
			}
		);
	}
}