// import 'package:emdad_khodro_saipa/enumorations.dart';
// import 'package:flutter/material.dart';
//
//
// class CustomAppBar extends StatelessWidget {
//   String? title;
//   AppBarType? appBarType;
//
//
//   CustomAppBar({
//     this.title,
//     this.appBarType,
//     Key? key,
//   }) : super(key: key);
//
//   void _onImediateEmdadButtonTap() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return MessageDialogWidget(
//             body: 'نیاز به امداد ضروری دارید؟',
//             dismissable: true,
//             positiveTxt: 'بله',
//             positiveFunc: () async {
//               // showDialog(context: context, builder: (BuildContext context){
//               //   return CircleLoadingWidget(
//               //     dismissable: false,
//               //     msgTxt: 'در حال ثبت درخواست',
//               //   );
//               // });
//               // // await Future.delayed(Duration(seconds: 3));
//               // // Navigator.of(context).pop();
//               sendUrgentRequest();
//             },
//           );
//         });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Image.asset(
//           appBarType == AppBarType.primaryDark?
//           'assets/images/emdad_khodro_logo_white_text.png'
//           :
//           'assets/images/emdad_khodro_logo.png'
//           ,
//           width: MediaQuery.of(context).size.width * 0.45,
//           fit: BoxFit.contain,
//         ),
//         actions: [
//           InkWell(
//             onTap: () {
//               _onImediateEmdadButtonTap();
//             },
//             child: Container(
//                 margin: EdgeInsets.only(left: defaultPadding),
//                 height: 30,
//                 width: 30,
//                 padding: EdgeInsets.all(defaultPadding / 2),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Theme.of(context).accentColor),
//                 child: Image.asset(
//                   'assets/images/alert.png',
//                 )),
//           )
//         ],
//       )
//
//     );
//   }
// }
