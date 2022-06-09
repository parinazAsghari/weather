import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/car_service_page.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/compare_service_table_page.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/golden_card.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/emdad_services.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../widgets/custom_neomorphic_box.dart';

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
        title: Text('معرفی خدمات'),
        // titleTextStyle: TextStyle(
        //     fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: _body(),
    );
  }

  Widget _body() {

    return Container(
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
            height: 60/640,
            isChildText: false,
            isFull: false,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EmdadServices()));
            },
            widget: _subItemWidget('assets/images/ic_service.png', 'خدمات امدادی'),
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
            height: 60/640,
            isChildText: false,
            isFull: false,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoldenCard()));
            },
            widget: _subItemWidget('assets/images/ic_news.png', 'کارت طلایی'),
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
            height: 60/640,
            isChildText: false,
            isFull: false,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CarServicePage()));
            },
            widget: _subItemWidget('assets/images/ic_news.png', 'خدمات خودرو در محل'),
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
            height: 60/640,
            isChildText: false,
            isFull: false,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CompareServicePage()));
            },
            widget: _subItemWidget('assets/images/ic_news.png', 'جدول مقایسه ای خدمات'),
          ),

        ],
      ),
    );

    /*
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          _button('خدمات امدادی',RelayPage()),
          SizedBox(
            height: 8,
          ),
          _button('کارت طلایی',GuarantyPage()),
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

     */
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

  Widget _subItemWidget(String imagePath,  String title){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Icon(
        //       Icons.more_vert,
        //       size: 15,
        //     ),
        //   ],
        // ),
        Expanded(
            child: Container(
              // height: 60,
              // width: 60,
              // padding: EdgeInsets.all(12),
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   // borderRadius: BorderRadius.circular(70),
              //
              //     //TODO one final
              //     color: coor_sharp_orange_gradient3
              //   // color: dak_theme_box_shadow_dark
              //
              // ),
              // padding: EdgeInsets.all(1),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),

              //one final
              // child: Center(child: Icon(Icons.airport_shuttle_rounded, size: 45, color:color_sharp_orange_darker2 ,)),
              // child: Center(child: Icon(Icons.airport_shuttle_rounded, size: 45, color:color_sharporange_dark_font ,)),
            )),
        // Expanded(child: Image.asset(imagePath,  fit: BoxFit.cover,)),
        // SizedBox(height: defaultPadding/3,),
        // Expanded(child: Container()),

        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title,textAlign: TextAlign.center, style: TextStyle( fontFamily: 'Vazir',fontWeight: FontWeight.bold, fontSize: 14))),
        ),
      ],
    );
  }

}
