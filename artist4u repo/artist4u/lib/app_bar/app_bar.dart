import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget{
  final String title;
  MyAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
		//pinned: true,
		flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
						Color.fromRGBO(104, 178, 160, 1),
						Color.fromRGBO(48, 130, 146, 1),
                    ],
                  ),
                ),
		),
		floating: true,
		snap: false,
		expandedHeight: MediaQuery.of(context).size.height*0.15,
				title:Text(
				this.title
			),
		
		actions: <Widget>[
			IconButton(
				icon:Icon(Icons.filter_list), onPressed: () {  },
			)
		],
		bottom: PreferredSize(
			preferredSize: Size.fromHeight(5),
			child: Container(
				padding: EdgeInsets.only(bottom:1),
				height:MediaQuery.of(context).size.width*0.12,
				margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.width*0.025,right:MediaQuery.of(context).size.width*0.02,left:MediaQuery.of(context).size.width*0.02),
				decoration: BoxDecoration(
					color: Color.fromRGBO(255, 255, 255, 1),
					borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*0.1)),
					border:Border.all(color:Colors.white,width: 2)
				),
				child: TextField(
					maxLines: 1,
					
					decoration: InputDecoration(
						hintText: 'Search',
						border: InputBorder.none,
						// focusedBorder:OutlineInputBorder(
						// 	borderSide:BorderSide(width: 1)
						// ) ,
						// focusedBorder: UnderlineInputBorder(
						// 	borderSide: BorderSide(color: Colors.white),
						// ),
						suffixIcon: IconButton(icon:Icon(Icons.cancel,color: Color.fromRGBO(104, 178, 160, 1),), onPressed: () {  },),
						icon: IconButton(icon:Icon(Icons.search,color: Color.fromRGBO(104, 178, 160, 1)), onPressed: () {  },),
						hintStyle: TextStyle(
							color:Color.fromRGBO(104, 178, 160, 1)
						),
					),
					style: TextStyle(color: Color.fromRGBO(48, 130, 146, 1),)
			  	),
			)
		),
	);
  }
}