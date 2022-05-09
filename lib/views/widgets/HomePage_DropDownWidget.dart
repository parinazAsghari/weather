// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:emdad_khodro_saipa/providers/HomeProvider.dart';
// import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';
// import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';
// import 'package:emdad_khodro_saipa/models/MemberInfoModel.dart' as Member_Info;
//
//
// class HomePageDropDownWidget extends StatelessWidget{
//   List<Member_Info.Result> programList;
//   HomePageDropDownWidget({this.programList});
//
//
//   HomeProvider _homeProvider = HomeProvider();
//   String selectedProgramName,selectedMemberId,selectedProgramId;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Directionality(
//           textDirection: TextDirection.rtl,
//           child: ExpandableNotifier(
//
//             child: Padding(
//               padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//               child: ScrollOnExpand(
//
//                 child: Container(
//                   // padding: EdgeInsets.only(top: 12),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor
//                   ),
//
//                   child: Column(
//                     children: [
//                       Expandable(
//                         collapsed:Column(
//                           // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: <Widget>[
//                             Padding(
//                               padding:  EdgeInsets.zero,
//                               child: Builder(
//                                 builder: (context){
//                                   var controller = ExpandableController.of(context);
//                                   return Padding(
//                                     padding: EdgeInsets.zero,
//                                     child: InkWell(
//                                       onTap: (){
//                                         controller.toggle();
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                           color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
//                                           borderRadius: BorderRadius.circular(20),
//                                           border: Border.all(width: 2, color: Colors.white)
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             Text('${programList[0].programName}',style: TextStyle(fontSize: 14),),
//                                             Icon(Icons.keyboard_arrow_down_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,)
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//
//                               ),
//                             )
//
//                           ],
//                         ),
//                         expanded: Column(
//                           // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: <Widget>[
//                             Padding(
//                               padding:  EdgeInsets.zero,
//                               child: Builder(
//                                 builder: (context){
//                                   var controller = ExpandableController.of(context);
//                                   return Padding(
//                                     padding: EdgeInsets.zero,
//                                     child: InkWell(
//                                       onTap: (){
//                                         controller.toggle();
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                             color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
//                                             borderRadius: BorderRadius.circular(20),
//                                             border: Border.all(width: 2, color: Colors.white)
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text('Program Name'),
//                                             Icon(Icons.account_balance)
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//
//                               ),
//                             ),
//
//
//                             Material(
//                               borderRadius: BorderRadius.all(Radius.circular(16)),
//                               child: ListView.separated(
//                                   itemCount: programList.length,shrinkWrap: true,
//                                   padding: EdgeInsets.all(5),
//                                   itemBuilder: (ctx,index){
//                                     return ListTile(
//                                       onTap: (){
//                                         _homeProvider.setProgramName = programList[index].programName;
//                                         selectedMemberId = programList[index].memberId;
//                                         selectedProgramId = programList[index].programId;
//                                         selectedProgramName = programList[index].programName;
//
//
//                                       },
//                                       trailing: Text(replaceFarsiNumber('${index+1}')),
//                                       title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
//                                     );
//                                   },
//                                   separatorBuilder: (ctx,index){
//                                     return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
//                                   }
//                               ),
//                             ),
//
//
//
//
//                             SizedBox(height: 8,),
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Builder(
//                                 builder: (context){
//                                   var controller = ExpandableController.of(context);
//                                   return Padding(
//                                     padding: EdgeInsets.zero,
//                                     child: InkWell(
//                                       onTap: (){
//                                         controller.toggle();
//                                       },
//                                       child: Icon(Icons.menu_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
//                                     ),
//                                   );
//                                   // IconButton(
//                                   //   onPressed: (){
//                                   //     controller.toggle();
//                                   //   },
//                                   //   icon: Icon(Icons.menu_rounded),
//                                   // )
//                                 },
//
//                               ),
//                             ),
//
//
//
//
//
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                   ,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//
//   }
// }