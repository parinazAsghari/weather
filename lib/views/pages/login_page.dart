import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/LoadingWidgets.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int state = 0;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _OTPCodeController = TextEditingController();



  Future<void> onLoginButtonPressed() async {

    if(state==0 && _phoneController.text.length!=11){
      showDialog(context: context, builder: (BuildContext context){

        return MessageDialogWidget(
          dismissable: true,
          title: 'ورود اطلاعات',
          body:  'لطفا شماره تلفن همراه خود را وارد نمائید',
          positiveTxt: 'باشه',
        );
      });

      return;
    }

    if(state==1 && _OTPCodeController.text.length!=6){
      showDialog(context: context, builder: (BuildContext context){

        return MessageDialogWidget(
          dismissable: true,
          title: 'ورود اطلاعات',
          body:  'لطفا رمز عبور پیامک شده را وارد نمائید',
          positiveTxt: 'باشه',
        );
      });

      return;
    }




    if(state==0){
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
          title: 'پیام ارسال شد',
          body:  'رمز پیامک شده را وارد نمائید',
          positiveTxt: 'باشه',
        );
      });

      state =  1;
      setState(() {

      });

    }
    else if(state==1){
      showDialog(context: context, builder: (BuildContext context){
        return CircleLoadingWidget(
          dismissable: false,
          msgTxt: 'لطفا منتظر بمانید',
        );
      });

      await Future.delayed(Duration(milliseconds: 4000));

      Navigator.pop(context);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> HomePage()));
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: color_holoGrey_primaryDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            SizedBox(height: defaultPadding*2,),

            //Logo
            Container(
              child: Image.asset('assets/images/emdad_khodro_logo_single.png',
              height: 120,fit: BoxFit.contain,
              ),
            ),

            Text('ورود',style: TextStyle( fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: defaultPadding*2,),
            SizedBox(height: defaultPadding,),

            state==0? Text('شماره همراه خود را وارد نمائید')
            :
            Text(' رمز عبور را در کادر زیر وارد نمائید')
            ,


            //state 0: showing phone number textfield - state 1: showing otp code entery
            state == 0?
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),

              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,

                  controller: _phoneController,
                  obscureText: false,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                      isDense: true,filled: true,
                    hintText: '09xx xxx xxxx',
                    // fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
                      labelText: 'شماره همراه',labelStyle: TextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: color_sharp_orange_light)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: color_holoGrey_primary,width: 0.8)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: color_holoGrey_primary,width: 0.8)),
                      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                  ),
                ),
              ),
            )
                :
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 6,
                  controller: _OTPCodeController,
                  obscureText: false,
                  style: TextStyle(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      hintText: 'xxx xxx',
                      // fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
                      labelText: 'رمز عبور',labelStyle: TextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: color_sharp_orange_light)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: color_holoGrey_primary,width: 0.8)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: color_holoGrey_primary,width: 0.8)),
                      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                  ),
                ),
              ),
            ),


            SizedBox(height: defaultPadding,),

            Expanded(child: Container()),
            
            
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.all(defaultPadding),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: color_holoGrey_primaryLight
                ),
                child: Text('ورود', style: TextStyle(color: color_holoGrey_primaryLow),),
                onPressed: (){
                  onLoginButtonPressed();
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
