// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:loyalty_app/providers/LanguageProvider.dart';
// import 'package:loyalty_app/providers/SettingProvider.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/utils/Colors.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:loyalty_app/utils/ThemeManagerModule.dart';
// import 'package:provider/provider.dart';
//
// class SettingPage extends StatefulWidget {
//
//   @override
//   _SettingPageState createState() => _SettingPageState();
// }
//
// class _SettingPageState extends State<SettingPage> {
//
//   SettingProvider _settingProvider = SettingProvider();
//
//   @override
//   void initState() {
//     super.initState();
//     _settingProvider.loadUseBiometric();
//   }
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
//           title: Text('${AppLocalizations.of(context).getText('Setting_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<SettingProvider>(
//             create: (context){
//               return _settingProvider;
//             },
//             child: BodyWidget(context),
//           ),
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
//           title: Text('${AppLocalizations.of(context).getText('Setting_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<SettingProvider>(
//             create: (context){
//               return _settingProvider;
//             },
//             child: BodyWidget(context),
//           ),
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
//           title: Text('${AppLocalizations.of(context).getText('Setting_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_GoldBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<SettingProvider>(
//             create: (context){
//               return _settingProvider;
//             },
//             child: BodyWidget(context),
//           ),
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
//           title: Text('${AppLocalizations.of(context).getText('Setting_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_blue.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<SettingProvider>(
//             create: (context){
//               return _settingProvider;
//             },
//             child: BodyWidget(context),
//           ),
//         ),
//       );
//
//     }
//
//     //else if..
//     else{
//       return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('Setting_txt')}',style: TextStyle(fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
//           ),
//           child: ChangeNotifierProvider<SettingProvider>(
//             create: (context){
//               return _settingProvider;
//             },
//             child: BodyWidget(context),
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
//   Widget BodyWidget(BuildContext context){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.4)
//           ),
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(15),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               blurRadius: 10,
//                               spreadRadius: 1
//                           )
//                         ]
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: Column(
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: ListTile(
//                               leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorLight,),
//                               onTap: (){
//                                 context.read<ThemeProvider>().changeTheme('themeSkyBlue');
//                               },
//                               trailing: Text('آبی آسمانی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                             ),
//                           )
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: ListTile(
//                               leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,),
//                               onTap: (){
//                                 ThemeManagerModule.themeManagerModule.setTheme('themeNavyBlue');
//                                 context.read<ThemeProvider>().changeTheme('themeNavyBlue');
//                                 setState(() {
//
//                                 });
//                               },
//                               trailing: Text('سورمه ای',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                             ),
//                           )
//                           ,
//                           Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: ListTile(
//                               leading: Icon(Icons.palette,color: Color(0xffD5A261)),
//                               onTap: (){
//                                 ThemeManagerModule.themeManagerModule.setTheme('themeGoldBlue');
//                                 context.read<ThemeProvider>().changeTheme('themeGoldBlue');
//                                 setState(() {
//
//                                 });
//                               },
//                               trailing: Text('آبی طلایی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                             ),
//                           )
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: ListTile(
//                               leading: Icon(Icons.palette,color: Color(0xff2457F5)),
//                               onTap: (){
//                                 ThemeManagerModule.themeManagerModule.setTheme('themeWhiteBlue');
//                                 context.read<ThemeProvider>().changeTheme('themeWhiteBlue');
//                               },
//                               trailing: Text('آبی سفید',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                             ),
//                           )
//
//                         ],
//                       ),
//                     ),
//                   )
//                   ,
//                   // SizedBox(height: 20,)
//                   // ,
//                   // Container(
//                   //   margin: EdgeInsets.all(15),
//                   //   padding: EdgeInsets.all(10),
//                   //   decoration: BoxDecoration(
//                   //       color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                   //       borderRadius: BorderRadius.all(Radius.circular(10)),
//                   //       border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                   //       boxShadow: [
//                   //         BoxShadow(
//                   //             color: Colors.grey.withOpacity(0.5),
//                   //             blurRadius: 10,
//                   //             spreadRadius: 1
//                   //         )
//                   //       ]
//                   //   ),
//                   //   child: Material(
//                   //     color: Colors.transparent,
//                   //     child: Column(
//                   //       children: <Widget>[
//                   //         Padding(
//                   //           padding: EdgeInsets.only(left: 15,right: 15),
//                   //           child: ListTile(
//                   //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeA').primaryColor,),
//                   //             onTap: (){
//                   //               context.read<ThemeProvider>().changeTheme('themeA');
//                   //             },
//                   //             trailing: Text('${AppLocalizations.of(context).getText('ThemeA_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                   //           ),
//                   //         )
//                   //         ,
//                   //         SizedBox(height: 3,)
//                   //         ,
//                   //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                   //         ,
//                   //         SizedBox(height: 3,)
//                   //         ,
//                   //         Padding(
//                   //           padding: EdgeInsets.only(left: 15,right: 15),
//                   //           child: ListTile(
//                   //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeB').primaryColor,),
//                   //             onTap: (){
//                   //               context.read<ThemeProvider>().changeTheme('themeB');
//                   //             },
//                   //             trailing: Text('${AppLocalizations.of(context).getText('ThemeB_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                   //           ),
//                   //         )
//                   //         ,
//                   //         SizedBox(height: 3,)
//                   //         ,
//                   //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                   //         ,
//                   //         Padding(
//                   //           padding: EdgeInsets.only(left: 15,right: 15),
//                   //           child: ListTile(
//                   //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeC').primaryColor,),
//                   //             onTap: (){
//                   //               context.read<ThemeProvider>().changeTheme('themeC');
//                   //             },
//                   //             trailing: Text('${AppLocalizations.of(context).getText('ThemeC_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                   //           ),
//                   //         )
//                   //       ],
//                   //     ),
//                   //   ),
//                   // )
//                   // ,
//                   SizedBox(height: 5,)
//                   ,
//                   Container(
//                     margin: EdgeInsets.all(15),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               blurRadius: 10,
//                               spreadRadius: 1
//                           )
//                         ]
//                     ),
//                     child: Consumer<SettingProvider>(
//                       builder: (ctx,data,_){
//                         return Material(
//                           color: Colors.transparent,
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: Directionality(
//                               textDirection: TextDirection.rtl,
//                               child: SwitchListTile(
//                                 contentPadding: EdgeInsets.only(left: 1,right: 15),
//                                 value: data.getUseBiometric,
//                                 onChanged: (bool val){
//                                   _settingProvider.setUseBiometric = val;
//                                   _settingProvider.saveUseBiometric();
//                                 },
//                                 title: Text('${AppLocalizations.of(context).getText('BiometricUsage_txt')}',textAlign: TextAlign.start,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColor)),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                   ,
//                   SizedBox(height: 5,)
//                   ,
//                   Container(
//                     margin: EdgeInsets.all(15),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               blurRadius: 10,
//                               spreadRadius: 1
//                           )
//                         ]
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: Column(
//                         children: <Widget>[
//                           Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: ListTile(
//                               leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                               onTap: (){
//                                 context.read<LanguageProvider>().changeLanguage('fa');
//                               },
//                               trailing: Text('${AppLocalizations.of(context).getText('LanguageFA')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                             ),
//                           )
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                           ,
//                           SizedBox(height: 3,)
//                           ,
//                           Padding(
//                             padding: EdgeInsets.only(left: 15,right: 15),
//                             child: ListTile(
//                               leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                               onTap: (){
//                                 context.read<LanguageProvider>().changeLanguage('en');
//                               },
//                               trailing: Text('${AppLocalizations.of(context).getText('LanguageEN')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                   ,
//                   SizedBox(height: 5,)
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorLight,),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeSkyBlue');
//
//                             context.read<ThemeProvider>().changeTheme('themeSkyBlue');
//                             setState(() {
//                             });
//                           },
//                           trailing: Text('آبی آسمانی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,),
//                           onTap: (){
//                             context.read<ThemeProvider>().changeTheme('themeNavyBlue');
//                           },
//                           trailing: Text('سورمه ای',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: Color(0xffD5A261)),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeGoldBlue');
//                             context.read<ThemeProvider>().changeTheme('themeGoldBlue');
//
//                           },
//                           trailing: Text('آبی طلایی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: Color(0xff2457F5)),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeWhiteBlue');
//                             context.read<ThemeProvider>().changeTheme('themeWhiteBlue');
//                           },
//                           trailing: Text('آبی سفید',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               // SizedBox(height: 20,)
//               // ,
//               // Container(
//               //   margin: EdgeInsets.all(15),
//               //   padding: EdgeInsets.all(10),
//               //   decoration: BoxDecoration(
//               //       color: context.watch<ThemeProvider>().getThemeData.cardColor,
//               //       borderRadius: BorderRadius.all(Radius.circular(10)),
//               //       border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//               //       boxShadow: [
//               //         BoxShadow(
//               //             color: Colors.grey.withOpacity(0.5),
//               //             blurRadius: 10,
//               //             spreadRadius: 1
//               //         )
//               //       ]
//               //   ),
//               //   child: Material(
//               //     color: Colors.transparent,
//               //     child: Column(
//               //       children: <Widget>[
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeA').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeA');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeA_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeB').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeB');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeB_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//               //         ,
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeC').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeC');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeC_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //       ],
//               //     ),
//               //   ),
//               // )
//               // ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Consumer<SettingProvider>(
//                   builder: (ctx,data,_){
//                     return Material(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: Directionality(
//                           textDirection: TextDirection.rtl,
//                           child: SwitchListTile(
//                             contentPadding: EdgeInsets.only(left: 1,right: 15),
//                             value: data.getUseBiometric,
//                             onChanged: (bool val){
//                               _settingProvider.setUseBiometric = val;
//                               _settingProvider.saveUseBiometric();
//                             },
//                             title: Text('${AppLocalizations.of(context).getText('BiometricUsage_txt')}',textAlign: TextAlign.start,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColor)),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('fa');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageFA')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('en');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageEN')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//
//             ],
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,
//                             color: Colors.cyanAccent),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeSkyBlue');
//
//                             context.read<ThemeProvider>().changeTheme('themeSkyBlue');
//                             setState(() {
//                             });
//                           },
//                           trailing: Text('آبی آسمانی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,),
//                           onTap: (){
//                             context.read<ThemeProvider>().changeTheme('themeNavyBlue');
//                           },
//                           trailing: Text('سورمه ای',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorLight,),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeGoldBlue');
//                             context.read<ThemeProvider>().changeTheme('themeGoldBlue');
//                             setState(() {
//
//                             });
//                           },
//                           trailing: Text('آبی طلایی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: Colors.indigoAccent,),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeWhiteBlue');
//                             context.read<ThemeProvider>().changeTheme('themeWhiteBlue');
//                           },
//                           trailing: Text('آبی سفید',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               // SizedBox(height: 20,)
//               // ,
//               // Container(
//               //   margin: EdgeInsets.all(15),
//               //   padding: EdgeInsets.all(10),
//               //   decoration: BoxDecoration(
//               //       color: context.watch<ThemeProvider>().getThemeData.cardColor,
//               //       borderRadius: BorderRadius.all(Radius.circular(10)),
//               //       border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//               //       boxShadow: [
//               //         BoxShadow(
//               //             color: Colors.grey.withOpacity(0.5),
//               //             blurRadius: 10,
//               //             spreadRadius: 1
//               //         )
//               //       ]
//               //   ),
//               //   child: Material(
//               //     color: Colors.transparent,
//               //     child: Column(
//               //       children: <Widget>[
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeA').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeA');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeA_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeB').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeB');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeB_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//               //         ,
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeC').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeC');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeC_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //       ],
//               //     ),
//               //   ),
//               // )
//               // ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Consumer<SettingProvider>(
//                   builder: (ctx,data,_){
//                     return Material(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: Directionality(
//                           textDirection: TextDirection.rtl,
//                           child: SwitchListTile(
//                             contentPadding: EdgeInsets.only(left: 1,right: 15),
//                             value: data.getUseBiometric,
//                             onChanged: (bool val){
//                               _settingProvider.setUseBiometric = val;
//                               _settingProvider.saveUseBiometric();
//                             },
//                             title: Text('${AppLocalizations.of(context).getText('BiometricUsage_txt')}',textAlign: TextAlign.start,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColor)),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('fa');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageFA')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('en');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageEN')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//
//             ],
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,
//                             color: Colors.cyanAccent),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeSkyBlue');
//
//                             context.read<ThemeProvider>().changeTheme('themeSkyBlue');
//                             setState(() {
//                             });
//                           },
//                           trailing: Text('آبی آسمانی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
//                           onTap: (){
//                             context.read<ThemeProvider>().changeTheme('themeNavyBlue');
//                           },
//                           trailing: Text('سورمه ای',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeGoldBlue');
//                             context.read<ThemeProvider>().changeTheme('themeGoldBlue');
//                             setState(() {
//
//                             });
//                           },
//                           trailing: Text('آبی طلایی',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,),
//                           onTap: (){
//                             ThemeManagerModule.themeManagerModule.setTheme('themeWhiteBlue');
//                             context.read<ThemeProvider>().changeTheme('themeWhiteBlue');
//                           },
//                           trailing: Text('آبی سفید',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               // SizedBox(height: 20,)
//               // ,
//               // Container(
//               //   margin: EdgeInsets.all(15),
//               //   padding: EdgeInsets.all(10),
//               //   decoration: BoxDecoration(
//               //       color: context.watch<ThemeProvider>().getThemeData.cardColor,
//               //       borderRadius: BorderRadius.all(Radius.circular(10)),
//               //       border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//               //       boxShadow: [
//               //         BoxShadow(
//               //             color: Colors.grey.withOpacity(0.5),
//               //             blurRadius: 10,
//               //             spreadRadius: 1
//               //         )
//               //       ]
//               //   ),
//               //   child: Material(
//               //     color: Colors.transparent,
//               //     child: Column(
//               //       children: <Widget>[
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeA').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeA');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeA_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeB').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeB');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeB_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //         ,
//               //         SizedBox(height: 3,)
//               //         ,
//               //         Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//               //         ,
//               //         Padding(
//               //           padding: EdgeInsets.only(left: 15,right: 15),
//               //           child: ListTile(
//               //             leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeC').primaryColor,),
//               //             onTap: (){
//               //               context.read<ThemeProvider>().changeTheme('themeC');
//               //             },
//               //             trailing: Text('${AppLocalizations.of(context).getText('ThemeC_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//               //           ),
//               //         )
//               //       ],
//               //     ),
//               //   ),
//               // )
//               // ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Consumer<SettingProvider>(
//                   builder: (ctx,data,_){
//                     return Material(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: Directionality(
//                           textDirection: TextDirection.rtl,
//                           child: SwitchListTile(
//                             contentPadding: EdgeInsets.only(left: 1,right: 15),
//                             value: data.getUseBiometric,
//                             onChanged: (bool val){
//                               _settingProvider.setUseBiometric = val;
//                               _settingProvider.saveUseBiometric();
//                             },
//                             title: Text('${AppLocalizations.of(context).getText('BiometricUsage_txt')}',textAlign: TextAlign.start,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColor)),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.accentColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('fa');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageFA')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('en');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageEN')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//
//             ],
//           ),
//         ),
//       );
//
//     }
//
//     else{
//       return SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(height: 20,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeA').primaryColor,),
//                           onTap: (){
//                             context.read<ThemeProvider>().changeTheme('themeA');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('ThemeA_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeB').primaryColor,),
//                           onTap: (){
//                             context.read<ThemeProvider>().changeTheme('themeB');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('ThemeB_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.palette,color: ThemeManagerModule.themeManagerModule.getThemeByName('themeC').primaryColor,),
//                           onTap: (){
//                             context.read<ThemeProvider>().changeTheme('themeC');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('ThemeC_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Consumer<SettingProvider>(
//                   builder: (ctx,data,_){
//                     return Material(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: Directionality(
//                           textDirection: TextDirection.rtl,
//                           child: SwitchListTile(
//                             contentPadding: EdgeInsets.only(left: 1,right: 15),
//                             value: data.getUseBiometric,
//                             onChanged: (bool val){
//                               _settingProvider.setUseBiometric = val;
//                               _settingProvider.saveUseBiometric();
//                             },
//                             title: Text('${AppLocalizations.of(context).getText('BiometricUsage_txt')}',textAlign: TextAlign.start,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColor)),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//               ,
//               Container(
//                 margin: EdgeInsets.all(15),
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     border: Border.all(color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 1
//                       )
//                     ]
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('fa');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageFA')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
//                       ,
//                       SizedBox(height: 3,)
//                       ,
//                       Padding(
//                         padding: EdgeInsets.only(left: 15,right: 15),
//                         child: ListTile(
//                           leading: Icon(Icons.language,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
//                           onTap: (){
//                             context.read<LanguageProvider>().changeLanguage('en');
//                           },
//                           trailing: Text('${AppLocalizations.of(context).getText('LanguageEN')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//               ,
//               SizedBox(height: 5,)
//
//             ],
//           ),
//         ),
//       );
//
//     }
//   }
//
//
// }
