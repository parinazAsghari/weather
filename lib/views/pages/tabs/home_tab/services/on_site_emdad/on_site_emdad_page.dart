import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/on_site_emdad/submit_onsite_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../../../constants.dart';

class OnSiteEmdadPage extends StatefulWidget {
  const OnSiteEmdadPage({Key? key}) : super(key: key);

  @override
  State<OnSiteEmdadPage> createState() => _OnSiteEmdadPageState();
}

class _OnSiteEmdadPageState extends State<OnSiteEmdadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo_white_text.png',
          height: 30,
          width: MediaQuery.of(context).size.width * 0.35,
          fit: BoxFit.contain,
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: defaultPadding, bottom: defaultPadding/2),
          alignment: Alignment.center,
          child: Text('خدمات در محل',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        ),
        _serviceBox('سرویس‌های اولیه و ادواری','assets/images/bazdid_fani.png'),
        _serviceBox('آپشن و لوازم جانبی','assets/images/accessory.png'),
        _serviceBox('بازدید فنی پیش از سفر','assets/images/firs_service.png'),

      ],
    );
  }

  Widget _serviceBox(_title,_imagePath) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding*2,right: defaultPadding*2, top: defaultPadding/2, bottom: defaultPadding/2),
      height: MediaQuery.of(context).size.height*75/640,
      child: NeumorphicButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SubmitOnSiteService()));        },
        padding: EdgeInsets.only(
            right: 0,
            left: 0),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 1.5,
          lightSource: LightSource.topLeft,
          color: Theme.of(context).cardColor,
          shadowDarkColor: Theme.of(context).shadowColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 12,),

            Container(
              alignment: Alignment.center,
              // height: 60,
              // width: 60,
              child: Image.asset(
                _imagePath,
                fit: BoxFit.cover,
                // height: 4,
              ),
            ),
             SizedBox(width: 8,),
             Text(_title,
                style: TextStyle(
                    fontFamily: 'Vazir',
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
