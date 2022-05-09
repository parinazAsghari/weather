// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/repository/MemberRepository.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:loyalty_app/utils/SharedPrefsUtil.dart';
// import 'package:loyalty_app/utils/ThemeManagerModule.dart';
// import 'package:loyalty_app/views/widgets/BackgroundObjectsWidget.dart';
// import 'package:loyalty_app/views/widgets/DialogWidgets.dart';
// import 'package:loyalty_app/views/widgets/LoadingWidgets.dart';
// import 'package:provider/provider.dart';
//
// class ChangePasswordPage extends StatelessWidget {
//
//   String userName;
//   ChangePasswordPage(this.userName);
//
//
//   var passwordOldController = TextEditingController();
//   var passwordNewController = TextEditingController();
//   var passwordConfirmController = TextEditingController();
//
//
//
//   void changePassword(BuildContext context)async{
//
//     if(passwordOldController.text.isEmpty||passwordNewController.text.isEmpty||passwordConfirmController.text.isEmpty){
//       showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'لطفا فیلد ها را پر کنید',dismissable: true,positiveTxt: 'باشه',)
//       );
//       return;
//     }
//
//     if(passwordNewController.text!=passwordConfirmController.text){
//       showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'رمز عبور های جدید یکسان نمی باشند',dismissable: true,positiveTxt: 'باشه',)
//       );
//       return;
//     }
//
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (ctx)=> CircleLoadingWidget(msgTxt: 'لطفا منتظر بمانید',)
//     );
//
//     String oldPass = await SharedPrefsUtil.prefsInstance.loadStringFromPref('PassWord') ?? '---';
//     if(oldPass!=passwordOldController.text){
//       Navigator.of(context,rootNavigator: true).pop();
//       showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'رمز عبور قدیمی صحیح نمیباشد',dismissable: true,positiveTxt: 'باشه',)
//       );
//       return;
//     }
//
//
//     bool isChange = await MemberRepository().callChangePassword(userName,passwordOldController.text,passwordNewController.text);
//
//     Navigator.of(context,rootNavigator: true).pop();
//     if(isChange){
//       await SharedPrefsUtil.prefsInstance.saveStringToPrefs('PassWord', passwordNewController.text);
//       showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (ctx)=> MessageDialogWidget(title: 'پیغام',body: 'رمز عبور با موفقیت تغییر یافت',dismissable: false,positiveTxt: 'باشه',positiveFunc: (){Navigator.pop(context);},)
//       );
//     }
//     else{
//       showDialog(
//           context: context,
//           barrierDismissible: true,
//           builder: (ctx)=> MessageDialogWidget(title: 'خطا',body: 'عملیات ناموفق',dismissable: false,positiveTxt: 'باشه',)
//       );
//     }
//
//
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('ChangePassword_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: bodyContent(context),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('ChangePassword_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: bodyContent(context),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('ChangePassword_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_GoldYellowTheme.png'),fit: BoxFit.cover)
//           ),
//           child: bodyContent(context),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('ChangePassword_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_light_blue.png'),fit: BoxFit.cover)
//           ),
//           child: bodyContent(context),
//         ),
//       );
//
//     }
//     else{
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('ChangePassword_txt')}',style: TextStyle(fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
//           ),
//           child: bodyContent(context),
//         ),
//       );
//
//     }
//   }
//
//
//   Widget bodyContent(BuildContext context){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
//         child: Container(
//
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.4)
//           ),
//           child: BackgroundObjectsComplexWidget(
//             widget: SafeArea (
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: <Widget>[
//                           SizedBox(height: 30,)
//                           ,
//                           textField(ctx: context,controller: passwordOldController,label: 'رمز عبور قدیمی',isObscure: true)
//                           ,
//                           SizedBox(height: 10,)
//                           ,
//                           textField(ctx: context,controller: passwordNewController,label: 'رمز عبور جدید',isObscure: true)
//                           ,
//                           SizedBox(height: 20,)
//                           ,
//                           textField(ctx: context,controller: passwordConfirmController,label: 'تکرار رمز عبور جدید',isObscure: true)
//                         ],
//                       ),
//                     ),
//                   )
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   Container(
//                     height: 50,
//                     margin: EdgeInsets.only(left: 20,right: 20),
//                     child: RaisedButton(
//                       onPressed: (){
//                         changePassword(context);
//                       },
//                       color: context.watch<ThemeProvider>().getThemeData.accentColor,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                       ),
//                       child: Text('ثبت تغییرات',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                     ),
//                   )
//                   ,
//                   SizedBox(height: 10,)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return SafeArea (
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     textField(ctx: context,controller: passwordOldController,label: 'رمز عبور قدیمی',isObscure: true)
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     textField(ctx: context,controller: passwordNewController,label: 'رمز عبور جدید',isObscure: true)
//                     ,
//                     SizedBox(height: 20,)
//                     ,
//                     textField(ctx: context,controller: passwordConfirmController,label: 'تکرار رمز عبور جدید',isObscure: true)
//                   ],
//                 ),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//             ,
//             Container(
//               height: 50,
//               margin: EdgeInsets.only(left: 20,right: 20),
//               child: RaisedButton(
//                 onPressed: (){
//                   changePassword(context);
//                 },
//                 color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                 ),
//                 child: Text('ثبت تغییرات',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//           ],
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return SafeArea (
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     textField(ctx: context,controller: passwordOldController,label: 'رمز عبور قدیمی',isObscure: true)
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     textField(ctx: context,controller: passwordNewController,label: 'رمز عبور جدید',isObscure: true)
//                     ,
//                     SizedBox(height: 20,)
//                     ,
//                     textField(ctx: context,controller: passwordConfirmController,label: 'تکرار رمز عبور جدید',isObscure: true)
//                   ],
//                 ),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//             ,
//             Container(
//               height: 50,
//               margin: EdgeInsets.only(left: 100,right: 100),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       // Colors are easy thanks to Flutter's Colors class.
//                       Color(0xffB38142),
//                       Color(0xffF3C568),
//                       //Color(0xffE8C394),
//                       //Color(0xffDDAD5B),
//                       // Color(0xffC9984F),
//
//                     ],
//                   )
//               ),
//               child: FlatButton(
//                 onPressed: (){
//                   changePassword(context);
//                 },
//                 //color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     //side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                 ),
//                 child: Text('ثبت تغییرات',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//           ],
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return SafeArea (
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     textField(ctx: context,controller: passwordOldController,label: 'رمز عبور قدیمی',isObscure: true)
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     textField(ctx: context,controller: passwordNewController,label: 'رمز عبور جدید',isObscure: true)
//                     ,
//                     SizedBox(height: 20,)
//                     ,
//                     textField(ctx: context,controller: passwordConfirmController,label: 'تکرار رمز عبور جدید',isObscure: true)
//                   ],
//                 ),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//             ,
//             Container(
//               height: 50,
//               margin: EdgeInsets.only(left: 100,right: 100),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       // Colors are easy thanks to Flutter's Colors class.
//                       Color(0xffB38142),
//                       Color(0xffF3C568),
//                       //Color(0xffE8C394),
//                       //Color(0xffDDAD5B),
//                       // Color(0xffC9984F),
//
//                     ],
//                   )
//               ),
//               child: FlatButton(
//                 onPressed: (){
//                   changePassword(context);
//                 },
//                 //color: context.watch<ThemeProvider>().getThemeData.primaryColorDark,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     //side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)
//                 ),
//                 child: Text('ثبت تغییرات',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//           ],
//         ),
//       );
//
//     }
//     else{
//       return SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     textField(ctx: context,controller: passwordOldController,label: 'رمز عبور قدیمی',isObscure: true)
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     textField(ctx: context,controller: passwordNewController,label: 'رمز عبور جدید',isObscure: true)
//                     ,
//                     SizedBox(height: 20,)
//                     ,
//                     textField(ctx: context,controller: passwordConfirmController,label: 'تکرار رمز عبور جدید',isObscure: true)
//                   ],
//                 ),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//             ,
//             Container(
//               height: 45,
//               margin: EdgeInsets.only(left: 20,right: 20),
//               child: RaisedButton(
//                 onPressed: (){
//                   changePassword(context);
//                 },
//                 color: context.watch<ThemeProvider>().getThemeData.primaryColor,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     side: BorderSide(width: 3,color: context.watch<ThemeProvider>().getThemeData.accentColor)
//                 ),
//                 child: Text('ثبت تغییرات',style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.accentColor),),
//               ),
//             )
//             ,
//             SizedBox(height: 10,)
//           ],
//         ),
//       );
//
//     }
//   }
//
//
//   Widget textField({BuildContext ctx,TextEditingController controller,String label,bool isObscure=false}){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return Container(
//
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             obscureText: isObscure,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white.withOpacity(0.5),
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
//
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             obscureText: isObscure,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white.withOpacity(0.5),
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
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return Container(
//
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
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
//                 labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.secondaryHeaderColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.white,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return Container(
//
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
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
//                 labelText: label,labelStyle: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.secondaryHeaderColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.watch<ThemeProvider>().getThemeData.cardColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.white,width: 0.8))
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
//
//
//
// }
