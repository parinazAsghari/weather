
import 'package:flutter/material.dart';

import '../../constants.dart';

class CircleLoadingWidget extends StatelessWidget {

  var msgTxt;
  var dismissable;

CircleLoadingWidget({this.msgTxt,this.dismissable = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope (
      onWillPop: () async => dismissable,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 100,width: 150,
            padding: EdgeInsets.all(5.0),
            decoration: ShapeDecoration(
              // color: secondary_light_grey_color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),

            child: Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                CircularProgressIndicator(
                  // backgroundColor: secondary_dark_purple_color,
                  // valueColor: AlwaysStoppedAnimation(primary_orange_color),
                ),
                SizedBox(height: 5.0,),
                Text(msgTxt,style: TextStyle(
                    // color: primary_grey_color,
                    fontSize: 14.0,fontWeight: FontWeight.normal),textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
              ],

            ),
          ),
        ),
      ),
    );
  }
}