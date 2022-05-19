import 'package:flutter/material.dart';

import '../../constants.dart';

class MessageDialogWidget extends StatelessWidget{
  var title,body,dismissable,positiveTxt;
  Function? positiveFunc;

  MessageDialogWidget({this.title, this.body, this.dismissable=false, this.positiveTxt,this.positiveFunc});

  @override
  Widget build(BuildContext context) {
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
                      color: primary_grey_color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(width: 2,color: color_holoGrey_primaryLow)
                      ),
                      child: Text('$positiveTxt',style: TextStyle(color: color_holoGrey_primaryLow),),
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




}