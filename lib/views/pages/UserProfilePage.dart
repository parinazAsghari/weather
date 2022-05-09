// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/providers/UserProfileProvider.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:loyalty_app/utils/CommonUtils.dart';
// import 'package:loyalty_app/utils/ThemeManagerModule.dart';
// import 'package:provider/provider.dart';
//
// class UserProfilePage extends StatelessWidget {
//
//   String memberId,userName;
//   UserProfilePage({this.memberId,this.userName});
//
//
//   UserProfileProvider _profileProvider = UserProfileProvider();
//
//
//   var fullNameController = TextEditingController();
//   var languageController = TextEditingController();
//   var membershipNumberController = TextEditingController();
//   var preferredCommunicationController = TextEditingController();
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
//           title: Text('${AppLocalizations.of(context).getText('UserProfile_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<UserProfileProvider>(
//             create: (ctx){
//               _profileProvider.fetchProfileInfo(memberId);
//               return _profileProvider;
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
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text('${AppLocalizations.of(context).getText('UserProfile_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<UserProfileProvider>(
//             create: (ctx){
//               _profileProvider.fetchProfileInfo(memberId);
//               return _profileProvider;
//             },
//             child: BodyContent(context),
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
//           title: Text('${AppLocalizations.of(context).getText('UserProfile_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_GoldYellowTheme.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<UserProfileProvider>(
//             create: (ctx){
//               _profileProvider.fetchProfileInfo(memberId);
//               return _profileProvider;
//             },
//             child: BodyContent(context),
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
//           title: Text('${AppLocalizations.of(context).getText('UserProfile_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_light_blue.png'),fit: BoxFit.cover)
//           ),
//           child: ChangeNotifierProvider<UserProfileProvider>(
//             create: (ctx){
//               _profileProvider.fetchProfileInfo(memberId);
//               return _profileProvider;
//             },
//             child: BodyContent(context),
//           ),
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
//           title: Text('${AppLocalizations.of(context).getText('UserProfile_txt')}',style: TextStyle(fontSize: 18,)),
//           automaticallyImplyLeading: true,
//           bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//         ),
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
//           ),
//           child: ChangeNotifierProvider<UserProfileProvider>(
//             create: (ctx){
//               _profileProvider.fetchProfileInfo(memberId);
//               return _profileProvider;
//             },
//             child: BodyContent(context),
//           ),
//         ),
//       );
//
//     }
//   }
//
//   Widget BodyContent(BuildContext context){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 20,sigmaY: 20),
//         child: Container(
//
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.4)
//           ),
//           child: SafeArea(
//             child: Consumer<UserProfileProvider>(
//               builder: (ctx,data,_){
//
//                 fullNameController.text = _profileProvider.getProfileInfoModel?.fullName==null || _profileProvider.getProfileInfoModel?.fullName=='' ? '--' : _profileProvider.getProfileInfoModel?.fullName ;
//                 languageController.text = _profileProvider.getProfileInfoModel?.language==null || _profileProvider.getProfileInfoModel?.language=='' ? '--' : _profileProvider.getProfileInfoModel.language;
//                 // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//                 String _text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//                 membershipNumberController.text = replaceFarsiNumber(_text);
//                 // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//                 preferredCommunicationController.text = _profileProvider.getProfileInfoModel?.preferredCommunicationMethod==null || _profileProvider.getProfileInfoModel?.preferredCommunicationMethod=='' ? '--' : _profileProvider.getProfileInfoModel?.preferredCommunicationMethod;
//
//                 if(data.getProfileInfoModel==null){
//                   return Center(child: CircularProgressIndicator(),);
//                 }
//                 else{
//                   return SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         SizedBox(height: 30,)
//                         ,
//                         Container(
//                           margin: EdgeInsets.only(left: 30,right: 30),
//                           padding: EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 16),
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage('assets/images/bg_card.png'),fit: BoxFit.cover
//                               ),
//                               gradient: LinearGradient(
//                                   colors:  [
//                                     context.read<ThemeProvider>().getThemeData.cardColor,
//                                     //Colors.grey.withOpacity(0.4)
//                                     context.read<ThemeProvider>().getThemeData.cardColor,
//                                   ]
//                               ),
//                               borderRadius: BorderRadius.all(Radius.circular(20)),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: context.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),
//                                     spreadRadius: 1,
//                                     blurRadius: 5,
//                                     offset: Offset(0,1)
//                                 )
//                               ]
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: <Widget>[
//                               SizedBox(height: 10,)
//                               ,
//                               Center(
//                                 child: Container(
//                                   width: 80,height: 80,//130
//                                   decoration: BoxDecoration(
//                                     color: context.read<ThemeProvider>().getThemeData.cardColor,
//                                     border: Border.all(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),
//                                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                                   ),
//                                   child: Icon(Icons.person_outline,color: context.read<ThemeProvider>().getThemeData.primaryColor,size: 40,),
//                                 ),
//                               )
//                               ,
//                               SizedBox(height: 20,)
//                               ,
//                               Center(
//                                 child: Text('$userName',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: context.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,),
//                               )
//                               ,
//                               SizedBox(height: 15,)
//                             ],
//                           ),
//                         )
//                         ,
//                         SizedBox(height: 30,)
//                         ,
//                         ProfileTextField(ctx: context,controller: fullNameController,label: '${AppLocalizations.of(context).getText('FullName_txt')}')
//                         ,
//                         SizedBox(height: 10,)
//                         ,
//                         ProfileTextField(ctx: context,controller: languageController,label: '${AppLocalizations.of(context).getText('UserLanguage_txt')}')
//                         ,
//                         SizedBox(height: 15,)
//                         ,
//                         ProfileTextField(ctx: context,controller: membershipNumberController,label: '${AppLocalizations.of(context).getText('MembershipNumber_txt')}')
//                         ,
//                         SizedBox(height: 10,)
//                         ,
//                         ProfileTextField(ctx: context,controller: preferredCommunicationController,label: '${AppLocalizations.of(context).getText('PreferredCommunicationMethod_txt')}')
//                         ,
//                         SizedBox(height: 15,)
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return SafeArea(
//         child: Consumer<UserProfileProvider>(
//           builder: (ctx,data,_){
//
//             fullNameController.text = _profileProvider.getProfileInfoModel?.fullName==null || _profileProvider.getProfileInfoModel?.fullName=='' ? '--' : _profileProvider.getProfileInfoModel?.fullName ;
//             languageController.text = _profileProvider.getProfileInfoModel?.language==null || _profileProvider.getProfileInfoModel?.language=='' ? '--' : _profileProvider.getProfileInfoModel.language;
//             // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             String _text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             membershipNumberController.text = replaceFarsiNumber(_text);
//             // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             preferredCommunicationController.text = _profileProvider.getProfileInfoModel?.preferredCommunicationMethod==null || _profileProvider.getProfileInfoModel?.preferredCommunicationMethod=='' ? '--' : _profileProvider.getProfileInfoModel?.preferredCommunicationMethod;
//
//             if(data.getProfileInfoModel==null){
//               return Center(child: CircularProgressIndicator(),);
//             }
//             else{
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     Container(
//                       margin: EdgeInsets.only(left: 30,right: 30),
//                       padding: EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 16),
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/bg_card.png'),fit: BoxFit.cover
//                           ),
//                           gradient: LinearGradient(
//                               colors:  [
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                                 //Colors.grey.withOpacity(0.4)
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                               ]
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: context.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset: Offset(0,1)
//                             )
//                           ]
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                           SizedBox(height: 10,)
//                           ,
//                           Center(
//                             child: Container(
//                               width: 80,height: 80,//130
//                               decoration: BoxDecoration(
//                                 color: context.read<ThemeProvider>().getThemeData.cardColor,
//                                 border: Border.all(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                               ),
//                               child: Icon(Icons.person_outline,color: context.read<ThemeProvider>().getThemeData.primaryColor,size: 40,),
//                             ),
//                           )
//                           ,
//                           SizedBox(height: 20,)
//                           ,
//                           Center(
//                             child: Text('$userName',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: context.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,),
//                           )
//                           ,
//                           SizedBox(height: 15,)
//                         ],
//                       ),
//                     )
//                     ,
//                     SizedBox(height: 30,)
//                     ,
//                     ProfileTextField(ctx: context,controller: fullNameController,label: '${AppLocalizations.of(context).getText('FullName_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: languageController,label: '${AppLocalizations.of(context).getText('UserLanguage_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                     ,
//                     ProfileTextField(ctx: context,controller: membershipNumberController,label: '${AppLocalizations.of(context).getText('MembershipNumber_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: preferredCommunicationController,label: '${AppLocalizations.of(context).getText('PreferredCommunicationMethod_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return SafeArea(
//         child: Consumer<UserProfileProvider>(
//           builder: (ctx,data,_){
//
//             fullNameController.text = _profileProvider.getProfileInfoModel?.fullName==null || _profileProvider.getProfileInfoModel?.fullName=='' ? '--' : _profileProvider.getProfileInfoModel?.fullName ;
//             languageController.text = _profileProvider.getProfileInfoModel?.language==null || _profileProvider.getProfileInfoModel?.language=='' ? '--' : _profileProvider.getProfileInfoModel.language;
//             // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             String _text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             membershipNumberController.text = replaceFarsiNumber(_text);
//             // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             preferredCommunicationController.text = _profileProvider.getProfileInfoModel?.preferredCommunicationMethod==null || _profileProvider.getProfileInfoModel?.preferredCommunicationMethod=='' ? '--' : _profileProvider.getProfileInfoModel?.preferredCommunicationMethod;
//
//             if(data.getProfileInfoModel==null){
//               return Center(child: CircularProgressIndicator(),);
//             }
//             else{
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     Container(
//                       margin: EdgeInsets.only(left: 30,right: 30),
//                       padding: EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 16),
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/bg_product_white.png'),fit: BoxFit.cover
//                           ),
//                           gradient: LinearGradient(
//                               colors:  [
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                                 //Colors.grey.withOpacity(0.4)
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                               ]
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: context.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset: Offset(0,1)
//                             )
//                           ]
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                           SizedBox(height: 10,)
//                           ,
//                           Center(
//                             child: Container(
//                               width: 80,height: 80,//130
//                               decoration: BoxDecoration(
//                                 color: context.read<ThemeProvider>().getThemeData.cardColor,
//                                 border: Border.all(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                               ),
//                               child: Icon(Icons.person_outline,color: context.read<ThemeProvider>().getThemeData.primaryColor,size: 40,),
//                             ),
//                           )
//                           ,
//                           SizedBox(height: 20,)
//                           ,
//                           Center(
//                             child: Text('$userName',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: context.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,),
//                           )
//                           ,
//                           SizedBox(height: 15,)
//                         ],
//                       ),
//                     )
//                     ,
//                     SizedBox(height: 30,)
//                     ,
//                     ProfileTextField(ctx: context,controller: fullNameController,label: '${AppLocalizations.of(context).getText('FullName_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: languageController,label: '${AppLocalizations.of(context).getText('UserLanguage_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                     ,
//                     ProfileTextField(ctx: context,controller: membershipNumberController,label: '${AppLocalizations.of(context).getText('MembershipNumber_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: preferredCommunicationController,label: '${AppLocalizations.of(context).getText('PreferredCommunicationMethod_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return SafeArea(
//         child: Consumer<UserProfileProvider>(
//           builder: (ctx,data,_){
//
//             fullNameController.text = _profileProvider.getProfileInfoModel?.fullName==null || _profileProvider.getProfileInfoModel?.fullName=='' ? '--' : _profileProvider.getProfileInfoModel?.fullName ;
//             languageController.text = _profileProvider.getProfileInfoModel?.language==null || _profileProvider.getProfileInfoModel?.language=='' ? '--' : _profileProvider.getProfileInfoModel.language;
//             // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             String _text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             membershipNumberController.text = replaceFarsiNumber(_text);
//             // membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             preferredCommunicationController.text = _profileProvider.getProfileInfoModel?.preferredCommunicationMethod==null || _profileProvider.getProfileInfoModel?.preferredCommunicationMethod=='' ? '--' : _profileProvider.getProfileInfoModel?.preferredCommunicationMethod;
//
//             if(data.getProfileInfoModel==null){
//               return Center(child: CircularProgressIndicator(),);
//             }
//             else{
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     Container(
//                       margin: EdgeInsets.only(left: 30,right: 30),
//                       padding: EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 16),
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/bg_product_white.png'),fit: BoxFit.cover
//                           ),
//                           gradient: LinearGradient(
//                               colors:  [
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                                 //Colors.grey.withOpacity(0.4)
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                               ]
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: context.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset: Offset(0,1)
//                             )
//                           ]
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                           SizedBox(height: 10,)
//                           ,
//                           Center(
//                             child: Container(
//                               width: 80,height: 80,//130
//                               decoration: BoxDecoration(
//                                 color: context.read<ThemeProvider>().getThemeData.cardColor,
//                                 border: Border.all(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),
//                                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                               ),
//                               child: Icon(Icons.person_outline,color: context.read<ThemeProvider>().getThemeData.primaryColor,size: 40,),
//                             ),
//                           )
//                           ,
//                           SizedBox(height: 20,)
//                           ,
//                           Center(
//                             child: Text('$userName',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: context.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,),
//                           )
//                           ,
//                           SizedBox(height: 15,)
//                         ],
//                       ),
//                     )
//                     ,
//                     SizedBox(height: 30,)
//                     ,
//                     ProfileTextField(ctx: context,controller: fullNameController,label: '${AppLocalizations.of(context).getText('FullName_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: languageController,label: '${AppLocalizations.of(context).getText('UserLanguage_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                     ,
//                     ProfileTextField(ctx: context,controller: membershipNumberController,label: '${AppLocalizations.of(context).getText('MembershipNumber_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: preferredCommunicationController,label: '${AppLocalizations.of(context).getText('PreferredCommunicationMethod_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       );
//
//     }
//     else{
//       return SafeArea(
//         child: Consumer<UserProfileProvider>(
//           builder: (ctx,data,_){
//
//             fullNameController.text = _profileProvider.getProfileInfoModel?.fullName==null || _profileProvider.getProfileInfoModel?.fullName=='' ? '--' : _profileProvider.getProfileInfoModel?.fullName ;
//             languageController.text = _profileProvider.getProfileInfoModel?.language==null || _profileProvider.getProfileInfoModel?.language=='' ? '--' : _profileProvider.getProfileInfoModel.language;
//             membershipNumberController.text = _profileProvider.getProfileInfoModel?.membershipNumber==null || _profileProvider.getProfileInfoModel?.membershipNumber=='' ? '--' : _profileProvider.getProfileInfoModel?.membershipNumber;
//             preferredCommunicationController.text = _profileProvider.getProfileInfoModel?.preferredCommunicationMethod==null || _profileProvider.getProfileInfoModel?.preferredCommunicationMethod=='' ? '--' : _profileProvider.getProfileInfoModel?.preferredCommunicationMethod;
//
//             if(data.getProfileInfoModel==null){
//               return Center(child: CircularProgressIndicator(),);
//             }
//             else{
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     SizedBox(height: 30,)
//                     ,
//                     Container(
//                       margin: EdgeInsets.only(left: 30,right: 30),
//                       padding: EdgeInsets.only(left: 2.5,top: 2.5,right: 2.5,bottom: 2.5),
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                               colors:  [
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                                 //Colors.grey.withOpacity(0.4)
//                                 context.read<ThemeProvider>().getThemeData.cardColor,
//                               ]
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: context.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.3),
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset: Offset(0,1)
//                             )
//                           ]
//                       ),
//                       child: Container(
//                         padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border: Border.all(color: Colors.black.withOpacity(0.5),width: 1)
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: <Widget>[
//                             SizedBox(height: 10,)
//                             ,
//                             Center(
//                               child: Container(
//                                 width: 80,height: 80,//130
//                                 decoration: BoxDecoration(
//                                   color: context.read<ThemeProvider>().getThemeData.cardColor,
//                                   border: Border.all(color: context.read<ThemeProvider>().getThemeData.accentColor),
//                                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                                 ),
//                                 child: Icon(Icons.person_outline,color: context.read<ThemeProvider>().getThemeData.primaryColor,size: 40,),
//                               ),
//                             )
//                             ,
//                             SizedBox(height: 20,)
//                             ,
//                             Center(
//                               child: Container(
//                                   height: 45,width: 200,alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                       color: context.read<ThemeProvider>().getThemeData.cardColor,
//                                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                                       boxShadow: [
//                                         BoxShadow(
//                                             color: Colors.grey.withOpacity(0.3),
//                                             spreadRadius: 1,
//                                             blurRadius: 5,
//                                             offset: Offset(0,3)
//                                         )
//                                       ]
//                                   ),
//                                   child: Text('$userName',textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: context.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,)
//                               ),
//                             )
//                             ,
//                             SizedBox(height: 15,)
//                           ],
//                         ),
//                       ),
//                     )
//                     ,
//                     SizedBox(height: 30,)
//                     ,
//                     ProfileTextField(ctx: context,controller: fullNameController,label: '${AppLocalizations.of(context).getText('FullName_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: languageController,label: '${AppLocalizations.of(context).getText('UserLanguage_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                     ,
//                     ProfileTextField(ctx: context,controller: membershipNumberController,label: '${AppLocalizations.of(context).getText('MembershipNumber_txt')}')
//                     ,
//                     SizedBox(height: 10,)
//                     ,
//                     ProfileTextField(ctx: context,controller: preferredCommunicationController,label: '${AppLocalizations.of(context).getText('PreferredCommunicationMethod_txt')}')
//                     ,
//                     SizedBox(height: 15,)
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       );
//
//     }
//   }
//
//
//
//   Widget ProfileTextField({BuildContext ctx,TextEditingController controller,String label}){
//     if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
//       return Container(
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                   color: ctx.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.2),
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: Offset(0,5)
//               )
//             ]
//         ),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,readOnly: true,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white.withOpacity(0.5),
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
//       return Container(
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                   color: ctx.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.2),
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: Offset(0,5)
//               )
//             ]
//         ),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,readOnly: true,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
//       return Container(
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                   color: ctx.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.2),
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: Offset(0,5)
//               )
//             ]
//         ),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,readOnly: true,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.grey,width: 0.8))
//             ),
//           ),
//         ),
//       );
//
//     }
//     else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
//       return Container(
//         margin: EdgeInsets.only(left: 30,top: 7,right: 30,bottom: 7),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                   color: ctx.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.2),
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: Offset(0,5)
//               )
//             ]
//         ),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,readOnly: true,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
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
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                   color: ctx.read<ThemeProvider>().getThemeData.primaryColor.withOpacity(0.2),
//                   spreadRadius: 0,
//                   blurRadius: 10,
//                   offset: Offset(0,5)
//               )
//             ]
//         ),
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: TextField(
//             controller: controller,
//             style: TextStyle(fontWeight: FontWeight.normal),
//             textAlign: TextAlign.center,readOnly: true,
//             decoration: InputDecoration(
//                 isDense: true,filled: true,fillColor: Colors.white,
//                 contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),
//                 labelText: label,labelStyle: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,),
//                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
//                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: ctx.read<ThemeProvider>().getThemeData.primaryColor,width: 0.8)),
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
// }
