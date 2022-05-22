import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/DialogWidgets.dart';
import '../../../../widgets/LoadingWidgets.dart';

class BodyGaranty extends StatefulWidget {
  const BodyGaranty({Key? key}) : super(key: key);

  @override
  _BodyGarantyState createState() => _BodyGarantyState();
}

class _BodyGarantyState extends State<BodyGaranty> {


  Future<void> _onBodyGarantyButtonTap() async {
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

            Image.asset('assets/images/body_garanty.png', height: 120,fit: BoxFit.cover,),

            SizedBox(height: defaultPadding,),

            Text('برای ثبت درخواست گارانتی بدنه کلیک نمائید',style: TextStyle(fontWeight: FontWeight.bold),),

            SizedBox(height: defaultPadding,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: primary_grey_color
                ),
                onPressed: (){
                  _onBodyGarantyButtonTap();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('گارانتی بدنه', style: TextStyle(color: secondary_light_grey_color),),
                )
            )

          ],
        ),
      ),
    );
  }
}
