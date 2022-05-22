import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/DialogWidgets.dart';
import '../../../../widgets/LoadingWidgets.dart';

class Renew extends StatefulWidget {
  const Renew({Key? key}) : super(key: key);

  @override
  _RenewState createState() => _RenewState();
}

class _RenewState extends State<Renew> {


  Future<void> _onContinueSubscribeTap() async {

    showDialog(context: context, builder: (BuildContext context){
      return CircleLoadingWidget(
        dismissable: false,
        msgTxt: 'لطفا منتظر بمانید',
      );
    });

    await Future.delayed(Duration(milliseconds: 4000));

    Navigator.pop(context);

    showDialog(context: context, builder: (BuildContext context){

      return MessageDialogWidget(
        dismissable: true,
        title: 'درخواست ثبت شد',
        body:  'درخواست شما با موفقیت ثبت شد. همکاران ما بزودی با شما تماس خواهند گرفت',
        positiveTxt: 'باشه',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary_light_grey_color,
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset('assets/images/renew.png', height: 120,fit: BoxFit.cover,),

            SizedBox(height: defaultPadding,),

            Text('برای ثبت درخواست تمدید اشتراک کلیک نمائید', style: TextStyle(fontWeight: FontWeight.bold),),

            SizedBox(height: defaultPadding,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: primary_grey_color
                ),
                onPressed: (){
                  _onContinueSubscribeTap();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('تمدید اشتراک', style: TextStyle(color: secondary_light_grey_color),),
                )
            )

          ],
        ),
      ),
    );
  }
}
