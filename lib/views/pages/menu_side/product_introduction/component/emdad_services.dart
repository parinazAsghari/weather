import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/emdad_services_sub_pages/common_emdad.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/emdad_services_sub_pages/necessary_emdad.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/emdad_services_sub_pages/supplmentary_emdad.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/emdad_services_sub_pages/trip_emdad.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../widgets/custom_neomorphic_box.dart';
import '../widget/description_box.dart';

class EmdadServices extends StatefulWidget {
  const EmdadServices({Key? key}) : super(key: key);

  @override
  State<EmdadServices> createState() => _EmdadServicesState();
}

class _EmdadServicesState extends State<EmdadServices> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('خدمات امدادی'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Center(
          child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'assets/images/emdad_khodro_logo_single.png',
                width: MediaQuery.of(context).size.width * 0.80,
              )),
        ),
        Container(
          child: GridView.extent(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            maxCrossAxisExtent: 120,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            padding: EdgeInsets.all(defaultPadding),
            children: [
              CustomNeomorphicBox(
                title: '',
                index: 0,
                marginRight: 0,
                marginBottom: 0,
                marginTop: 0,
                marginLeft: 0,
                paddingTop: 8,
                paddingRight: 8,
                paddingLeft: 8,
                selectedIndex: 1,
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CommonEmdad()));
                },
                widget: _subItemWidget('assets/images/ic_news.png', 'عمومی'),
              ),
              CustomNeomorphicBox(
                title: '',
                index: 0,
                marginRight: 0,
                marginBottom: 0,
                marginTop: 0,
                marginLeft: 0,
                paddingTop: 8,
                paddingRight: 8,
                paddingLeft: 8,
                selectedIndex: 1,
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SupplmentaryEmdad()));
                },
                widget: _subItemWidget('assets/images/ic_news.png', 'تکمیلی (247)'),
              ),
              CustomNeomorphicBox(
                title: '',
                index: 0,
                marginRight: 0,
                marginBottom: 0,
                marginTop: 0,
                marginLeft: 0,
                paddingTop: 8,
                paddingRight: 8,
                paddingLeft: 8,
                selectedIndex: 1,
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NecessaryEmdad()));
                },
                widget: _subItemWidget('assets/images/ic_news.png', 'الزامی'),
              ),
              CustomNeomorphicBox(
                title: '',
                index: 0,
                marginRight: 0,
                marginBottom: 0,
                marginTop: 0,
                marginLeft: 0,
                paddingTop: 8,
                paddingRight: 8,
                paddingLeft: 8,
                selectedIndex: 1,
                height: 60 / 640,
                isChildText: false,
                isFull: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TripEmdad()));
                },
                widget: _subItemWidget('assets/images/ic_news.png', 'سفر'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _subItemWidget(String imagePath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FittedBox(fit: BoxFit.fitWidth, child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14))),
        ),
      ],
    );
  }
}
