
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:emdad_khodro_saipa/providers/LoginProvider.dart';
import 'package:emdad_khodro_saipa/providers/ThemeProvider.dart';
import 'package:emdad_khodro_saipa/repository/MemberRepository.dart';
import 'package:emdad_khodro_saipa/repository/UserRepository.dart';
import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';
import 'package:emdad_khodro_saipa/utils/Consts.dart';
import 'package:emdad_khodro_saipa/utils/NetworkModule.dart';
import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';
import 'package:emdad_khodro_saipa/views/pages/ForgetPasswordPage.dart';
import 'package:emdad_khodro_saipa/views/pages/HomePage.dart';
import 'package:emdad_khodro_saipa/views/widgets/BackgroundObjectsWidget.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/LoadingWidgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget{

  String userType;
  LoginPage(this.userType);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginProvider loginProvider = LoginProvider();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  int bioMetricAuthDelay = 1;
  String biometricResult='';
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      if(loginProvider.getRememberMe){
        userNameController.text = loginProvider.getUserName;
        passwordController.text = loginProvider.getPassWord;
      }
    });
  }


  void loginUser(BuildContext context)async{

    print('-------------------- prx -------- ${userNameController.text}');

    if(userNameController.text == ''){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: ' نام کاربری را وارد کنید',dismissable: true,positiveTxt: 'باشه',)
      );
      return;
    }
    if(passwordController.text == ''){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'رمز عبور را وارد کنید',dismissable: true,positiveTxt: 'باشه',)
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx)=> CircleLoadingWidget(msgTxt: 'لطفا منتظر بمانید',)
    );

    bool? isAuth;
    Future.delayed(const Duration(milliseconds: 4000), () {
      isAuth =  true;

      setState(() {
      });

      Navigator.pop(context);
      if(isAuth!){
        Navigator.pushAndRemoveUntil(context, FadeRoute(page: HomePage(userName: 'کاربر مهمان')), (Route<dynamic> route) => false);
      }
      else{
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'عملیات با خطا مواجه شد',dismissable: true,positiveTxt: 'فهمیدم',)
        );
      }
    });



  }
  

  void initBiometric(BuildContext context)async{
    if (await _isBiometricAvailable()&&loginProvider.getUseBiometric) {
      await _getListOfBiometricTypes();
      await _authenticateUser(context);
    }
  }


  void loginByBiometric(BuildContext context) async{

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx)=> CircleLoadingWidget(msgTxt: 'لطفا منتظر بمانید',)
    );

    bool? isAuth;
    Future.delayed(const Duration(milliseconds: 2500), () {
      isAuth =  true;

      setState(() {
      });
    });

    Navigator.pop(context);
    if(isAuth!){
      Navigator.pushAndRemoveUntil(context, FadeRoute(page: HomePage(userName: 'مهمان')), (Route<dynamic> route) => false);
    }
    else{
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'عملیات با خطا مواجه شد',dismissable: true,positiveTxt: 'فهمیدم',)
      );
    }

  }





  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    }  catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available!')
        : print('Biometric is unavailable.');

    return isAvailable;
  }

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType>? listOfBiometrics;
    try {
      listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    print(listOfBiometrics);
  }

  Future<void> _authenticateUser(BuildContext context) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: "Please authenticate to login into your account.",
        // useErrorDialogs: false,stickyAuth: true,
      );
    } catch (e) {
      print(e);
    }


    if (!mounted) return;

    if (isAuthenticated) {
      print('User is authenticated!');
      Future.delayed(Duration(seconds: bioMetricAuthDelay),(){
        loginByBiometric(context);
      });
    }
    else{
      print('User is not authenticated.');
    }


  }

  void _cancelAuthentication() {
    _localAuthentication.stopAuthentication();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        // width: MediaQuery.of(context).size.width,
        width: double.maxFinite,
        // height: MediaQuery.of(context).size.height,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
        ),
        child: ChangeNotifierProvider<LoginProvider>(
          create: (ctx){
            return loginProvider;
          },
          child: BodyContent(context),
        ),
      ),
    );

  }


  Widget BodyContent(BuildContext context){


    return SafeArea(
        child:  BackdropFilter(filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12.0)
              ),
              margin: EdgeInsets.only(right: 16.0, left: 16.0, top: 32.0, bottom: 8.0),

              child: BackgroundObjectsWidget(
                widget: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 10,)
                      ,
                      Container(
                        child: Image.asset('assets/images/emdad_khodro_logo_single.png',width: 120,height: 100,fit: BoxFit.contain,),
                      )
                      ,
                      SizedBox(
                        height: 40,
                      ),
                      LoginTextField(ctx: context,controller: userNameController,label: 'نام کاربری')
                      ,
                      // SizedBox(height: 10,)
                      // ,
                      LoginTextField(ctx: context,controller: passwordController,label: 'رمز عبور',isObscure: true)
                      ,
                      SizedBox(height: 20,)
                      ,
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(left: 32.0,right: 32.0),
                        child: RaisedButton(
                          onPressed: (){
                            loginUser(context);
                            //testApi();
                          },
                          color: context.watch<ThemeProvider>().getThemeData.accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                              side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                          ),
                          child: Text('ورود',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                        ),
                      )
                      ,
                      SizedBox(height: 10,)
                      ,
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, FadeRoute(page: ForgetPasswordPage()));

                        },
                        child:Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                        ,
                      )
                      ,
                      SizedBox(height: 24,)
                      ,

                      //sign up button
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(left: 32.0,right: 32.0),
                        child: RaisedButton(
                          onPressed: (){
                            // loginUser(context);
                            //testApi();
                          },
                          color: context.watch<ThemeProvider>().getThemeData.accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.5),
                              side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                          ),
                          child: Text('کاربر جدید هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                        ),
                      )
                      ,
                      SizedBox(height: 30,),

                      //biometric section
                      Consumer<LoginProvider>(
                        builder: (ctx,data,_){
                          return Center(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: data.getUseBiometric ? (){
                                    initBiometric(context);
                                  } : null,
                                  child: Image.asset('assets/images/ic_faceId.png',fit: BoxFit.fill,color: data.getUseBiometric ? context.read<ThemeProvider>().getThemeData.indicatorColor : Colors.white,colorBlendMode: BlendMode.modulate,),
                                ),
                              )
                          );
                        },
                      )
                      ,
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
            )
        )
    );

  }

  Widget LoginTextField({required BuildContext ctx,required TextEditingController controller,required String label,bool isObscure=false}){

    return Container(
      margin: EdgeInsets.only(left: 10,top: 7,right: 10,bottom: 7),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          obscureText: isObscure,
          style: TextStyle(fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              isDense: true,filled: true,fillColor: Colors.white54,
              contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
              labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
          ),
        ),
      ),
    );


  }

}


