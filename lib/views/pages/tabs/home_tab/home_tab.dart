import 'dart:io';
import 'dart:ui';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/component/golden_card.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/emdad_in_place_page.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:emdad_khodro_saipa/views/slider_item_widget.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int carItemSelectedState = 0;

  //sliding up panel
  final double _initFabHeight = 100.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 500;
  double _panelHeightClosed = 300;
  PanelController _panelController = PanelController();

  late FlipCardController _flipCardController;

  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  bool _isPanelOpen = false;

  void _onAddNewCarDetailsTap() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return new Future(() => false);
            },
            child: AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

              // backgroundColor: primary_grey_color,
              title: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.close, size: 16,
                          // color: secondary_dark_purple_color
                        ),
                        SizedBox(
                          width: defaultPadding / 4,
                        ),
                        Text(
                          'لغو',
                          style: TextStyle(
                            fontSize: 10,
                            // color: secondary_dark_purple_color
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "اطلاعات مورد نیاز را وارد نمائید",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ],
              ),

              content: Container(
                  height: 300,
                  margin: EdgeInsets.all(defaultPadding),
                  padding: EdgeInsets.all(defaultPadding),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //name + textfield
                          Row(
                            children: [
                              Text('نام خودرو:'),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  controller: TextEditingController(),
                                ),
                              )
                            ],
                          ),

                          //سال ساخت
                          Row(
                            children: [
                              Text('سال ساخت:'),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  controller: TextEditingController(),
                                ),
                              )
                            ],
                          ),

                          //رنگ
                          Row(
                            children: [
                              Text('رنگ:'),
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(),
                                ),
                              )
                            ],
                          ),

                          //شماره پلاک
                          Row(
                            children: [
                              Text('پلاک خودرو:'),
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(),
                                ),
                              )
                            ],
                          ),

                          Expanded(child: Container()),

                          Container(
                            // margin: EdgeInsets.all(defaultPadding),
                            // padding: EdgeInsets.all(defaultPadding),
                            height: 30,
                            width: double.maxFinite,

                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop(null);
                                // if(positiveFunc!=null){
                                //   positiveFunc!();
                                // }
                              },
                              // color: secondary_dark_purple_color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                // side: BorderSide(width: 2,color: color_holoGrey_primaryLow)
                              ),
                              child: Text(
                                'ثبت',
                                style: TextStyle(
                                  // color: secondary_light_grey_color
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  bool isLoading = true;
  CarouselController _controller = CarouselController();
  CarouselController _servicesController = CarouselController();

  @override
  void initState() {
    super.initState();
    _flipCardController = FlipCardController();
    getCarsData();
  }

  List myCarsList = [];
  List<Widget> sliderItemList = [];
  List<Widget> homeSliderServicesList = [];

  Widget firstSlideServicesWidget() {
    return GridView.count(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      // maxCrossAxisExtent: 120,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: EdgeInsets.all(defaultPadding),
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EmdadService(
                          title: 'امداد فوری',
                          hasCarProblem: true,
                        )));
          },
          widget: _subItemWidget('assets/images/ic_service.png', 'امداد فوری'),
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
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EmdadInPlacePage()));
          },
          widget: _subItemWidget('assets/images/ic_service_in_place.png', 'خدمات در محل'),
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
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const GoldenCard()));
          },
          widget: _subItemWidget('assets/images/ic_body_garanty.png', 'کارت طلایی'),
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
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
          },
          widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_body_garanty.png', 'گارانتی بدنه'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
        // CustomNeomorphicBox(
        //   title: '',
        //   index: 0,
        //   marginRight: 0,
        //   marginBottom: 0,
        //   marginTop: 0,
        //   marginLeft: 0,
        //   paddingTop: 8,
        //   paddingRight: 8,
        //   paddingLeft: 8,
        //   selectedIndex: 1,
        //   height: 60 / 640,
        //   isChildText: false,
        //   isFull: false,
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
        //   },
        //   widget: _subItemWidget('assets/images/ic_parking.png', 'خرید اشتراک'),
        // ),
      ],
    );
  }

  Widget secondSlideServicesWidget() {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      // maxCrossAxisExtent: 120,
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EmdadService(
                          title: 'حمل خودرو',
                          hasCarProblem: false,
                        )));
          },
          widget: _subItemWidget('assets/images/ic_car_movement.png', 'حمل خودرو'),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EmdadService(
                          title: 'پنچری لاستیک',
                          hasCarProblem: false,
                        )));
          },
          widget: _subItemWidget('assets/images/ic_flat_tire.png', 'پنچری'),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EmdadService(
                          title: 'امداد باتری',
                          hasCarProblem: false,
                        )));
          },
          widget: _subItemWidget('assets/images/ic_flat_tire.png', 'امداد باتری'),
        ),
      ],
    );
  }

  String carImagePath(String carModel) {
    String imagePath = '';
    switch (carModel) {
      case 'ساینا':
        imagePath = 'car_saina';
        break;
      case 'کوییک':
        imagePath = 'car_quick';
        break;
      case 'پراید':
        imagePath = 'car_pride';
        break;
      case 'تیبا':
        imagePath = 'car_tiba';
        break;

      case 'وانت':
        imagePath = 'car_vanet';
        break;

      case 'سراتو':
        imagePath = 'car_serato';
        break;

      case 'چانگان':
        imagePath = 'car_changan';
        break;

      default:
        imagePath = 'khodro';
        break;
    }

    return imagePath;
  }

  getCarsData() async {
    HiveDB _hiveDb = HiveDB();
    myCarsList = await _hiveDb.getData('', 'userBox');

    setState(() {
      if (myCarsList.isEmpty) {
        sliderItemList = [
          const SliderItemWidget(
            index: 0,
            imagePath: 'assets/images/ic_car_red.png',
            showingTexts: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 16),
              child: Text(
                'برای ثبت خودرو کلیک کنید',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            isCarFromDataBase: false,
          )
        ];
      } else {
        for (int element = 0; element < myCarsList.length; element++) {
          sliderItemList.add(
            SliderItemWidget(
              index: element,
              imagePath: 'assets/images/${carImagePath(myCarsList[element].brand)}.png',
              showingTexts: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'نام خودرو: ${myCarsList[element].brand}',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'سال ساخت: ${myCarsList[element].createDate}',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              isCarFromDataBase: true,
              brand: myCarsList[element].brand,
              chassisNumber: myCarsList[element].chassisNumber,
              ownerNationalCode: myCarsList[element].ownerNationalCode,
              createDate: myCarsList[element].createDate,
              fourthCarTag: myCarsList[element].fourthCarTag,
              secondCarTag: myCarsList[element].secondCarTag,
              thirdCarTag: myCarsList[element].thirdCarTag,
              firstCarTag: myCarsList[element].firstCarTag,
            ),
          );
        }
        sliderItemList.add(
          const SliderItemWidget(
            index: 0,
            imagePath: 'assets/images/ic_car_red.png',
            showingTexts: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 16),
              child: Text(
                'برای ثبت خودرو کلیک کنید',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            isCarFromDataBase: false,
          ),
        );
      }

      isLoading = false;
    });
  }

  int _currentPage = 0;
  int _currentServicePage = 0;

  @override
  Widget build(BuildContext context) {
    homeSliderServicesList.clear();
    homeSliderServicesList = [
      firstSlideServicesWidget(),
      secondSlideServicesWidget(),
    ];
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        Stack(children: [
          Container(
            // color: Colors.blue,
            height: 220,
            // height: MediaQuery.of(context).size.height * 0.28,
            width: double.maxFinite,
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          // enableInfiniteScroll: false,
                          viewportFraction: 1,
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPage = index;
                            });
                          }),
                      items: sliderItemList,
                    ),
                  ),
          ),
          !isLoading
              ? Align(
                  alignment: Alignment.topCenter,
                  // bottom: 30,
                  // right: MediaQuery.of(context).size.width/2 ,
                  // left: MediaQuery.of(context).size.width/2 ,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: DotsIndicator(
                      onTap: (index) {
                        _controller.animateToPage(index.round(), duration: Duration(seconds: 1), curve: Curves.ease);
                      },
                      position: _currentPage.toDouble(),
                      dotsCount: sliderItemList.length,
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.all(2),
                        activeSize: Size(10, 10),
                        size: Size(10, 10),
                        color: Colors.transparent,
                        shape: CircleBorder(side: BorderSide(width: 1.0, color: Color(0xFF2E3D3D))),
                        activeColor: const Color(0xFF8E8E8E),
                      ),
                      // cornerRadius: 50,
                      // color: const Color(0xFF8E8E8E),
                      // activeColor: const Color(0xFF2E3D3D),
                      // width: 10,
                      // height: 10,
                      // count: sliderItemList.length,
                      // index: _currentPage,
                    ),
                  ),
                )
              : const SizedBox(
                  height: 5,
                ),
        ]),
        Center(
          child: DotsIndicator(
            onTap: (index) {
              _servicesController.animateToPage(index.round(), duration: Duration(seconds: 1), curve: Curves.ease);
            },
            position: _currentServicePage.toDouble(),
            dotsCount: homeSliderServicesList.length,
            decorator: DotsDecorator(
              activeSize: Size(15, 15),
              size: Size(15, 15),
              spacing: EdgeInsets.all(2),
              color: Colors.transparent,
              shape: CircleBorder(side: BorderSide(width: 1.0, color: Color(0xFF2E3D3D))),
              activeColor: const Color(0xFF8E8E8E),
            ),
          ),
        ),
        CarouselSlider(
          carouselController: _servicesController,
          // carouselController: _controller,
          options: CarouselOptions(
              // height:MediaQuery.of(context).size.height >600? (5*(MediaQuery.of(context).size.height/8))+200 : (5*(MediaQuery.of(context).size.height/8))+200,
              // height:MediaQuery.of(context).size.height >600? (5*(MediaQuery.of(context).size.height/8))+200 : (5*(MediaQuery.of(context).size.height/8))+200,
              // height:double.maxFinite,
              aspectRatio: 16 / 16,
              // enableInfiniteScroll: false,
              viewportFraction: 1.0,
              reverse: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentServicePage = index;
                });
              }),
          items: homeSliderServicesList,
        ),
        // Container(color: Colors.orange,width: 30,height: 50,),
        // Container(color: Colors.red,width: 30,height: 200,),
        // Container(color: Colors.green,width: 30,height: 300,),
        // Container(color: Colors.blue,width: 30,height: 100,),
        // Container(color: Colors.orange,width: 30,height: 100,),
      ]
          // SliderItemWidget(imagePath: 'assets/images/ic_car_red.png',showingTexts: Text('برای ثبت خودرو کلیک کنید'))
          ),
    );
  }

  //old sliding up panel
  /*

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.67;
    _panelHeightClosed = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      // backgroundColor: primary_grey_color,
      body: Stack(

        children: [

          SlidingUpPanel(
            controller: _panelController,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            defaultPanelState: PanelState.CLOSED,

            // parallaxOffset: .5,
            // backdropEnabled: true,

            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            // color: secondary_light_grey_color,
            margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            onPanelSlide: (double pos) => setState(() {
              // _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
              //     _initFabHeight;

            }),
            onPanelOpened: (){
              setState(() {
                _isPanelOpen = true;

              });
            },
            onPanelClosed: (){
              setState(() {
                _isPanelOpen = false;

              });
            },
          ),


        ],
      )
    );
  }

  Widget _body(){
    return Container(
      width: double.maxFinite,
      // color: primary_grey_color,
      child: SingleChildScrollView(
        child: Column(
          children: [

            // SizedBox(height: defaultPadding,),


            //logo
            // Image.asset('assets/images/emdad_khodro_logo_single.png', height: 40, width: 40,fit: BoxFit.cover,),


            SizedBox(height: defaultPadding/2,),


            //top box - car selection
            _isPanelOpen?
            //on panel close
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: secondary_light_grey_color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  //car brand and name
                  carItemSelectedState == 0?
                  Container(
                    child: Text('تیبا سفید - ۱۳۹۸',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),

                  )
                  :
                  Container(
                    child: Text('پراید نقره ای - ۱۳۹۶',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),

                  ),

                  //car plate
                  Container(
                      padding:  EdgeInsets.all(defaultPadding),
                      alignment: Alignment.centerLeft,
                      // color: Colors.yellow,
                      child: Image.asset('assets/images/car_plate.png', width: MediaQuery.of(context).size.width*0.45, fit: BoxFit.cover,))






                ],
              ),
            )
            :
            //on panel open
            FlipCard(
              controller: _flipCardController,
              flipOnTouch: false,



              front: Container(
                height: MediaQuery.of(context).size.height * 0.29,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: secondary_light_grey_color,
                    // image: DecorationImage(
                    //   alignment: Alignment.bottomLeft,
                    //   opacity: 0.5,
                    //   scale: 1.5,
                      // fit: BoxFit.cover,
                      // image: carItemSelectedState==0?
                      // AssetImage('assets/images/car_icon.png',)
                      //     :
                      // AssetImage('assets/images/car2_icon.png',)

                    // )
                ),

                child: Stack(

                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(carItemSelectedState==0? 'assets/images/car_icon.png':'assets/images/car2_icon.png',
                          scale: 1.3,

                          ),
                        ),
                      ),
                    ),
                    Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            //sample cars items
                            Row(
                              children: [

                                //tiba sefid - car item
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      carItemSelectedState = 0;
                                    });
                                  },
                                  child: Container(
                                    width: 80,
                                    margin: EdgeInsets.only(top: defaultPadding, right: defaultPadding),
                                    padding: EdgeInsets.all(defaultPadding/4),
                                    decoration: BoxDecoration(
                                        // color: primary_grey_color,
                                        borderRadius: BorderRadius.circular(16),


                                        border: carItemSelectedState==0? Border.all(
                                            color: color_holoGrey_primaryLow
                                        ) :null
                                    ),

                                    child: Column(
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.all(defaultPadding/4),
                                          child: Image.asset('assets/images/car_icon.png', height: 50,),

                                        ),

                                        Text('تیبا سفید',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                        Text('۱۳۹۸',style: TextStyle(fontSize: 10),),
                                        // Text('مشخصات'),

                                      ],
                                    ),
                                  ),
                                ),

                                //pride  noghrei
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      carItemSelectedState = 1;
                                    });
                                  },
                                  child: Container(
                                    width: 80,

                                    margin: EdgeInsets.only(top: defaultPadding, right: defaultPadding),
                                    padding: EdgeInsets.all(defaultPadding/4),
                                    decoration: BoxDecoration(
                                        // color: primary_grey_color,
                                        borderRadius: BorderRadius.circular(16),

                                        border: carItemSelectedState==1? Border.all(
                                            color: color_holoGrey_primaryLow
                                        ) :null
                                    ),

                                    child: Column(
                                      children: [

                                        Padding(
                                          padding: EdgeInsets.all(defaultPadding/4),
                                          child: Image.asset('assets/images/car2_icon.png', height: 50,),

                                        ),

                                        Text('پراید نقره ای', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                        Text('۱۳۹۶', style: TextStyle(fontSize: 10),),
                                        // Text('مشخصات'),

                                      ],
                                    ),
                                  ),
                                ),







                              ],
                            ),


                            //add + button
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: (){

                                  _flipCardController.toggleCard();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, size: 20,
                                      // color: primary_grey_color
                                      ),
                                    SizedBox(width: defaultPadding/4,),
                                    Text('اضافه کردن', style: TextStyle(fontSize: 12,
                                        // color: primary_grey_color
                                    ),)
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),


                        Expanded(child: Container()),

                        Container(
                            padding:  EdgeInsets.all(defaultPadding),
                            alignment: Alignment.centerRight,
                            // color: Colors.yellow,
                            child: Image.asset('assets/images/car_plate.png', width: MediaQuery.of(context).size.width*0.45, fit: BoxFit.cover,))




                        /*
                        carItemSelectedState==0?
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              //etelaate khodro
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('اطلاعات خودرو',style: TextStyle(fontSize: 22),),
                                  ),
                                ],
                              ),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('تیبا سفید'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('نام/برند'),
                                  ),

                                ],
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1398'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('سال ساخت'),
                                  ),

                                ],
                              ),




                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1401/06/25'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('انقضای اشتراک'),
                                  ),

                                ],
                              ),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1401/04/02'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('معاینه فنی'),
                                  ),

                                ],
                              )


                            ],
                          ),
                        )
                            :
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              //etelaate khodro
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('اطلاعات خودرو',style: TextStyle(fontSize: 22),),
                                  ),
                                ],
                              ),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('پراید نقره ای'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('نام/برند'),
                                  ),

                                ],
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1396'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('سال ساخت'),
                                  ),

                                ],
                              ),




                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('منقضی شده'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('انقضای اشتراک'),
                                  ),

                                ],
                              ),



                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('1402/12/02'),
                                  ),


                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                                      height: 3,
                                      color: color_holoGrey_primaryLow,

                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('معاینه فنی'),
                                  ),

                                ],
                              )


                            ],
                          ),
                        )
                        ,

                         */
                      ],
                    ),
                  ],
                ),
              ),


              back: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.29,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: secondary_light_grey_color,
                    image: DecorationImage(
                        alignment: Alignment.bottomLeft,

                        opacity: 0.5,
                        // fit: BoxFit.cover,
                        image: carItemSelectedState==0?
                        AssetImage('assets/images/car_icon.png',)
                            :
                        AssetImage('assets/images/car2_icon.png',)

                    ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [



                    //buttons scan qrcode and add car details
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // primary: primary_grey_color
                              ),
                              onPressed: () async {
                                await Permission.camera.request();
                                String? barcode = await scanner.scan();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.qr_code_rounded, size: 20,
                                    // color: secondary_light_grey_color,
                                  ),


                                  SizedBox(width: defaultPadding/4,),

                                  Text('اسکن QR Code خودرو', style: TextStyle(fontSize: 12,
                                      // color: secondary_light_grey_color
                                  ),),

                                ],
                              )
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Text('یا',style: TextStyle(fontSize: 12, )),
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // primary: primary_grey_color
                              ),
                              onPressed: (){
                                _onAddNewCarDetailsTap();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Icon(Icons.add_box_rounded, size: 20,
                                    // color: secondary_light_grey_color
                                    ),

                                  SizedBox(width: defaultPadding/4,),

                                  Text('ثبت اطلاعات', style: TextStyle(fontSize: 12,
                                      // color: secondary_light_grey_color
                                  )),

                                ],
                              )
                          ),
                        ),



                      ],
                    ),

                    Container(
                      padding: EdgeInsets.all(defaultPadding),
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: (){
                          _flipCardController.toggleCard();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.close,size: 20,
                              // color: primary_grey_color
                              ),

                            SizedBox(width: defaultPadding/4,),

                            Text('لغو', style: TextStyle(fontSize: 12,
                                // color: primary_grey_color
                            ))
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ),


            // Container(
            //   height: 220,
            //   margin: EdgeInsets.all(defaultPadding),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     color: secondary_light_grey_color
            //   ),
            //
            //   child: carItemSelectedState==0?
            //   Container(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //
            //         //etelaate khodro
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('اطلاعات خودرو',style: TextStyle(fontSize: 22),),
            //             ),
            //           ],
            //         ),
            //
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('تیبا سفید'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('نام/برند'),
            //             ),
            //
            //           ],
            //         ),
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('1398'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('سال ساخت'),
            //             ),
            //
            //           ],
            //         ),
            //
            //
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('1401/06/25'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('انقضای اشتراک'),
            //             ),
            //
            //           ],
            //         ),
            //
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('1401/04/02'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('معاینه فنی'),
            //             ),
            //
            //           ],
            //         )
            //
            //
            //       ],
            //     ),
            //   )
            //   :
            //   Container(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //
            //         //etelaate khodro
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('اطلاعات خودرو',style: TextStyle(fontSize: 22),),
            //             ),
            //           ],
            //         ),
            //
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('پراید نقره ای'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('نام/برند'),
            //             ),
            //
            //           ],
            //         ),
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('1396'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('سال ساخت'),
            //             ),
            //
            //           ],
            //         ),
            //
            //
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('منقضی شده'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('انقضای اشتراک'),
            //             ),
            //
            //           ],
            //         ),
            //
            //
            //
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('1402/12/02'),
            //             ),
            //
            //
            //             Expanded(
            //               child: Container(
            //                 margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            //                 height: 3,
            //                 color: color_holoGrey_primaryLow,
            //
            //               ),
            //             ),
            //
            //
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text('معاینه فنی'),
            //             ),
            //
            //           ],
            //         )
            //
            //
            //       ],
            //     ),
            //   )
            //   ,
            // ),


            // SizedBox(height: defaultPadding,),


          ],
        ),
      ),
    );
  }




  Widget _panel(ScrollController sc){

    final pages = List.generate(
        4,
            (index) => Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(16),
            // color: Colors.grey.shade300,
          ),
          // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child:


          index == 0? Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),

              child: GridView.extent(

                maxCrossAxisExtent:90,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,

                children: [

                  //weather
                  _serviceWidget(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/weather.png',
                      title: 'هواشناسی'
                  ),


                  //roads
                  _serviceWidget(
                    onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/road.png',
                    title: 'وضعیت راه',

                  ),

                  //news
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/ic_information.png',
                    title: 'اطلاعیه',

                  ),


                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/renew.png',
                    title: 'مسیریابی',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/renew.png',
                    title: 'تاکسی',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/renew.png',
                    title: 'بیمه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/renew.png',
                    title: 'خلافی',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/renew.png',
                    title: 'پارکینگ',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/renew.png',
                    title: 'جریمه',

                  ),
                  // _serviceWidget(
                  //   onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                  //   imagePath: 'assets/images/renew.png',
                  //   title: 'فروشگاه',
                  //
                  // ),


                ],
              )
          )
              :
              index == 1? Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),

                  child: GridView.extent(

                    maxCrossAxisExtent:90,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,




                    children: [


                      //news
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'اخبار',

                      ),


                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/renew.png',
                        title: 'شارژ',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/renew.png',
                        title: 'سیمکارت',

                      ),

                      //weather
                      _serviceWidget(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                          imagePath: 'assets/images/weather.png',
                          title: 'هواشناسی'
                      ),


                      //roads
                      _serviceWidget(
                        onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/road.png',
                        title: 'وضعیت راه',

                      ),



                    ],
                  )
              )
                :
              index == 2? Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),

                  child: GridView.extent(

                    maxCrossAxisExtent:90,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,




                    children: [

                      //weather
                      _serviceWidget(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                          imagePath: 'assets/images/weather.png',
                          title: 'هواشناسی'
                      ),


                      //roads
                      _serviceWidget(
                        onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/road.png',
                        title: 'وضعیت راه',

                      ),

                      //news
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'اطلاعیه',

                      ),





                    ],
                  )
              )
              :
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),

                  child: GridView.extent(

                    maxCrossAxisExtent:90,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,




                    children: [


                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'بانک',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'اینترنت',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'قرعه کشی',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'مسابقه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/ic_information.png',
                        title: 'رمزارز',

                      ),


                    ],
                  )
              ),
        ));


    //second section - row menu items - roads/weather/news
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [

          SizedBox(height: defaultPadding,),
          Text( 'خدمات ویژه امداد خودرو',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.58,
            child: PageView.builder(
              allowImplicitScrolling: false,
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: WormEffect(
              // activeDotColor: primary_grey_color,
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              // strokeWidth: 5,
            ),

          ),




          /*
          Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),

                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),


                  children: [

                    //weather
                    _serviceWidget(
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/weather.png',
                        title: 'هواشناسی'
                    ),


                    //roads
                    _serviceWidget(
                      onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/road.png',
                      title: 'وضعیت راه',

                    ),

                    //news
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),


                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/ic_information.png',
                      title: 'اطلاعیه',

                    ),


                  ],
                )
            ),

           */


        ],
      ),
    );
  }


   */

  Widget _serviceWidget({required Function onTap, required String imagePath, required String title}) {
    return NeumorphicButton(
      onPressed: () {
        onTap();
      },
      padding: EdgeInsets.only(top: defaultPadding / 2, right: defaultPadding / 2, left: defaultPadding / 2),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        // depth: 1.5,
        depth: 8,
        lightSource: LightSource.topLeft,
        color: Theme.of(context).cardColor,
        shadowDarkColor: Theme.of(context).shadowColor,
      ),
      child: Column(
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
              fit: BoxFit.cover,
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
            child: FittedBox(fit: BoxFit.fitWidth, child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14))),
          ),
        ],
      ),
    );
  }

  Widget _subItemWidget(String imagePath, String title) {
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
              color: Theme.of(context).accentColor,
            ),

            //one final
            // child: Center(child: Icon(Icons.airport_shuttle_rounded, size: 45, color:color_sharp_orange_darker2 ,)),
            // child: Center(child: Icon(Icons.airport_shuttle_rounded, size: 45, color:color_sharporange_dark_font ,)),
          ),
        ),
        // Expanded(child: Image.asset(imagePath,  fit: BoxFit.cover,)),
        // SizedBox(height: defaultPadding/3,),
        // Expanded(child: Container()),

        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FittedBox(fit: BoxFit.fitWidth, child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14))),
        ),
      ],
    );
  }
}
