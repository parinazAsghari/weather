import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/providers/ThemeProvider.dart';
import 'package:emdad_khodro_saipa/utils/AppLocalizationModule.dart';
import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';
import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';
import 'package:emdad_khodro_saipa/views/pages/LoginPage.dart';
import 'package:emdad_khodro_saipa/views/widgets/BackgroundObjectsWidget.dart';
import 'package:provider/provider.dart';

class PreLoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
              image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
          ),
          child: BodyContent(context),
        )

      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
              image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
          ),
          child: BodyContent(context),
        )

      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
              image: DecorationImage(image: AssetImage('assets/images/bg_GoldBlueTheme.png'),fit: BoxFit.cover)
          ),
          child: BodyContent(context),
        )

      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
              image: DecorationImage(image: AssetImage('assets/images/bg_WhiteBlue_preLogin.png'),fit: BoxFit.fill)
          ),
          child: BodyContent(context),
        )

      );

    }
    else{
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
            // image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
          ),
          child: BodyContent(context),
        ),

      );

    }
  }


  Widget BodyContent(BuildContext context){
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return SafeArea(
        child: Container(
          child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                child: Container(
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12.0)

                  ),
                  margin: EdgeInsets.only(right: 24.0, left: 24.0, top: 40.0, bottom: 24.0),

                  child: BackgroundObjectsWidget(
                    widget: Stack(
                        children:[

                          Column(mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 70,)
                              ,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Center(
                                  child: SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: FlatButton(
                                      onPressed: (){
                                        Navigator.push(context, FadeRoute(page: LoginPage('customer')));
                                      },
                                      color: context.watch<ThemeProvider>().getThemeData.accentColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.5),
                                          side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                      ),
                                      child: Text('مشتری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                    ),
                                  ),
                                ),
                              )
                              ,
                              SizedBox(height: 25,)
                              ,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                // width: 220,height: 45,
                                child: Center(
                                  child: SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: FlatButton(
                                      onPressed: (){
                                        //Navigator.push(context, FadeRoute(page: LoginPage('partner')));
                                      },
                                      color: context.watch<ThemeProvider>().getThemeData.accentColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.5),
                                          side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                      ),
                                      child: Text('شریک تجاری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                    ),
                                  ),
                                ),
                              )
                              ,

                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: Image.asset('assets/images/emdad_khodro_logo_single.png',width: 228,height: 131,),
                              )
                              ,


                            ],
                          ),

                        ]
                    ),
                  ),
                ),
              )
          ),
        ),
      );
    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return SafeArea(
        child: Container(
          child: Center(
              child: Stack(
                  children:[

                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 70,)
                        ,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, FadeRoute(page: LoginPage('customer')));
                                },
                                color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.5),
                                    side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                ),
                                child: Text('مشتری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                              ),
                            ),
                          ),
                        )
                        ,
                        SizedBox(height: 25,)
                        ,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          // width: 220,height: 45,
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: (){
                                  //Navigator.push(context, FadeRoute(page: LoginPage('partner')));
                                },
                                color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.5),
                                    side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                ),
                                child: Text('شریک تجاری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                              ),
                            ),
                          ),
                        )
                        ,

                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Image.asset('assets/images/logo_bpj_login.png',width: 228,height: 131,),
                        )
                        ,


                      ],
                    ),

                  ]
              )
          ),
        ),
      );
    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return SafeArea(
        child: Container(
          child: Center(
              child: Stack(
                  children:[

                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20,)
                        ,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(0xffB38142),
                                  Color(0xffF3C568),
                                  //Color(0xffDDAD5B),
                                 // Color(0xffC9984F),

                                ],
                              )
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, FadeRoute(page: LoginPage('customer')));
                                },
                                //color: context.watch<ThemeProvider>().getThemeData.accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('مشتری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                    SizedBox(width: 2,),
                                    Image(image: AssetImage('assets/images/ic_person_blue.png')),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        ,
                        SizedBox(height: 25,)
                        ,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                            color: context.watch<ThemeProvider>().getThemeData.secondaryHeaderColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // width: 220,height: 45,
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: (){
                                  //Navigator.push(context, FadeRoute(page: LoginPage('partner')));
                                },
                                //color: context.watch<ThemeProvider>().getThemeData.secondaryHeaderColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('شریک تجاری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                                    SizedBox(width: 5,),
                                    Image(image: AssetImage('assets/images/ic_hands_shaking_yellow.png')),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 100),
                          child: Image.asset('assets/images/logo.png',width: 150,height: 100,),
                        )
                        ,


                      ],
                    ),
                    Align(alignment: Alignment.bottomCenter
                      ,
                      child: Container(
                        child: Image.asset('assets/images/Golden_tree.png',width: 400,height: 220,),
                      ),
                    )

                  ]
              )
          ),
        ),
      );
    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return SafeArea(
        child: Container(
          child: Center(
              child: Stack(
                  children:[

                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20,)
                        ,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(0xffB38142),
                                  Color(0xffF3C568),
                                  //Color(0xffDDAD5B),
                                 // Color(0xffC9984F),

                                ],
                              )
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(context, FadeRoute(page: LoginPage('customer')));
                                },
                                //color: context.watch<ThemeProvider>().getThemeData.accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('مشتری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                    SizedBox(width: 2,),
                                    Image(image: AssetImage('assets/images/ic_person_blue.png')),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        ,
                        SizedBox(height: 25,)
                        ,
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 100),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color(0xffB38142),
                                  Color(0xffF3C568),
                                  //Color(0xffDDAD5B),
                                  // Color(0xffC9984F),

                                ],
                              )
                          ),
                          /*decoration: BoxDecoration(
                            color: context.watch<ThemeProvider>().getThemeData.secondaryHeaderColor,
                            borderRadius: BorderRadius.circular(20),
                          ),*/
                          // width: 220,height: 45,
                          child: Center(
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: (){
                                  //Navigator.push(context, FadeRoute(page: LoginPage('partner')));
                                },
                                //color: context.watch<ThemeProvider>().getThemeData.secondaryHeaderColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('شریک تجاری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                    SizedBox(width: 5,),
                                    Image(image: AssetImage('assets/images/ic_hands_shaking_blue.png')),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 100),
                          child: Image.asset('assets/images/logo.png',width: 150,height: 100,),
                        )
                        ,


                      ],
                    ),
                    /*Align(alignment: Alignment.bottomCenter
                      ,
                      child: Container(
                        child: Image.asset('assets/images/Golden_tree.png',width: 400,height: 220,),
                      ),
                    )*/

                  ]
              )
          ),
        ),
      );
    }
    else{
      return SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image.asset('assets/images/logo.png',width: 228,height: 131,),
                )
                ,
                SizedBox(height: 70,)
                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 220,height: 45,
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(context, FadeRoute(page: LoginPage('customer')));
                        },
                        color: context.watch<ThemeProvider>().getThemeData.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.5),
                            side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.accentColor)
                        ),
                        child: Text('مشتری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.backgroundColor),),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(child: Image.asset('assets/images/ic_user.png',width: 27,height: 30,)),
                  ],
                )
                ,
                SizedBox(height: 25,)
                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 220,height: 45,
                      child: FlatButton(
                        onPressed: (){
                          //Navigator.push(context, FadeRoute(page: LoginPage('partner')));
                        },
                        color: context.watch<ThemeProvider>().getThemeData.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.5),
                            side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.accentColor)
                        ),
                        child: Text('شریک تجاری هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.backgroundColor),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(child: Image.asset('assets/images/ic_partner.png',width: 38,height: 30,)),
                  ],
                )
                ,

              ],
            ),
          ),
        ),
      );;
    }

  }


}
