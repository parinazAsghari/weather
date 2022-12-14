import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'قوانین و مقررات',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset('assets/images/mobile_app_dev.png', height: 150, width: 150,fit: BoxFit.cover,),

          // SizedBox(
          //   height: defaultPadding,
          // ),

          Text('در حال توسعه ...' ,style: TextStyle(fontSize: 20),),

          SizedBox(height: defaultPadding,),

          Text('لطفا نسخه اپلیکیشن را بروز رسانی نمائید')






        ],
      ),
    );
  }
}
