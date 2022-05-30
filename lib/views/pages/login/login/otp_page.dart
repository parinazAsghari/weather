import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:emdad_khodro_saipa/views/pages/home_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/LoadingWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import 'login_page.dart';

class OtpPage extends StatefulWidget {
  String? phoneNumber;
  int? code;

  OtpPage({@required this.phoneNumber, @required this.code, Key? key})
      : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _codeController = TextEditingController();
  late int _code;
  bool disableButton = true;
  int secondsRemaining = 10;
  bool enableResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _code = widget.code!;
    print('otp code is:   $_code');
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        if (mounted) {
          setState(() {
            secondsRemaining--;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            secondsRemaining = 10;
            enableResend = true;
          });
        }
      }
    });
  }

  Future<void> onLoginButtonPressed() async {
    print(_codeController.text);
    print(_code);

    if (_codeController.text != _code.toString()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'رمز عبور اشتباه است',
              body: 'رمز عبور اشتباه است. دوباره سعی کنید',
              positiveTxt: 'باشه',
            );
          });
      return;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CircleLoadingWidget(
            dismissable: false,
            msgTxt: 'لطفا منتظر بمانید',
          );
        });

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('loggedIn', true);

    await Future.delayed(const Duration(milliseconds: 4000));

    Navigator.pop(context);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _body(),
    );
  }

  Widget _body() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          //Logo
          Image.asset(
            'assets/images/emdad_khodro_logo.png',
            width: MediaQuery.of(context).size.width * 0.65,
            fit: BoxFit.contain,
          ),

          const SizedBox(
            height: 24,
          ),

          const Text('کد تایید',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.70,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      // color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 5,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      borderWidth: 1,
                      activeColor: Colors.grey,
                      disabledColor: Colors.white,
                      inactiveColor: Colors.grey,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.grey,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: _codeController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      onLoginButtonPressed();
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          value.length > 4
                              ? disableButton = false
                              : disableButton = true;
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    'تغییر شماره موبایل',
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              if (enableResend) {
                resendCode();
              } else {}
            },
            child: Text(
              'ارسال مجدد کد  ${enableResend ? '' : secondsRemaining}',
            ),
          ),
          const SizedBox(
            height: 48,
          ),

          Container(
            height: 50,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width * 0.55,
            margin: EdgeInsets.all(defaultPadding),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: disableButton
                      ? MaterialStateColor.resolveWith(
                          (states) => dark_theme_primary_light)
                      : MaterialStateColor.resolveWith(
                          (states) => dark_theme_primary)),
              child: const Text(
                'تایید',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (disableButton) {
                  return;
                } else {
                  onLoginButtonPressed();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  resendCode() async {
    if (mounted) {
      setState(() {
        enableResend = false;
        secondsRemaining = 10;
        startTimer();
      });
    }

    await Future.delayed(Duration(milliseconds: 3000));

    Map data = {
      'MobileNumber': '${widget.phoneNumber}',
      'Message':
          "ضمن تشکر از نصب برنامه، رمز ورود شما:  ${_code.toString()} \n امداد خودرو سایپا\n "
    };

    var url = 'http://185.94.99.204:5252/api/Sms/Send';

    //encode Map to JSON
    var body = json.encode(data);

    // var result = await http.post(Uri.http('185.94.99.204:5252', '/api/Sms/Send'),
    var result = await http.post(
        Uri.http('185.94.99.204:7252', '/api/Sms/Send'),
        headers: {"Content-Type": "application/json"},
        body: body);

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
