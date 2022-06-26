import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/submit_onsite_service.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../../../constants.dart';

class EmdadOnSitePackages extends StatefulWidget {
  const EmdadOnSitePackages({Key? key}) : super(key: key);

  @override
  State<EmdadOnSitePackages> createState() => _EmdadOnSitePackagesState();
}

class _EmdadOnSitePackagesState extends State<EmdadOnSitePackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/images/emdad_khodro_logo.png',
          // height: 30,
          width: MediaQuery.of(context).size.width * 0.45,
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
          padding: EdgeInsets.only(top: defaultPadding, bottom: defaultPadding / 2),
          alignment: Alignment.center,
          child: const Text(
            'خدمات در محل',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        CustomNeomorphicBox(
          title: '',
          index: 0,
          selectedIndex: 1,
          isFull: true,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubmitOnSiteService()));
          },
          height: 75 / 640,
          marginTop: 8,
          marginRight: 28,
          marginLeft: 0,
          marginBottom: 0,
          isChildText: false,
          widget: _subItemBox(title: 'سرویس‌های اولیه و دوره ای', imagePath: 'assets/images/bazdid_fani.png'),
        ),
        CustomNeomorphicBox(
          title: '',
          index: 0,
          selectedIndex: 1,
          isFull: true,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubmitOnSiteService()));
          },
          height: 75 / 640,
          marginTop: 8,
          marginRight: 28,
          marginLeft: 0,
          marginBottom: 0,
          isChildText: false,
          widget: _subItemBox(title: 'تعمیرات غیرفوریتی', imagePath: 'assets/images/accessory.png'),
        ),
        CustomNeomorphicBox(
          title: '',
          index: 0,
          selectedIndex: 1,
          isFull: true,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubmitOnSiteService()));
          },
          height: 75 / 640,
          marginTop: 8,
          marginRight: 28,
          marginBottom: 0,
          isChildText: false,
          widget: _subItemBox(title: 'آپشن و لوازم جانبی', imagePath: 'assets/images/accessory.png'),
        ),
        CustomNeomorphicBox(
          title: '',
          index: 0,
          selectedIndex: 1,
          isFull: true,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SubmitOnSiteService()));
          },
          height: 75 / 640,
          marginTop: 8,
          marginRight: 28,
          marginBottom: 0,
          isChildText: false,
          widget: _subItemBox(title: 'بازدید فنی پیش از سفر', imagePath: 'assets/images/firs_service.png'),
        ),
      ],
    );
  }

  Widget _subItemBox({required String title, required String imagePath}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 12,
        ),
        Container(
          alignment: Alignment.center,
          // height: 60,
          // width: 60,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            // height: 4,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title, style: const TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}
