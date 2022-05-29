import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/car_service_page.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/compare_service_table_page.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/guaranty_page.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/relay_page.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ProductIntroduction extends StatefulWidget {
  const ProductIntroduction({Key? key}) : super(key: key);

  @override
  State<ProductIntroduction> createState() => _ProductIntroductionState();
}

class _ProductIntroductionState extends State<ProductIntroduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('معرفی محصولات'),
        titleTextStyle: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          _button('امدادی',RelayPage()),
          SizedBox(
            height: 8,
          ),
          _button('گارانتی بدنه',GuarantyPage()),
          SizedBox(
            height: 8,
          ),
          _button('خدمات خودرو در محل',CarServicePage()),
          SizedBox(
            height: 8,
          ),
          _button('جدول مقایسه ای خدمات',CompareServicePage()),
        ],
      ),
    );
  }

  Widget _button(text,navigatedPage) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(dark_theme_primary_light),
        minimumSize: MaterialStateProperty.all(Size(260, 60)),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => navigatedPage,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }
}
