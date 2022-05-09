//
// import 'package:flutter/material.dart';
// import 'package:loyalty_app/models/UserIPModel.dart';
// import 'package:loyalty_app/providers/UserIPProvider.dart';
// import 'package:loyalty_app/utils/AppLocalizationModule.dart';
// import 'package:provider/provider.dart';
//
// class UserIPPage extends StatelessWidget {
//   UserIPProvider up = UserIPProvider();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('${AppLocalizations.of(context).getText('Profile_txt')}'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           up.onRefresh();
//         },
//         child: Icon(Icons.refresh),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: ChangeNotifierProvider<UserIPProvider>(
//           create: (_){
//             //UserProvider up = UserProvider();
//             up.fetchUserIp();
//             return up;
//           },
//           child:  BodyWidget(context),
//         ),
//       ),
//     );
//   }
//
//
//   Widget BodyWidget(BuildContext context) {
//
//     return Consumer<UserIPProvider>(
//       builder: (context,data,_){
//         if(data.getUserIPModel==null){
//           return Center(child: CircularProgressIndicator());
//         }
//         else {
//           return  Center (
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 30,)
//                 ,
//                 Text('Country : ${data.getUserIPModel.country}')
//                 ,
//                 SizedBox(height: 20,)
//                 ,
//                 Text('Ip : ${data.getUserIPModel.ip}')
//               ],
//             ),
//           );
//         }
//       },
//     );
//
//   }
//
//
//
//
// }
