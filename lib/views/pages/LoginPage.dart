
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

    if(userNameController.text==''||passwordController.text==''){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'لطفا فیلد هارا پر کنید',dismissable: true,positiveTxt: 'باشه',)
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx)=> CircleLoadingWidget(msgTxt: 'لطفا منتظر بمانید',)
    );

//     bool isAuth = await MemberRepository().callAuthenticate(userNameController.text, passwordController.text);
//     Navigator.pop(context);
//     if(isAuth){
// //      if(loginProvider.getRememberMe){
// //        loginProvider.saveRememberMe();
// //        loginProvider.setUserName = userNameController.text;
// //        loginProvider.setPassWord = passwordController.text;
// //        loginProvider.saveUserPass();
// //      }
// //      else{
// //        loginProvider.setRememberMe = false;
// //        loginProvider.saveRememberMe();
// //        loginProvider.setUserName = '';
// //        loginProvider.setPassWord = '';
// //        loginProvider.saveUserPass();
// //      }
//
//       loginProvider.saveRememberMe();
//       loginProvider.setUserName = userNameController.text;
//       loginProvider.setPassWord = passwordController.text;
//       loginProvider.saveUserPass();
//
//       Navigator.pushAndRemoveUntil(context, FadeRoute(page: HomePage(userName: userNameController.text)), (Route<dynamic> route) => false);
//     }
//     else{
//       showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'عملیات با خطا مواجه شد',dismissable: true,positiveTxt: 'فهمیدم',)
//       );
//     }
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

    // bool isAuth = await MemberRepository().callAuthenticate(loginProvider.getUserName, loginProvider.getPassWord);
    // Navigator.pop(context);
    // if(isAuth){
    //   Navigator.pushAndRemoveUntil(context, FadeRoute(page: HomePage(userName: loginProvider.getUserName)), (Route<dynamic> route) => false);
    // }
    // else{
    //   showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'عملیات با خطا مواجه شد',dismissable: true,positiveTxt: 'فهمیدم',)
    //   );
    // }

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
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          // width: MediaQuery.of(context).size.width,
          width: double.maxFinite,
          // height: MediaQuery.of(context).size.height,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          // width: MediaQuery.of(context).size.width,
          width: double.maxFinite,
          // height: MediaQuery.of(context).size.height,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_GoldBlueTheme.png'),fit: BoxFit.cover)
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          // width: MediaQuery.of(context).size.width,
          width: double.maxFinite,
          // height: MediaQuery.of(context).size.height,
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_blue.png'),fit: BoxFit.cover)
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
    else{
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
  }

  /*

   */

  Widget BodyContent(BuildContext context){
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return SafeArea(
        child:  BackdropFilter(filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12.0)
            ),
            margin: EdgeInsets.only(right: 24.0, left: 24.0, top: 40.0, bottom: 24.0),

            child: BackgroundObjectsWidget(
              widget: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20,)
                    ,
                    Container(
                      child: Image.asset('assets/images/behsa.png',width: 160,height: 110,fit: BoxFit.contain,),
                    )
                    ,
                    // SizedBox(height: 20,)
                    // ,
                    // Text('ورود به سامانه وفاداری',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
                    // ,
                    // SizedBox(height: 20,)
                    // ,
                    // Divider(height: 2,thickness: 1.5,indent: 50,endIndent: 50,color: context.watch<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),)
                    // ,
                    // SizedBox(height: 30,)
                    // ,
                    SizedBox(
                      height: 40,
                    ),
                    LoginTextField(ctx: context,controller: userNameController,label: 'نام کاربری')
                    ,
                    SizedBox(height: 10,)
                    ,
                    LoginTextField(ctx: context,controller: passwordController,label: 'رمز عبور',isObscure: true)
                    ,
                    SizedBox(height: 20,)
                    ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 20.0,right: 20.0),
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
                    Consumer<LoginProvider>(
                      builder: (ctx,data,_){
                        return Center(
                          child: Container(
                            width: 230,
                            // margin: EdgeInsets.only(right: 10),
                            child: CheckboxListTile(
                              value: data.getRememberMe,
                              onChanged: (bool? value){
                                loginProvider.setRememberMe = value!;
                              },
                              title: Text('مرا بخاطر بسپار',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        );
                      },
                    )
                    ,
                    SizedBox(height: 10,)
                    ,
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context, FadeRoute(page: ForgetPasswordPage()));

                      },
                      child:Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                      ,
                    )
                    ,
                    SizedBox(height: 30,)
                    ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 20.0,right: 20.0),
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20,)
                ,
                Container(
                  child: Image.asset('assets/images/behsa.png',width: 160,height: 110,fit: BoxFit.contain,),
                )
                ,
                // SizedBox(height: 20,)
                // ,
                // Text('ورود به سامانه وفاداری',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
                // ,
                // SizedBox(height: 20,)
                // ,
                // Divider(height: 2,thickness: 1.5,indent: 50,endIndent: 50,color: context.watch<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),)
                // ,
                // SizedBox(height: 30,)
                // ,
                SizedBox(
                  height: 40,
                ),
                LoginTextField(ctx: context,controller: userNameController,label: 'نام کاربری')
                ,
                SizedBox(height: 10,)
                ,
                LoginTextField(ctx: context,controller: passwordController,label: 'رمز عبور',isObscure: true)
                ,
                SizedBox(height: 20,)
                ,
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: RaisedButton(
                    onPressed: (){
                      loginUser(context);
                      //testApi();
                    },
                    color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                    ),
                    child: Text('ورود',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                  ),
                )
                ,
                SizedBox(height: 10,)
                ,
                Consumer<LoginProvider>(
                  builder: (ctx,data,_){
                    return Center(
                      child: Container(
                        width: 230,
                        // margin: EdgeInsets.only(right: 10),
                        child: CheckboxListTile(
                          value: data.getRememberMe,
                          onChanged: (bool? value){
                            loginProvider.setRememberMe = value!;
                          },
                          title: Text('مرا بخاطر بسپار',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    );
                  },
                )
                ,
                SizedBox(height: 10,)
                ,
                GestureDetector(
                  onTap: (){
                    // Navigator.push(context, FadeRoute(page: ForgetPasswordPage()));

                  },
                  child:Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                  ,
                )
                ,
                SizedBox(height: 30,)
                ,
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  child: RaisedButton(
                    onPressed: (){
                      // loginUser(context);
                      //testApi();
                    },
                    color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.5),
                        side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                    ),
                    child: Text('کاربر جدید هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                  ),
                )
                ,
                SizedBox(height: 30,),
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
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return SafeArea(
          child: Container(
          margin: EdgeInsets.only(top: 50),
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
    margin:
    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 0),
    height: double.maxFinite,
    width: double.maxFinite,
    decoration: BoxDecoration(
    color: Colors.amber.withOpacity(0.1),
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(100),
    topLeft: Radius.circular(100))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 15,
                      margin: EdgeInsets.only(left: 100,right: 100),
                      decoration: BoxDecoration(
                          color: Color(0xffD5A261),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Text(
                        "ورود به سامانه وفاداری", textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD5A261),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  //  SizedBox(height: 20,)
                  //  ,

                    // Container(
                    //   child: Image.asset('assets/images/logo_bpj_login.png',width: 160,height: 110,fit: BoxFit.contain,),
                    // )
                    //,
                    // SizedBox(height: 20,)
                    // ,
                    // Text('ورود به سامانه وفاداری',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
                    // ,
                    // SizedBox(height: 20,)
                    // ,
                    // Divider(height: 2,thickness: 1.5,indent: 50,endIndent: 50,color: context.watch<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),)
                    // ,
                    // SizedBox(height: 30,)
                    // ,
                    SizedBox(
                      height: 30,
                    ),
                    LoginTextField(ctx: context,controller: userNameController,label: 'نام کاربری')
                    ,
                    SizedBox(height: 10,)
                    ,
                    LoginTextField(ctx: context,controller: passwordController,label: 'رمز عبور',isObscure: true)
                    ,
                    SizedBox(height: 10,)
                    ,
                    Consumer<LoginProvider>(
                      builder: (ctx,data,_){
                        return Center(
                          child: Container(
                            width: 230,
                            // margin: EdgeInsets.only(right: 10),
                            child: CheckboxListTile(
                              value: data.getRememberMe,
                              onChanged: (bool? value){
                                loginProvider.setRememberMe = value!;
                              },
                              title: Text('مرا بخاطر بسپار',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        );
                      },
                    )
                    ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 100,right: 100),
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
                      child: Center(
                        child: FlatButton(
                          onPressed: (){
                            loginUser(context);
                            //testApi();
                          },
                          //color: context.watch<ThemeProvider>().getThemeData.primaryColorLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                            ),
                          child: Text('ورود',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                        ),
                      ),
                    )
                    ,
                    SizedBox(height: 10,)
                    ,

                    SizedBox(height: 10,)
                    ,
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context, FadeRoute(page: ForgetPasswordPage()));

                      },
                      child:Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                      ,
                    )
                    ,
                    SizedBox(height: 20,)
                    ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 100,right: 100),
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
                      child: FlatButton(
                        onPressed: (){
                          // loginUser(context);
                          //testApi();
                        },
                        //color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                        ),
                        child: Text('کاربر جدید هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                      ),
                    )
                    ,
                    SizedBox(height: 20,),
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
          ),
          )
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return SafeArea(
          child: Container(
          margin: EdgeInsets.only(top: 50),
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
    margin:
    EdgeInsets.only(top: 30, bottom: 0),
    height: double.maxFinite,
    width: double.maxFinite,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(70),
    topLeft: Radius.circular(70))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /*Container(
                      height: 15,
                      margin: EdgeInsets.only(left: 100,right: 100),
                      decoration: BoxDecoration(
                          color: Color(0xffD5A261),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          )),
                    ),*/
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Text(
                        "ورود به سامانه وفاداری", textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD5A261),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  //  SizedBox(height: 20,)
                  //  ,

                    // Container(
                    //   child: Image.asset('assets/images/logo_bpj_login.png',width: 160,height: 110,fit: BoxFit.contain,),
                    // )
                    //,
                    // SizedBox(height: 20,)
                    // ,
                    // Text('ورود به سامانه وفاداری',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
                    // ,
                    // SizedBox(height: 20,)
                    // ,
                    // Divider(height: 2,thickness: 1.5,indent: 50,endIndent: 50,color: context.watch<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),)
                    // ,
                    // SizedBox(height: 30,)
                    // ,
                    SizedBox(
                      height: 30,
                    ),
                    LoginTextField(ctx: context,controller: userNameController,label: 'نام کاربری')
                    ,
                    SizedBox(height: 10,)
                    ,
                    LoginTextField(ctx: context,controller: passwordController,label: 'رمز عبور',isObscure: true)
                    ,
                    SizedBox(height: 10,)
                    ,
                    Consumer<LoginProvider>(
                      builder: (ctx,data,_){
                        return Center(
                          child: Container(
                            width: 230,
                            // margin: EdgeInsets.only(right: 10),
                            child: CheckboxListTile(
                              value: data.getRememberMe,
                              onChanged: (bool? value){
                                loginProvider.setRememberMe = value!;
                              },
                              title: Text('مرا بخاطر بسپار',textAlign: TextAlign.center,style: TextStyle(color: Color(0xff14319E)),),
                            ),
                          ),
                        );
                      },
                    )
                    ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 100,right: 100),
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
                      child: Center(
                        child: FlatButton(
                          onPressed: (){
                            loginUser(context);
                            //testApi();
                          },
                          //color: context.watch<ThemeProvider>().getThemeData.primaryColorLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                            ),
                          child: Text('ورود',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                        ),
                      ),
                    )
                    ,
                    SizedBox(height: 10,)
                    ,

                    SizedBox(height: 10,)
                    ,
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context, FadeRoute(page: ForgetPasswordPage()));

                      },
                      child:Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                      ,
                    )
                    ,
                    SizedBox(height: 20,)
                    ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 100,right: 100),
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
                      child: FlatButton(
                        onPressed: (){
                          // loginUser(context);
                          //testApi();
                        },
                        //color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            //side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
                        ),
                        child: Text('کاربر جدید هستم',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                      ),
                    )
                    ,
                    SizedBox(height: 20,),
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
          ),
          )
      );

    }
    else{
      print('this is in *else* theme type name: ${ThemeManagerModule.themeManagerModule.getThemeName()}');
      return SafeArea(
        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40,)
              ,
              Container(
                child: Image.asset('assets/images/logo.png',width: 155,height: 93,),
              )
              ,
              SizedBox(height: 40,)
              ,
              Text('ورود به سامانه وفاداری',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
              ,
              SizedBox(height: 20,)
              ,
              Divider(height: 2,thickness: 1.5,indent: 50,endIndent: 50,color: context.watch<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),)
              ,
              SizedBox(height: 30,)
              ,
              LoginTextField(ctx: context,controller: userNameController,label: 'نام کاربری')
              ,
              SizedBox(height: 10,)
              ,
              LoginTextField(ctx: context,controller: passwordController,label: 'رمز عبور',isObscure: true)
              ,
              SizedBox(height: 20,)
              ,
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 100,right: 100),
                child: RaisedButton(
                  onPressed: (){
                    loginUser(context);
                    //testApi();
                  },
                  color: context.watch<ThemeProvider>().getThemeData.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.5),
                      side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.accentColor)
                  ),
                  child: Text('ورود',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.accentColor),),
                ),
              )
              ,
              SizedBox(height: 10,)
              ,
              Consumer<LoginProvider>(
                builder: (ctx,data,_){
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CheckboxListTile(
                      value: data.getRememberMe,
                      onChanged: (bool? value){
                        loginProvider.setRememberMe = value!;
                      },
                      title: Text('مرا بخاطر بسپار',textAlign: TextAlign.right,),
                    ),
                  );
                },
              )
              ,
              SizedBox(height: 10,)
              ,
              Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
              ,
              SizedBox(height: 30,)
              ,
              Consumer<LoginProvider>(
                builder: (ctx,data,_){
                  return Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: data.getUseBiometric ? (){
                            initBiometric(context);
                          } : null,
                          child: Image.asset('assets/images/ic_biometric.png',width: 50,height: 50,fit: BoxFit.fill,color: data.getUseBiometric ? context.read<ThemeProvider>().getThemeData.primaryColor : Colors.grey,colorBlendMode: BlendMode.modulate,),
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
      );
    }

  }

  Widget LoginTextField({required BuildContext ctx,required TextEditingController controller,required String label,bool isObscure=false}){
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
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
                isDense: true,filled: true,fillColor: Colors.white,
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Container(
        margin: EdgeInsets.only(left: 50,top: 7,right: 50,bottom: 7),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: controller,
            obscureText: isObscure,
            style: TextStyle(fontWeight: FontWeight.normal,color: ctx.watch<ThemeProvider>().getThemeData.cardColor,),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                //isDense: true,filled: true,fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
                labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,),
                focusColor: Colors.white70,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColorLight,width: 2)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColorLight,width: 2)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColorLight,width: 2)),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.white70,width: 1))
            ),
          ),
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Container(
        margin: EdgeInsets.only(left: 50,top: 7,right: 50,bottom: 7),

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            controller: controller,
            obscureText: isObscure,
            style: TextStyle(fontWeight: FontWeight.normal,color: ctx.watch<ThemeProvider>().getThemeData.accentColor,),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                //isDense: true,filled: true,fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
                labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,),
                focusColor: Colors.white70,
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.accentColor,width: 2)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.accentColor,width: 2)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.accentColor,width: 2)),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),borderSide: BorderSide(color: Colors.white70,width: 1))
            ),
          ),
        ),
      );

    }
    else{
      return Container(
        margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
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



  // Widget loginTextFieldSkyBlue({BuildContext ctx,TextEditingController controller,String label,bool isObscure=false}){
  //   return Container(
  //     margin: EdgeInsets.only(left: 10,top: 7,right: 10,bottom: 7),
  //     child: Directionality(
  //       textDirection: TextDirection.rtl,
  //       child: TextField(
  //         controller: controller,
  //         obscureText: isObscure,
  //         style: TextStyle(fontWeight: FontWeight.normal),
  //         textAlign: TextAlign.center,
  //         decoration: InputDecoration(
  //             isDense: true,filled: true,fillColor: Colors.white54,
  //             contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
  //             labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,),
  //             border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
  //             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
  //             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
  //             disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
  //         ),
  //       ),
  //     ),
  //   );
  // }


}


