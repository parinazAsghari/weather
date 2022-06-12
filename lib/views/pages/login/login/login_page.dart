import 'dart:convert';
import 'dart:math';

import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/LoadingWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../menu_side/terms_page.dart';
import 'otp_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int state = 0;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _captchaCodeController = TextEditingController();

  var rng = new Random();
  late int code;
  // late int captchaCode;
  late String captchaCode;
  bool disableCode = true;
  bool disablePhone = true;


  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  }

  @override
  void initState() {
    super.initState();
    code = rng.nextInt(90000) + 10000;
    // captchaCode = rng.nextInt(750000) + 100000;
    captchaCode = generateRandomString(6);
    print('otp code is:   $code');
  }

  Future<void> onLoginButtonPressed(String _phone, int _code) async {
    if (_phoneController.text.length != 11) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'لطفا شماره تلفن همراه خود را وارد نمائید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }
    print(
        'capcode: ${captchaCode.toString()} + capcontr + ${_captchaCodeController.text.toString()}');

    if (_captchaCodeController.text.toLowerCase() != captchaCode.toString().toLowerCase()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'کد وارد شده صحیح نمیباشد',
              positiveTxt: 'باشه',
            );
          });

      return;
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CircleLoadingWidget(
              dismissable: false,
              msgTxt: 'لطفا منتظر بمانید',
            );
          });

      await Future.delayed(const Duration(milliseconds: 4000));
      var result = await ApiProvider.sendMobileNumber(_phoneController.text, code.toString());

      Navigator.pop(context);

      if (result.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return MessageDialogWidget(
                dismissable: true,
                title: 'پیام ارسال شد',
                body: 'رمز پیامک شده را وارد نمائید',
                positiveTxt: 'باشه',
              );
            });


        //store user phone number
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('user_phone_number', _phoneController.text);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OtpPage(
                      phoneNumber: _phone,
                      code: _code,
                    )));
        setState(() {});
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              print(result.body.toString());
              return MessageDialogWidget(
                dismissable: true,
                title: 'خطا در ارسال پیام',
                body: 'خطا در ارتباط با سرور. لطفا دوباره تلاش کنید',
                positiveTxt: 'باشه',
              );
            });
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: MediaQuery.of(context).size.height*64/520,
            ),

            //Logo
            Image.asset(
              'assets/images/emdad_khodro_logo.png',
              width: MediaQuery.of(context).size.width * 0.65,
              fit: BoxFit.contain,
            ),

            // Text('ورود',style: TextStyle( fontSize: 24,fontWeight: FontWeight.bold),),
             SizedBox(
              height: MediaQuery.of(context).size.height*24/520,
            ),

            const Text('ثبت نام در سامانه',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

             SizedBox(
              height: MediaQuery.of(context).size.height*32/520,
            ),
            //  SizedBox(
            //   height: MediaQuery.of(context).size.height*12/520,
            // ),

            //state 0: showing phone number textfield - state 1: showing otp code entery
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.70,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      controller: _phoneController,
                      obscureText: false,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (mounted) {
                          setState(() {
                            value.length == 11
                                ? disablePhone = false
                                : disablePhone = true;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        // fillColor: secondary_light_grey_color,

                        // isDense: true,filled: true,
                        hintText: 'شماره موبایل',
                        counterText: '',
                        // fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 0, right: 10, bottom: 0),
                        // labelText: 'شماره همراه',labelStyle: TextStyle(),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(color: color_sharp_orange_light),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                              // color: primary_grey_color,
                              width: 0.8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          borderSide: BorderSide(
                              // color: primary_grey_color,
                              width: 0.8),
                        ),
                        // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height*4/520,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.70,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8)
                  // ),

                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      maxLength: 11,
                      controller: _captchaCodeController,
                      obscureText: false,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        if (mounted) {
                          setState(() {
                            value.length == 6
                                ? disableCode = false
                                : disableCode = true;
                          });
                        }
                      },

                      decoration: InputDecoration(
                        // fillColor: secondary_light_grey_color,

                        // isDense: true,filled: true,
                        hintText: 'تصویر زیر را وارد کنید',
                        counterText: '',
                        // fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 0, right: 10, bottom: 0),
                        // labelText: 'شماره همراه',labelStyle: TextStyle(),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(color: color_sharp_orange_light)),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                // color: primary_grey_color,
                                width: 0.8)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                // color: primary_grey_color,
                                width: 0.8)),
                        // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
                      ),
                    ),
                  ),
                ),
                //  SizedBox(
                //   height: MediaQuery.of(context).size.height*18/520,
                // ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*4/360),
                  width: MediaQuery.of(context).size.width * 100 / 360,
                  height: MediaQuery.of(context).size.width * 65 / 640,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: dark_theme_primary_light, width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => {
                          setState(() {
                            // captchaCode = rng.nextInt(900000) + 100000;
                            captchaCode = generateRandomString(6);
                          })
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: dark_theme_secondary,
                          size: MediaQuery.of(context).size.width * 30 / 640,
                        ),
                      ),
                      Text(
                        captchaCode.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //  SizedBox(
            //   height: MediaQuery.of(context).size.height*10/520,
            // ),

            Container(
              height: MediaQuery.of(context).size.width * 65 / 640,
              width: MediaQuery.of(context).size.width * 0.55,
              margin: EdgeInsets.all(defaultPadding),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: !disableCode?!disablePhone?MaterialStateColor.resolveWith(
                          (states) => dark_theme_primary):MaterialStateColor.resolveWith(
                          (states) => dark_theme_primary_light):MaterialStateColor.resolveWith(
                          (states) => dark_theme_primary_light),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'تایید',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  if(!disablePhone){
                    if(!disableCode){
                      onLoginButtonPressed(_phoneController.text, code);
                    }
                  }
                },
              ),
            ),
            //rules and condition commented
            // SizedBox(height: MediaQuery.of(context).size.height*1.5/10,),
            //
            // InkWell(
            //   onTap: (){
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => const TermsPage()));
            //   },
            //   child: const Text(
            //     'قوانین و مقررات استفاده از اپلیکیشن',
            //     style:
            //         TextStyle(decoration: TextDecoration.underline, fontSize: 15),
            //   ),
            // ),
            // SizedBox(
            //   height: defaultPadding,
            // ),
          ],
        ),
      ),
    );
  }
}
