import 'dart:io';
import 'dart:ui';

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login/login_page.dart';

class SplashPage extends StatefulWidget {


  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin  {

  late AnimationController _animationControllerText;
  late Animation<Offset> _animationOffsetText;

  late AnimationController _animationControllerLogo;
  late Animation<Offset> _animationOffsetLogo;


  //shared prefs
   bool? _loggedIn;



  void navigation() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _loggedIn = sharedPreferences.getBool('loggedIn') ?? false;

    bool loggedIn = sharedPreferences.getBool('loggedIn')??false;

    Future.delayed(Duration(milliseconds: 4000),(){
      if(loggedIn){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));

      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));

      }
    });
  }



  @override
  void initState() {
    super.initState();


    _animationControllerText = AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animationOffsetText = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero).animate(_animationControllerText);

    _animationControllerLogo = AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animationOffsetLogo = Tween<Offset>(begin: Offset(-3.0, 0.0), end: Offset.zero).animate(_animationControllerLogo);

    Future.delayed(Duration.zero, () {
      _animationControllerText.forward();
      _animationControllerLogo.forward();
    });

    navigation();

  }

  @override
  void dispose() {
    _animationControllerText.dispose();
    _animationControllerLogo.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: BodyContent(),
      ),
    );
  }


  Widget BodyContent(){

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Container(
        decoration: BoxDecoration(
            // color: secondary_light_grey_color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            SlideTransition(
              position: _animationOffsetLogo,
              child: Container(
                padding: EdgeInsets.all(defaultPadding*2),
                // height: 150.0,
                // width: 200.0,
                child: Image.asset('assets/images/emdad_khodro_logo.png', height: 120,fit: BoxFit.contain,),
              ),
            ),
            // SizedBox(height: defaultPadding,),
            // SlideTransition(
            //   position: _animationOffsetText,
            //   child: Container(
            //     child: Text('امداد خودرو سایپا',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black26,blurRadius: 10,offset: Offset(1,1))]),),
            //   ),
            // ),

            // SizedBox(height: defaultPadding,),

            CircularProgressIndicator(
              color: Theme.of(context).accentColor,
              // color: primary_orange_color,
            ),

          ],
        ),

      ),
    );

  }





}
