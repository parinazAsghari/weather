import 'dart:io';
import 'dart:ui';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
import 'package:emdad_khodro_saipa/models/service.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/golden_card.dart';
import 'package:emdad_khodro_saipa/views/pages/modules/map/map_module.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/car_charge/car_charge.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/car_toll/car_toll.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/compass/compass_service.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/emdad_on_site_packages.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/speedometer/components/speedometer.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/speedometer/speed_meter.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/weather/weather.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:emdad_khodro_saipa/views/slider_item_widget.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../submit_emdad_request.dart';

class HomeTabN extends StatefulWidget {
  const HomeTabN({Key? key}) : super(key: key);

  @override
  _HomeTabNState createState() => _HomeTabNState();
}

class _HomeTabNState extends State<HomeTabN> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Column(
          children: [
            topCarBoxWidget(),

            Row(
              children: [
                callCenterWidget(),
                mapBoxWidget(),
              ],
            ),

            serviceSliderWidget(),


          ],
        ),
      ),
    );
  }

  Widget topCarBoxWidget(){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color(0xFF2E3D3D),
            Color(0xFFEAEDF3),
          ],
        ),
      ),
    );
  }

  Widget callCenterWidget(){
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFEAEDF3), Color(0xFFEAEDF3), Colors.white],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('تماس با 096550'),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/headset.png',
            // width: MediaQuery.of(context).size.width * 0.80,
          ),
          // SizedBox(height: 10,),
        ],
      ),
    );
  }

  Widget mapBoxWidget(){
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
    );
  }

  Widget serviceSliderWidget(){
    return Container();
  }
}

