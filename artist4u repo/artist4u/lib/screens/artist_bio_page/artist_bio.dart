import 'package:artist4u/modals/get_artist_bio.dart';
import 'package:artist4u/services/get_artist_bio.dart';
import 'package:flutter/material.dart';

import 'artist_info.dart';
import 'book_now_button.dart';
import 'gallery.dart';
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
		debugPrint("${widget.artistType},${widget.id}");
		_artistBio = GetArtistBio().getArtistBio(widget.artistType,widget.id);
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return FutureBuilder<GetArtistBioModal>(
			future: _artistBio,
			builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
				if(snapshot.hasData){
					// debugPrint(snapshot.data.id.toString());
					return ListView(
						children:<Widget>[
							Container(
								margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
								child:Column(
									children: <Widget>[
										ArtistBasicInfo(widget.name),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										Gallery(),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										AboutArtist(),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										ComfortLanguage(),
										SizedBox(height:MediaQuery.of(context).size.width*0.03),
										PreferredEvents(),
										SizedBox(height:MediaQuery.of(context).size.width*0.05),
										Price(),
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