//
// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:loyalty_app/providers/LoginProvider.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/repository/MemberRepository.dart';
// import 'package:loyalty_app/repository/UserRepository.dart';
// import 'package:loyalty_app/utils/CommonUtils.dart';
// import 'package:loyalty_app/utils/Consts.dart';
// import 'package:loyalty_app/utils/NetworkModule.dart';
// import 'package:loyalty_app/utils/ThemeManagerModule.dart';
// import 'package:loyalty_app/views/pages/HomePage.dart';
// import 'package:loyalty_app/views/widgets/DialogWidgets.dart';
// import 'package:loyalty_app/views/widgets/LoadingWidgets.dart';
// import 'package:provider/provider.dart';
//
// class ForgetPasswordPage extends StatefulWidget{
//
//
//   @override
//   _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
// }
//
// class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
//
//   // LoginProvider loginProvider = LoginProvider();
//   // var userNameController = TextEditingController();
//   // var passwordController = TextEditingController();
//   var emailController = TextEditingController();
//
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         body: Container(
//           // width: MediaQuery.of(context).size.width,
//           width: double.maxFinite,
//           // height: MediaQuery.of(context).size.height,
//           height: double.maxFinite,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<LoginProvider>(
//             create: (ctx){
//               // return loginProvider;
//             },
//             child: BodyContent(context),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         body: Container(
//           // width: MediaQuery.of(context).size.width,
//           width: double.maxFinite,
//           // height: MediaQuery.of(context).size.height,
//           height: double.maxFinite,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<LoginProvider>(
//             create: (ctx){
//               // return loginProvider;
//             },
//             child: BodyContent(context),
//           ),
//         ),
//       );
//
//     }
//   }
//
//   /*
//
//    */
//
//   Widget BodyContent(BuildContext context){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return SafeArea(
//           child:  BackdropFilter(filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(12.0)
//                 ),
//                 margin: EdgeInsets.only(right: 24.0, left: 24.0, top: 40.0, bottom: 24.0),
//
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       SizedBox(height: 20,)
//                       ,
//                       Container(
//                         child: Image.asset('assets/images/logo_bpj_login.png',width: 160,height: 110,fit: BoxFit.contain,),
//                       )
//                       ,
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),)
//                       ,
//                       SizedBox(
//                         height: 30,
//                       ),
//                       LoginTextField(ctx: context,controller: emailController,label: 'ایمیل')
//                       ,
//                       SizedBox(height: 10,)
//                       ,
//
//                       SizedBox(height: 30,)
//                       ,
//                       Container(
//                         height: 40,
//                         margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                         child: RaisedButton(
//                           onPressed: (){
//                             // loginUser(context);
//                             //testApi();
//                           },
//                           color: context.watch<ThemeProvider>().getThemeData.accentColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.5),
//                               side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                           ),
//                           child: Text('بازیابی رمز عبور',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 30,),
//
//                     ],
//                   ),
//                 ),
//               )
//           )
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return SafeArea(
//           child:  SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 SizedBox(height: 20,)
//                 ,
//                 Container(
//                   child: Image.asset('assets/images/logo_bpj_login.png',width: 160,height: 110,fit: BoxFit.contain,),
//                 )
//                 ,
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),)
//                 ,
//                 SizedBox(
//                   height: 30,
//                 ),
//                 LoginTextField(ctx: context,controller: emailController,label: 'ایمیل')
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//
//                 SizedBox(height: 30,)
//                 ,
//                 Container(
//                   height: 40,
//                   margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                   child: RaisedButton(
//                     onPressed: (){
//                       // loginUser(context);
//                       //testApi();
//                     },
//                     color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.5),
//                         side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                     ),
//                     child: Text('بازیابی رمز عبور',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
//                   ),
//                 )
//                 ,
//                 SizedBox(height: 30,),
//
//               ],
//             ),
//           )
//       );
//
//     }
//     else{
//       print('this is in *else* theme type name: ${ThemeManagerModule.themeManagerModule.getThemeName()}');
//       return SafeArea(
//           child:  BackdropFilter(filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(12.0)
//                 ),
//                 margin: EdgeInsets.only(right: 12.0, left: 12.0, top: 40.0, bottom: 24.0),
//
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       SizedBox(height: 20,)
//                       ,
//                       Container(
//                         child: Image.asset('assets/images/logo_bpj_login.png',width: 160,height: 110,fit: BoxFit.contain,),
//                       )
//                       ,
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text('رمز عبور خود را فراموش کرده اید؟',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),)
//                       ,
//                       SizedBox(
//                         height: 30,
//                       ),
//                       LoginTextField(ctx: context,controller: emailController,label: 'ایمیل')
//                       ,
//                       SizedBox(height: 10,)
//                       ,
//
//                       SizedBox(height: 30,)
//                       ,
//                       Container(
//                         height: 40,
//                         margin: EdgeInsets.only(left: 20.0,right: 20.0),
//                         child: RaisedButton(
//                           onPressed: (){
//                             // loginUser(context);
//                             //testApi();
//                           },
//                           color: context.watch<ThemeProvider>().getThemeData.accentColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.5),
//                               side: BorderSide(width: 2,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                           ),
//                           child: Text('بازیابی رمز عبور',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 30,),
//
//                     ],
//                   ),
//                 ),
//               )
//           )
//       );
//     }
//
//   }
//
//   Widget LoginTextField({BuildContext ctx,TextEditingController controller,String label,bool isObscure=false}){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return Container(
//         margin: EdgeInsets.only(left: 10,top: 7,right: 10,bottom: 7),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             obscureText: isObscure,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white54,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return Container(
//         margin: EdgeInsets.only(left: 20,top: 7,right: 20,bottom: 7),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             obscureText: isObscure,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//     else{
//       return Container(
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             obscureText: isObscure,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white54,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//   }
//
//
//
//   // Widget loginTextFieldSkyBlue({BuildContext ctx,TextEditingController controller,String label,bool isObscure=false}){
//   //   return Container(
//   //     margin: EdgeInsets.only(left: 10,top: 7,right: 10,bottom: 7),
//   //     child: Directionality(
//   //       textDirection: TextDirection.rtl,
//   //       child: TextField(
//   //         controller: controller,
//   //         obscureText: isObscure,
//   //         style: TextStyle(fontWeight: FontWeight.normal),
//   //         textAlign: TextAlign.center,
//   //         decoration: InputDecoration(
//   //             isDense: true,filled: true,fillColor: Colors.white54,
//   //             contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//   //             labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,),
//   //             border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//   //             enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//   //             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//   //             disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//
// }
//
//
