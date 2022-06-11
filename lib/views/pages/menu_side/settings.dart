import 'package:emdad_khodro_saipa/main.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'تنظیمات',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: _body(),
    );
  }


Widget _body() {
  return Container(
    height: double.maxFinite,
    width: double.maxFinite,

    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

       Padding(
         padding: const EdgeInsets.all(20.0),

         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('تغییر تم',),
                 Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Switch(
                         value: isSwitched,
                         onChanged: (value) {
                           setState(() {
                             print('${isSwitched}');
                             isSwitched = !isSwitched;
                             print('${isSwitched}');


                             MyApp.themeNotifier.value =
                             MyApp.themeNotifier.value == ThemeMode.light
                                 ? ThemeMode.dark
                                 : ThemeMode.light;


                           });
                         },
                       ),
                     ],
                   ),
                 ),

               ],
             ),
           ],
         ),
       ),
        // Image.asset('assets/images/mobile_app_dev.png', height: 150, width: 150,fit: BoxFit.cover,),
        //
        // // SizedBox(
        // //   height: defaultPadding,
        // // ),
        //
        // Text('در حال توسعه ...' ,style: TextStyle(fontSize: 20),),
        //
        // SizedBox(height: defaultPadding,),
        //
        // Text('لطفا نسخه اپلیکیشن را بروز رسانی نمائید')






      ],
    ),
  );
}
}
