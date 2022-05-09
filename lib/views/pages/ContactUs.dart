// import 'package:flutter/material.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ContactsUs extends StatelessWidget {
//
//   void makeDialPhone(){
//     launch(('tel://02144493907'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text('${AppLocalizations.of(context).getText('ContactUs_txt')}',style: TextStyle(fontSize: 18,),),
//         automaticallyImplyLeading: true,
//         bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//             image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 SizedBox(height: 40,)
//                 ,
//                 Container(
//                   height: 80,
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.only(left: 30,top: 15,right: 30,bottom: 15),
//                   decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     border: Border.all(width: 1,color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Flexible(child: Text('${AppLocalizations.of(context).getText('BehpardazMail_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color : context.watch<ThemeProvider>().getThemeData.primaryColor),)),
//                       Flexible(child: Icon(Icons.mail,color: context.watch<ThemeProvider>().getThemeData.primaryColor,size: 50,))
//                     ],
//                   ),
//                 )
//                 ,
//                 SizedBox(height: 40,)
//                 ,
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.only(left: 30,top: 15,right: 30,bottom: 15),
//                   decoration: BoxDecoration(
//                     color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                     border: Border.all(width: 1,color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Flexible(child: Text('${AppLocalizations.of(context).getText('BehpardazAddress_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color : context.watch<ThemeProvider>().getThemeData.primaryColor),)),
//                       Flexible(child: Icon(Icons.location_city,color: context.watch<ThemeProvider>().getThemeData.primaryColor,size: 50,))
//                     ],
//                   ),
//                 )
//                 ,
//                 SizedBox(height: 40,)
//                 ,
//                 Container(
//                   height: 80,
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1,color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     child: Material(
//                       color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                       child: InkWell(
//                         onTap: (){
//                           makeDialPhone();
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 30,top: 15,right: 30,bottom: 15),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Flexible(child: Text('${AppLocalizations.of(context).getText('BehpardazPhone_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color : context.watch<ThemeProvider>().getThemeData.primaryColor),)),
//                               Flexible(child: Icon(Icons.phone,color: context.watch<ThemeProvider>().getThemeData.primaryColor,size: 50,))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
