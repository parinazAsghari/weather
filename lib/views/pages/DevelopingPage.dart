
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:flutter/material.dart';

class DevelopingPage extends StatelessWidget {
  const DevelopingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Image.asset('assets/images/mobile_app_dev.png', height: 120, width: 120,fit: BoxFit.contain,),

            // SizedBox(
            //   height: defaultPadding,
            // ),

            Text(' ...در حال توسعه ' ,style: TextStyle(fontSize: 20),),

            SizedBox(height: defaultPadding,),

            Text('لطفا نسخه اپلیکیشن را بروز رسانی نمائید')






          ],
        ),
      ),
    );
  }
}
