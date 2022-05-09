import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';
import 'package:emdad_khodro_saipa/utils/SharedPrefsUtil.dart';
import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';
import 'package:emdad_khodro_saipa/views/pages/LoginPage.dart';
import 'package:emdad_khodro_saipa/views/pages/PreLoginPage.dart';

class SplashPage extends StatefulWidget {


  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin  {

  late AnimationController _animationControllerText;
  late Animation<Offset> _animationOffsetText;

  late AnimationController _animationControllerLogo;
  late Animation<Offset> _animationOffsetLogo;


  void navigation() async {
    bool _decider = await SharedPrefsUtil.prefsInstance.loadFromPrefs('UserLoggedIn') ?? false;
    print('=>>>>> decider : $_decider');

//    if (_decider) {
////      Future.delayed(const Duration(seconds: 5), () async {
////        Navigator.pushReplacement(
////            context,
////            FadeRoute(
////              page: HomePage(),
////            ));
////      });
////    } else {
////      Future.delayed(const Duration(seconds: 5), () async {
////        Navigator.pushReplacement(
////            context,
////            FadeRoute(
////              page: LoginPage()
////            ));
////      });
////    }

    Future.delayed(Duration(milliseconds: 2200),(){
      // Navigator.pushReplacement(context, FadeRoute(page: PreLoginPage()));
      Navigator.pushReplacement(context, FadeRoute(page: LoginPage('customer')));
    });


  }


  @override
  void initState() {
    super.initState();

    _animationControllerText = AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animationOffsetText = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero).animate(_animationControllerText);

    _animationControllerLogo = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _animationOffsetLogo = Tween<Offset>(begin: Offset(-3.0, 0.0), end: Offset.zero).animate(_animationControllerLogo);

    Future.delayed(Duration.zero, () {
      _animationControllerText.forward();
      _animationControllerLogo.forward();
    });

    navigation();

  }

  @override
  void dispose() {
    super.dispose();
    _animationControllerText.dispose();
    _animationControllerLogo.dispose();
  }



  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Text('this is splash page'),
  //     ),
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage("assets/images/splash_background.png"),
              image: AssetImage("assets/images/bg_skyblueTheme.png"),
              fit: BoxFit.cover,
            )

            ,
          ),
          child: BodyContent(),
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image:DecorationImage(
              // image: AssetImage("assets/images/splash_background.png"),
              image: AssetImage("assets/images/bg_NavyBlueTheme.png"),
              fit: BoxFit.cover,
            )

            ,
          ),
          child: BodyContent(),
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image:DecorationImage(
              // image: AssetImage("assets/images/splash_background.png"),
              image: AssetImage("assets/images/bg_GoldBlueTheme.png"),
              fit: BoxFit.cover,
            )

            ,
          ),
          child: BodyContent(),
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image:DecorationImage(
              // image: AssetImage("assets/images/splash_background.png"),
              image: AssetImage("assets/images/bg_white.png"),
              fit: BoxFit.cover,
            )

            ,
          ),
          child: BodyContent(),
        ),
      );

    }
    else{
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/images/splash_background.png"),
              // image: AssetImage("assets/images/bg_skyblueTheme.png"),
              fit: BoxFit.cover,
            )

            ,
          ),
          child: BodyContent(),
        ),
      );

    }
  }


  Widget BodyContent(){

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5)
        ),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                SlideTransition(
                  position: _animationOffsetLogo,
                  child: Container(
                    height: 150.0,
                    width: 200.0,
                    child: Image.asset('assets/images/emdad_khodro_logo_single.png'),
                  ),
                ),
                SizedBox(height: 16.0,),
                SlideTransition(
                  position: _animationOffsetText,
                  child: Container(
                    child: Text('امداد خودرو سایپا',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,shadows: [Shadow(color: Colors.black26,blurRadius: 10,offset: Offset(1,1))]),),
                  ),
                ),

              ],
            )
        ),

      ),
    );

  }





}
