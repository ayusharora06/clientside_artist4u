import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Map<String,dynamic>> review=[
	{'name':'Ayush Arora','star':5,'review':'Reviews on Google provide valuable information about your business to both you and your customers. Business reviews appear next to your listing in Maps and Search, and can help your business stand out on Google. You can request reviews from customers through a short URL that’s specific to your business. To get reviews on Google, encourage your customers to spread the word about your business by following these best practices'},
	{'name':'Ayush Arora','star':2,'review':'Reviews on Google provide valuable information about your business to both you and your customers. Business reviews appear next to your listing in Maps and Search, and can help your business stand out on Google. You can request reviews from customers through a short URL that’s specific to your business. To get reviews on Google, encourage your customers to spread the word about your business by following these best practices'},
	{'name':'Ayush Arora','star':1,'review':'Reviews on Google provide valuable information about your business to both you and your customers. Business reviews appear next to your listing in Maps and Search, and can help your business stand out on Google. You can request reviews from customers through a short URL that’s specific to your business. To get reviews on Google, encourage your customers to spread the word about your business by following these best practices'},
	{'name':'Ayush Arora','star':3,'review':'Reviews on Google provide valuable information about your business to both you and your customers. Business reviews appear next to your listing in Maps and Search, and can help your business stand out on Google. You can request reviews from customers through a short URL that’s specific to your business. To get reviews on Google, encourage your customers to spread the word about your business by following these best practices'},
	{'name':'Ayush Arora','star':4,'review':'Reviews on Google provide valuable information about your business to both you and your customers. Business reviews appear next to your listing in Maps and Search, and can help your business stand out on Google. You can request reviews from customers through a short URL that’s specific to your business. To get reviews on Google, encourage your customers to spread the word about your business by following these best practices'},
	{'name':'Ayush Arora','star':4,'review':'Awesome Artist'},
	{'name':'Ayush Arora','star':4,'review':'Awesome Artist'},
	{'name':'Ayush Arora','star':4,'review':'Awesome Artist'}
];
class ReviewList extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			itemCount: review.length,
			itemBuilder: (BuildContext context,int index){
				return Container(
					margin: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.width*0.005,horizontal: MediaQuery.of(context).size.width*0.01),
					decoration: BoxDecoration(
						//borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.025)),
						border: Border.all(width: 2,color: Colors.black),
					),
					child:Column(
					  children: <Widget>[
					    Row(
					    	children: <Widget>[
					    		Text(review[index]['name']),
								SizedBox(width:MediaQuery.of(context).size.width*0.01),
					    		StarRating(review[index]['star'])
					    	],
					    ),
						Divider(),
						Align(
							alignment: Alignment.topLeft,
							child: Text(review[index]['review'])
						)
					  ],
					)	
				);
			}
		);
	}

}
class StarRating extends StatelessWidget{
	final int stars;
	StarRating(this.stars);
  	@override
  	Widget build(BuildContext context) {
    	return Container(
			child: Row(
				children: <Widget>[
					for ( var i=0;i<stars;i++) Icon(Icons.star_border,color: Colors.orange,)
				],
			),
		);
  	}
}