import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/speedometer/screens/dash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;
import 'package:permission_handler/permission_handler.dart';

class Speedmeter extends StatefulWidget {
  const Speedmeter({Key? key}) : super(key: key);

  @override
  State<Speedmeter> createState() => _SpeedmeterState();
}

class _SpeedmeterState extends State<Speedmeter> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'سرعت سنج',
          // style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: secondary_dark_purple_color,
      ),
      body: _body(),
    );
  }
  Widget _body() {
    return Builder(builder: (context) {

      return DashScreen(unit: 'km/h',);
    });
  }






}


