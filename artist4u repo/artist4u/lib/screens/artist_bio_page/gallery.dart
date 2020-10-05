import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatelessWidget{
	final List gallerydata=[
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
		'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butdterfly.mp4',
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
		'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butdterfly.mp4',
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
		'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butdterfly.mp4',
		'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  	];
	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Align(
					alignment: Alignment.centerLeft,
					child: Container(
						// decoration: BoxDecoration(
						// 	borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.025)),
						// 	border: Border.all(width: 2,color: Colors.white),
						// ),
						child: Text(
							'Gallery',
							style: TextStyle(
								color: Colors.black,
								fontWeight: FontWeight.bold,
								fontSize: 20,
								fontFamily: 'SpecialElite-Regular',
							),
						),
					),
				),
				SizedBox(height:MediaQuery.of(context).size.width*0.015),
				Container(
					width: MediaQuery.of(context).size.width*0.95,
					height:MediaQuery.of(context).size.width*0.49,
					// decoration: BoxDecoration(
					// 	//borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.025)),
					// 	border: Border.all(width: 2,color: Colors.black),
					// ),
					// child:Swiper(
					// 	itemBuilder: (BuildContext context,int index){
					// 		return ChewieListItem(
								
					// 			url: gallerydata[index],
								
					// 		);
					// 		//           return Image.network(
					// 		//   'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
					// 		// );
					// 	},
					// 	itemCount: gallerydata.length,
					// 	pagination: new SwiperPagination(
					// 		builder: new DotSwiperPaginationBuilder(
				// 		color: Colors.blue, activeColor: Colors.red)
					// 	),
					// 	control: SwiperControl(),
					// ),
					child:CarouselSlider(
						options: CarouselOptions(viewportFraction: 1,),
						items: gallerydata.map((i) {
							return Builder(
								builder: (BuildContext context) {
									return Stack(
										alignment: Alignment.bottomCenter,
										children: [
											ChewieListItem(url: i),
											Row(
												mainAxisAlignment: MainAxisAlignment.spaceEvenly,
												children: [
													for(int j=0;j<gallerydata.length;j++)
														Container(
															margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.width*0.01),
															padding: EdgeInsets.only(top:MediaQuery.of(context).size.width*0.002),
															child: j==gallerydata.indexOf(i)?Center(
																child: Text(
																	'${j+1}',
																	style: TextStyle(
																		color: Colors.white,
																		fontSize: 10,
																	),
																	
																),
															):Text(''),
															height:j==gallerydata.indexOf(i)?MediaQuery.of(context).size.width*0.035:MediaQuery.of(context).size.width*0.01,
															width:j==gallerydata.indexOf(i)?MediaQuery.of(context).size.width*0.035:MediaQuery.of(context).size.width*0.01,
															decoration: BoxDecoration(
																borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width)),
																color: Colors.black,
															),
														)
												],
											),
										],
									);
								},
							);
						}).toList(),
						)
				),
			],
		);
	}

}
class ChewieListItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
   final String url;

  ChewieListItem({
    @required this.url,
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
		videoPlayerControllerForGallery=VideoPlayerController.network(
			widget.url
		);
		_chewieController = ChewieController(
			videoPlayerController: videoPlayerControllerForGallery,
			//aspectRatio: 16 / 9,
			// Prepare the video to be played and display the first frame
			autoInitialize: true,
			looping: false,
			//fullScreenByDefault: true,
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