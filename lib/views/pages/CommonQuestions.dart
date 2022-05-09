// import 'package:flutter/material.dart';
// import 'package:loyalty_app/providers/ThemeProvider.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:provider/provider.dart';
//
// class CommonQuestions extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text('${AppLocalizations.of(context).getText('CommonQuestions_txt')}',style: TextStyle(fontSize: 18,),),
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
//             child: Container(
//               margin: EdgeInsets.all(15),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: context.watch<ThemeProvider>().getThemeData.cardColor,
//                   border: Border.all(width: 1,color: context.watch<ThemeProvider>().getThemeData.primaryColor),
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 10
//                     )
//                   ]
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Text('${AppLocalizations.of(context).getText('CommonQuestionTitle_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color : context.watch<ThemeProvider>().getThemeData.primaryColor),),
//                   SizedBox(height: 30,),
//                   Text('${AppLocalizations.of(context).getText('CommonQuestion1_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
//                   SizedBox(height: 30,),
//                   Text('${AppLocalizations.of(context).getText('CommonQuestion2_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
//                   SizedBox(height: 30,),
//                   Text('${AppLocalizations.of(context).getText('CommonQuestion3_txt')}',textDirection: TextDirection.rtl,textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
//                   SizedBox(height: 30,),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
