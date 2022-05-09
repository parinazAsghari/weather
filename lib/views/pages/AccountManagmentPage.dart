// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:loyalty_app/utils/ThemeManagerModule.dart';
// import 'package:loyalty_app/views/widgets/BackgroundObjectsWidget.dart';
// import 'package:provider/provider.dart';
//
// class AccountManagementPage extends StatelessWidget {
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
//           title: Text('${AppLocalizations.of(context).getText('AccountManagement_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: BodyContent(context),
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
//           title: Text('${AppLocalizations.of(context).getText('AccountManagement_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian')),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: BodyContent(context),
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
//           title: Text('${AppLocalizations.of(context).getText('AccountManagement_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian',color: context.watch<ThemeProvider>().getThemeData.primaryColorLight)),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_GoldBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: BodyContent(context),
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
//           title: Text('${AppLocalizations.of(context).getText('AccountManagement_txt')}',style: TextStyle(fontSize: 18,fontFamily: 'Iranian',color: context.watch<ThemeProvider>().getThemeData.primaryColorLight)),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_blue.png'),fit: BoxFit.cover)
//           ),
//           child: BodyContent(context),
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
//           title: Text('${AppLocalizations.of(context).getText('AccountManagement_txt')}',style: TextStyle(fontSize: 18, )),
//           automaticallyImplyLeading: true,
//           bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
//           ),
//           child: BodyContent(context),
//         ),
//       );
//
//     }
//   }
//
//
//   Widget BodyContent(BuildContext context){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.4)
//           ),
//           child: BackgroundObjectsComplexWidget(
//             widget: SafeArea(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       SizedBox(height: 20,)
//                       ,
//                       ActionBtn(context,'${AppLocalizations.of(context).getText('Messages_txt')}',(){})
//                       ,
//                       SizedBox(height: 10,)
//                       ,
//                       ActionBtn(context,'${AppLocalizations.of(context).getText('Loan_txt')}',(){})
//                       ,
//                       SizedBox(height: 10,)
//                       ,
//                       ActionBtn(context,'${AppLocalizations.of(context).getText('TransportScore_txt')}',(){})
//                       ,
//                       SizedBox(height: 10,)
//                       ,
//                       ActionBtn(context,'${AppLocalizations.of(context).getText('RankingLog_txt')}',(){})
//
//
//                     ],
//                   ),
//                 )
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 SizedBox(height: 20,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('Messages_txt')}',(){})
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('Loan_txt')}',(){})
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('TransportScore_txt')}',(){})
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('RankingLog_txt')}',(){})
//
//
//               ],
//             ),
//           )
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return SafeArea(
//           child: Container(
//           margin: EdgeInsets.only(top: 10),
//     child: BackdropFilter(
//     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//     child: Container(
//     margin:
//     EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
//     height: double.maxFinite,
//     width: double.maxFinite,
//     //padding: EdgeInsets.only(top: 20.0),
//     decoration: BoxDecoration(
//     color: Colors.amber.withOpacity(0.1),
//     borderRadius: BorderRadius.only(
//     topRight: Radius.circular(100),
//     topLeft: Radius.circular(100))),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Container(
//                     height: 15,
//                     margin: EdgeInsets.only(left: 100,right: 100,bottom: 20.0),
//                     decoration: BoxDecoration(
//                         color: Color(0xffD5A261),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(100),
//                           bottomRight: Radius.circular(100),
//                         )),
//                   ),
//                   SizedBox(height: 20,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('Messages_txt')}',(){})
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('Loan_txt')}',(){})
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('TransportScore_txt')}',(){})
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('RankingLog_txt')}',(){})
//
//
//                 ],
//               ),
//             ),
//           )
//       )
//     )
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return SafeArea(
//           child: Container(
//           margin: EdgeInsets.only(top: 10),
//     child: BackdropFilter(
//     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//     child: Container(
//     margin:
//     EdgeInsets.only(top: 10,  bottom: 0),
//     height: double.maxFinite,
//     width: double.maxFinite,
//     //padding: EdgeInsets.only(top: 20.0),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.only(
//     topRight: Radius.circular(70),
//     topLeft: Radius.circular(70))),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                  /* Container(
//                     height: 15,
//                     margin: EdgeInsets.only(left: 100,right: 100,bottom: 20.0),
//                     decoration: BoxDecoration(
//                         color: Color(0xffD5A261),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(100),
//                           bottomRight: Radius.circular(100),
//                         )),
//                   ),*/
//                   SizedBox(height: 40,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('Messages_txt')}',(){})
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('Loan_txt')}',(){})
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('TransportScore_txt')}',(){})
//                   ,
//                   SizedBox(height: 10,)
//                   ,
//                   ActionBtn(context,'${AppLocalizations.of(context).getText('RankingLog_txt')}',(){})
//
//
//                 ],
//               ),
//             ),
//           )
//       )
//     )
//       );
//
//     }
//     else{
//       return SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 SizedBox(height: 20,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('Messages_txt')}',(){})
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('Loan_txt')}',(){})
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('TransportScore_txt')}',(){})
//                 ,
//                 SizedBox(height: 10,)
//                 ,
//                 ActionBtn(context,'${AppLocalizations.of(context).getText('RankingLog_txt')}',(){})
//
//
//               ],
//             ),
//           )
//       );
//
//     }
//   }
//
//
//   Widget ActionBtn(BuildContext ctx,String title,Function onClick){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return  Container(
//         height: 50,
//         margin: EdgeInsets.only(left: 30,top: 5,right: 30,bottom: 5),
//         child: RaisedButton(
//           onPressed: (){},
//           color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//               side: BorderSide(width: 2,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor)
//           ),
//           child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(Icons.arrow_back_ios_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,)
//                         ],),
//                   ],
//                 ),
//                 Center(child: Text('$title',textAlign: TextAlign.center,style: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor),))]),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return  Container(
//         height: 50,
//         margin: EdgeInsets.only(left: 30,top: 5,right: 30,bottom: 5),
//         child: RaisedButton(
//           onPressed: (){},
//           color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//               side: BorderSide(width: 2,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor)
//           ),
//           child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.arrow_back_ios_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,)
//                       ],),
//                   ],
//                 ),
//                 Center(child: Text('$title',textAlign: TextAlign.center,style: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor),))]),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return  Container(
//         height: 50,
//         margin: EdgeInsets.only(left: 30,top: 5,right: 30,bottom: 5),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 // Colors are easy thanks to Flutter's Colors class.
//                 Color(0xffB38142),
//                 Color(0xffF3C568),
//                 //Color(0xffE8C394),
//                 //Color(0xffDDAD5B),
//                 // Color(0xffC9984F),
//
//               ],
//             )
//         ),
//         child: FlatButton(
//           onPressed: (){},
//          // color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//              // side: BorderSide(width: 2,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor)
//           ),
//           child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.arrow_back_ios_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,)
//                       ],),
//                   ],
//                 ),
//                 Center(child: Text('$title',textAlign: TextAlign.center,style: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor),))]),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return  Container(
//         height: 50,
//         margin: EdgeInsets.only(left: 30,top: 5,right: 30,bottom: 5),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 // Colors are easy thanks to Flutter's Colors class.
//                 Color(0xffB38142),
//                 Color(0xffF3C568),
//                 //Color(0xffE8C394),
//                 //Color(0xffDDAD5B),
//                 // Color(0xffC9984F),
//
//               ],
//             )
//         ),
//         child: FlatButton(
//           onPressed: (){},
//          // color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//              // side: BorderSide(width: 2,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor)
//           ),
//           child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(Icons.arrow_back_ios_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,)
//                       ],),
//                   ],
//                 ),
//                 Center(child: Text('$title',textAlign: TextAlign.center,style: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.primaryColor),))]),
//         ),
//       );
//
//     }
//     else{
//       return  Container(
//         height: 45,
//         margin: EdgeInsets.only(left: 30,top: 5,right: 30,bottom: 5),
//         child: RaisedButton(
//           onPressed: (){},
//           color: ctx.watch<ThemeProvider>().getThemeData.primaryColor,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18.0),
//               side: BorderSide(width: 2,color: ctx.watch<ThemeProvider>().getThemeData.accentColor)
//           ),
//           child: Text('$title',style: TextStyle(color: ctx.watch<ThemeProvider>().getThemeData.accentColor),),
//         ),
//       );
//
//     }
//   }
//
//
// }
