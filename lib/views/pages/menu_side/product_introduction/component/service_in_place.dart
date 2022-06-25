import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/service_in_place_sub_pages/check_before_trip.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/service_in_place_sub_pages/first_and_periodic.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/service_in_place_sub_pages/option_install.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../widgets/custom_neomorphic_box.dart';
import '../widget/description_box.dart';

class CarServicePage extends StatefulWidget {
  const CarServicePage({Key? key}) : super(key: key);

  @override
  State<CarServicePage> createState() => _CarServicePageState();
}

class _CarServicePageState extends State<CarServicePage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: const Text('خدمات خودرو در محل'),
          ),
          body: _body()),
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
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FirstAndPeriodic()));
                },
                widget: _subItemWidget('assets/images/ic_news_light.png', 'سرویس اولیه و دوره ای'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OptionInstall()));
                },
                widget: _subItemWidget('assets/images/ic_news_light.png', 'نصب آپشن'),
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
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CheckBeforeTrip()));
                },
                widget: _subItemWidget('assets/images/ic_news_light.png', 'بازدید پیش از سفر'),
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
