import 'package:artist4u/screens/about_us/about_us_page.dart';
import 'package:artist4u/screens/artist_bio_page/artist_bio_page.dart';
import 'package:artist4u/screens/artist_list/artist_list_page.dart';
import 'package:artist4u/screens/become_a_partner/become_a_partner.dart';
import 'package:artist4u/screens/become_an_artist/become_an_artist.dart';
import 'package:artist4u/screens/book_now/book_now_page.dart';
import 'package:artist4u/screens/contact_us/contact_us_page.dart';
import 'package:artist4u/screens/disclaimer/disclaimer_page.dart';
import 'package:artist4u/screens/favorite/favorite_page.dart';
import 'package:artist4u/screens/home_screen/home_screen.dart';
import 'package:artist4u/screens/legal/legal_page.dart';
import 'package:artist4u/screens/login/login.dart';
import 'package:artist4u/screens/manage_artist/manage_artist_page.dart';
import 'package:artist4u/screens/manage_partner/manage_partner_page.dart';
import 'package:artist4u/screens/my_account/my_account_page.dart';
import 'package:artist4u/screens/my_booking/my_booking_page.dart';
import 'package:artist4u/screens/my_settings/my_settings_page.dart';
import 'package:artist4u/screens/my_wallet/my_wallet_page.dart';
import 'package:artist4u/screens/our_partners/our_partners_page.dart';
import 'package:artist4u/screens/privacy_policy/privacy_policy_page.dart';
import 'package:artist4u/screens/terms_of_use/terms_of_use_page.dart';
import 'package:artist4u/screens/track_your_progress/track_your_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main(){
	runApp(MyApp());
}
class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme:ThemeData(
            primaryColor: Color.fromRGBO(35, 57, 93, 1),
			),
			debugShowCheckedModeBanner: false,
			title: 'Artist4U',
			routes: {
        		'/':(context)=>Loading(),
				'/login': (context) => Login(),
				'/home':(context) => HomeScreen(),
				'/artistlist':(context) => ArtistListPage(),
				'/artistbiopage':(context) => ArtistBioPage(),
				'/booknow':(context)=> BookNowPage(),
				'/mybooking':(context)=> MyBookingPage(),
				'/myaccount':(context)=>MyAccountPage(),
				'/trackyourprogress':(context)=>TrackYourProgressPage(),
				'/mysettings':(context)=>MySettingsPage(),
        		'/becomeanartist':(context)=>BecomeAnArtistPage(),
				'/contactus':(context)=>ContactUsPage(),
				'/mywallet':(context)=>MyWalletPage(),
				'/legal':(context)=>LegalPage(),
				'/termsofuse':(context)=>TermsOfUsePage(),
				'/privacypolicy':(context)=>PrivacyPolicyPage(),
				'/disclaimer':(context)=>DisclaimerPage(),
				'/aboutus':(context)=>AboutUsPage(),
				'/favorites':(context)=>FavoritePage(),
				'/becomeapartner':(context)=>BecomeAPartnerPage(),
				'/ourpartners':(context)=>OurPartners(),
				'/managepartner':(context)=>ManagePartnerPage(),
				'/manageartist':(context)=>ManageArtistPage()
			},
      		// home:Loading()
		);
	}    
}
class Loading extends StatefulWidget{
	@override
	_LoadingState createState() => _LoadingState();

}
class _LoadingState extends State<Loading> {
	Future<Map<String,dynamic>> userdata;
	@override
	void initState(){
		userdata=getUserData();
		super.initState();
	}
	@override
  	Widget build(BuildContext context) {
		return SafeArea(
			child:Scaffold(
				 //drawerScrimColor: Colors.blueGrey,
				body:FutureBuilder<Map<String,dynamic>>(
					future: userdata,
					builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
						if(snapshot.hasData){
							var data=snapshot.data;
							// debugPrint(data.toString());
							return data['token']==null?Login():HomeScreen();
						}else{
							return Center(child:CircularProgressIndicator());
						}
					}
				),
			),
		);
 
	}
}
Future<Map<String,dynamic>> getUserData() async{
	SharedPreferences userdata=await SharedPreferences.getInstance();
	Map<String,dynamic> user={
		"token":userdata.getString('token'),
    "message":userdata.getString('message'),
		"artistid":userdata.getString('artistid'),
		"artisttype":userdata.getString('artisttype'),
		"partnerid":userdata.getString('partnerid'),
		"ispartner":userdata.getBool('ispartner'),
		"isartist":userdata.getBool('isartist'),
		// userdata.getString('otp', jsonResponse['token']);
		"userbookings":userdata.getString('userbookings'),
		"_id":userdata.getString('_id'),
		"name":userdata.getString('name'),
		"email":userdata.getString('email'),
		"phone":userdata.getString('phone'),
	};
	// await userdata.clear();
	return user;
}  