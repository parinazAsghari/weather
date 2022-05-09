import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/providers/ThemeProvider.dart';
import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';

class MessageDialogWidget extends StatelessWidget{
  var title,body,dismissable,positiveTxt;
  Function? positiveFunc;

  MessageDialogWidget({this.title, this.body, this.dismissable=false, this.positiveTxt,this.positiveFunc});

  @override
  Widget build(BuildContext context) {
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return WillPopScope(
        onWillPop: (){
          return new Future(()=>dismissable);
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,

          // contentPadding: EdgeInsets.all(0),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // titlePadding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0),
          // actionsPadding: EdgeInsets.all(0),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: 180,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage('assets/images/bg_card.png'),fit: BoxFit.cover)
                ),
                // height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(height: 10,),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text("$body",textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)),
                    Container(
                      height: 30,
                      width: double.maxFinite,

                      margin: EdgeInsets.only(left: 20,top: 5,right: 20,bottom: 5),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop(null);
                                  if(positiveFunc!=null){
                                    positiveFunc!();
                                  }
                        },
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(width: 2,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor)
                        ),
                        child: Text('$positiveTxt',style: TextStyle(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),),
                      ),
                    )
                    ,                    ],
                )
            ),
          ),
          // actions: <Widget>[
          //   positiveTxt != null ? FlatButton(
          //       onPressed: () {
          //         Navigator.of(context, rootNavigator: true).pop(null);
          //         if(positiveFunc!=null){
          //           positiveFunc();
          //         }
          //       },
          //       child: Text('$positiveTxt',textAlign: TextAlign.center,)
          //   ) : Container()
          // ],
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return WillPopScope(
        onWillPop: (){
          return new Future(()=>dismissable);
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,

          // contentPadding: EdgeInsets.all(0),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // titlePadding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0),
          // actionsPadding: EdgeInsets.all(0),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: 180,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage('assets/images/bg_card.png'),fit: BoxFit.cover)
                ),
                // height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(height: 10,),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text("$body",textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)),
                    Container(
                      height: 30,
                      width: double.maxFinite,

                      margin: EdgeInsets.only(left: 20,top: 5,right: 20,bottom: 5),
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop(null);
                          if(positiveFunc!=null){
                            positiveFunc!();
                          }
                        },
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(width: 2,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor)
                        ),
                        child: Text('$positiveTxt',style: TextStyle(color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),),
                      ),
                    )
                    ,                    ],
                )
            ),
          ),
          // actions: <Widget>[
          //   positiveTxt != null ? FlatButton(
          //       onPressed: () {
          //         Navigator.of(context, rootNavigator: true).pop(null);
          //         if(positiveFunc!=null){
          //           positiveFunc();
          //         }
          //       },
          //       child: Text('$positiveTxt',textAlign: TextAlign.center,)
          //   ) : Container()
          // ],
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return WillPopScope(
        onWillPop: (){
          return new Future(()=>dismissable);
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,

          // contentPadding: EdgeInsets.all(0),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // titlePadding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0),
          // actionsPadding: EdgeInsets.all(0),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: 180,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor
                    //image: DecorationImage(image: AssetImage('assets/images/bg_card.png'),fit: BoxFit.cover)
                ),
                // height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(height: 10,),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text("$body",textAlign: TextAlign.center, style: TextStyle(fontSize: 15,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),)),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Color(0xffB38142),
                              Color(0xffF3C568),
                              //Color(0xffE8C394),
                              //Color(0xffDDAD5B),
                              // Color(0xffC9984F),

                            ],
                          )
                      ),

                      margin: EdgeInsets.only(left: 100,top: 5,right: 100,bottom: 5),
                      child: FlatButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop(null);
                          if(positiveFunc!=null){
                            positiveFunc!();
                          }
                        },
                        //color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                           // side: BorderSide(width: 2,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor)
                        ),
                        child: Text('$positiveTxt',style: TextStyle(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),),
                      ),
                    )
                    ,                    ],
                )
            ),
          ),
          // actions: <Widget>[
          //   positiveTxt != null ? FlatButton(
          //       onPressed: () {
          //         Navigator.of(context, rootNavigator: true).pop(null);
          //         if(positiveFunc!=null){
          //           positiveFunc();
          //         }
          //       },
          //       child: Text('$positiveTxt',textAlign: TextAlign.center,)
          //   ) : Container()
          // ],
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return WillPopScope(
        onWillPop: (){
          return new Future(()=>dismissable);
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,

          // contentPadding: EdgeInsets.all(0),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          // titlePadding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0),
          // actionsPadding: EdgeInsets.all(0),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: 180,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor
                    //image: DecorationImage(image: AssetImage('assets/images/bg_card.png'),fit: BoxFit.cover)
                ),
                // height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(height: 10,),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text("$body",textAlign: TextAlign.center, style: TextStyle(fontSize: 15,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),)),
                    Container(
                      height: 30,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Color(0xffB38142),
                              Color(0xffF3C568),
                              //Color(0xffE8C394),
                              //Color(0xffDDAD5B),
                              // Color(0xffC9984F),

                            ],
                          )
                      ),

                      margin: EdgeInsets.only(left: 100,top: 5,right: 100,bottom: 5),
                      child: FlatButton(
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop(null);
                          if(positiveFunc!=null){
                            positiveFunc!();
                          }
                        },
                        //color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                           // side: BorderSide(width: 2,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor)
                        ),
                        child: Text('$positiveTxt',style: TextStyle(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),),
                      ),
                    )
                    ,                    ],
                )
            ),
          ),
          // actions: <Widget>[
          //   positiveTxt != null ? FlatButton(
          //       onPressed: () {
          //         Navigator.of(context, rootNavigator: true).pop(null);
          //         if(positiveFunc!=null){
          //           positiveFunc();
          //         }
          //       },
          //       child: Text('$positiveTxt',textAlign: TextAlign.center,)
          //   ) : Container()
          // ],
        ),
      );

    }
    else{
      return WillPopScope(
        onWillPop: (){
          return new Future(()=>dismissable);
        },
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          titlePadding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0),
          actionsPadding: EdgeInsets.all(0),
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
              child: Container(
                color: Colors.black12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 10.0,
                      height: 35.0,
                      color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "$title",textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: 75,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 10,top: 25,right: 10,bottom: 0),
                  child: Text("$body",textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
                )
            ),
          ),
          actions: <Widget>[
            positiveTxt != null ? FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(null);
                  if(positiveFunc!=null){
                    positiveFunc!();
                  }
                },
                child: Text('$positiveTxt',textAlign: TextAlign.center,)
            ) : Container()
          ],
        ),
      );

    }
  }




}