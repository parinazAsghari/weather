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

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int carItemSelectedState = 0;

  //sliding up panel
  final double _initFabHeight = 100.0;

  late FlipCardController _flipCardController;

  final controller = PageController(viewportFraction: 1.0, keepPage: true);
  final HiveDB _hiveDB = HiveDB();

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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),

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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                                Navigator.of(context, rootNavigator: true)
                                    .pop(null);
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
  final CarouselController _controller = CarouselController();
  final CarouselController _servicesController = CarouselController();
  List myCarsList = [];
  List servicesList = [];
  List<Widget> sliderItemList = [];
  List<Widget> homeSliderServicesList = [];
  List<Service> serviceItemList = [];

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _flipCardController = FlipCardController();
    getCarsData();
    getServicesData();
  }

  Widget _customDialogBody() {
    return StatefulBuilder(builder: (context, setS) {
      List<Widget> children = [];
      servicesList.forEach((element) {
        children.add(
          _customCheckBox(
            text: element.serviceName,
            value: element.isFavorite,
            isActive: element.isFixed? false:true,
            onTap: (value) {
              isChecked = !value;
              setS(() {});
              setState(() {
                element.isFavorite = !element.isFavorite;
              });
            },
          ),
        );
      });

      return SingleChildScrollView(
        child: Column(children: children),
      );
    });
  }

  Widget _customCheckBox({@required String? text, @required bool? value, @required onTap, @required isActive}) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 24,
        ),
        Checkbox(
            value: value,
            onChanged: isActive? (val) {
              onTap(val);
            }
            :null
        ),
        const SizedBox(width: 10),
        Text(
          text ?? '',
          style: const TextStyle(fontSize: 16.0),
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
              imagePath:
                  'assets/images/${carImagePath(myCarsList[element].brand)}.png',
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

  getServicesData() async {
    servicesList = await _hiveDB.getData('', 'serviceBox');
  }

  Widget firstSlideServicesWidget() {
    List firstSlideList = [];
    servicesList.forEach((element) {
      if (element.isFavorite) {
        firstSlideList.add(element);
      }
    });
    firstSlideList.add(
      Service(
        id: 13,
        serviceName: ' ',
        iconPath: 'assets/images/ic_plus.png',
        isFavorite: true,
        isFixed: true,
        slideId: 1,
        onTap: () {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return MessageDialogWidget(
                  height: 500,
                  width: 320,
                  dismissable: true,
                  hasTextBody: false,
                  widget: _customDialogBody(),
                  positiveTxt: 'ثبت',
                  positiveFunc: () {
                    //TODO store data in hive
                    print('start storing data in hive');
                    for (int i = 0; i < serviceItemList.length; i++) {
                      _hiveDB.putData(i, 'serviceBox', serviceItemList[i]);
                    }
                    print('finished for loop for storing data');
                  },
                );
              });
        },
      ),
    );
    return GridView.builder(
      itemBuilder: (BuildContext ctx, index) {
        return CustomNeomorphicBox(
          title: firstSlideList[index].serviceName,
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
          onTap: firstSlideList[index].onTap,
          widget: _subItemWidget(
            firstSlideList[index].iconPath,
            firstSlideList[index].serviceName,
          ),
        );
      },
      itemCount: firstSlideList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(defaultPadding),
    );
  }

  Widget secondSlideServicesWidget() {
    List secondSlideList = [];
    servicesList.forEach((element) {
      if (element.slideId == 2) {
        secondSlideList.add(element);
      }
    });
    return GridView.builder(
      itemBuilder: (BuildContext ctx, index) {
        return CustomNeomorphicBox(
          title: secondSlideList[index].serviceName,
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
          onTap: secondSlideList[index].onTap,
          widget: _subItemWidget(
            secondSlideList[index].iconPath,
            secondSlideList[index].serviceName,
          ),
        );
      },
      itemCount: secondSlideList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(defaultPadding),
    );
  }

  Widget thirdSlideServicesWidget() {
    List thirdSlideList = [];
    servicesList.forEach((element) {
      if (element.slideId == 3) {
        thirdSlideList.add(element);
      }
    });
    return GridView.builder(
      itemBuilder: (BuildContext ctx, index) {
        return CustomNeomorphicBox(
          title: thirdSlideList[index].serviceName,
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
          onTap: thirdSlideList[index].onTap,
          widget: _subItemWidget(
            thirdSlideList[index].iconPath,
            thirdSlideList[index].serviceName,
          ),
        );
      },
      itemCount: thirdSlideList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(defaultPadding),
    );
  }

  Widget forthSlideServicesWidget() {
    List fourthSlideList = [];
    servicesList.forEach((element) {
      if (element.slideId == 4) {
        fourthSlideList.add(element);
      }
    });
    return GridView.builder(
      itemBuilder: (BuildContext ctx, index) {
        return CustomNeomorphicBox(
          title: fourthSlideList[index].serviceName,
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
          onTap: fourthSlideList[index].onTap,
          widget: _subItemWidget(
            fourthSlideList[index].iconPath,
            fourthSlideList[index].serviceName,
          ),
        );
      },
      itemCount: fourthSlideList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(defaultPadding),
    );
  }

  int _currentPage = 0;
  int _currentServicePage = 0;
  List onTapList = [];

  @override
  Widget build(BuildContext context) {
    onTapList = [
          () async {
        LatLng latlng = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MapModule()));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SubmitEmdadRequest(
                  title: 'امداد فوری',
                  hasCarProblem: true,
                  latLng: latlng,
                )));


      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EmdadOnSitePackages()));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const GoldenCard()));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
      },
          () async {
        LatLng latlng = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MapModule()));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SubmitEmdadRequest(
                  title: 'حمل خودرو',
                  hasCarProblem: false,
                  latLng: latlng,
                )));

        // return Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => EmdadService(
        //               title: 'حمل خودرو',
        //               hasCarProblem: false,
        //             )));
      },
          () async {
        LatLng latlng = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MapModule()));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SubmitEmdadRequest(
                  title: 'پنچری لاستیک',
                  hasCarProblem: false,
                  latLng: latlng,
                )));


        // return Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => EmdadService(
        //               title: 'پنچری لاستیک',
        //               hasCarProblem: false,
        //             )));
      },
          () async {
        LatLng latlng = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MapModule()));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SubmitEmdadRequest(
                  title: 'امداد باتری',
                  hasCarProblem: false,
                  latLng: latlng,
                )));


        // return Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => EmdadService(
        //               title: 'امداد باتری',
        //               hasCarProblem: false,
        //             )));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CarToll()));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Weather()));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Speedmeter()));
      },
          () {
        return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Compass()));
      },
    ];
    if (servicesList.isEmpty) {
      serviceItemList = [
        Service(
          id: 1,
          serviceName: 'امداد فوری',
          iconPath: 'assets/images/ic_service.png',
          isFavorite: true,
          isFixed: true,
          slideId: 1,
          onTap: onTapList[0],
        ),
        Service(id: 2, serviceName: 'خدمات در محل', iconPath: 'assets/images/ic_service_in_place.png', isFavorite: true, isFixed: true, slideId: 1, onTap: onTapList[1]),
        Service(id: 3, serviceName: 'کارت طلایی', iconPath: 'assets/images/ic_golden_card.png', isFavorite: true, isFixed: true, slideId: 1, onTap: onTapList[2]),
        Service(id: 4, serviceName: 'خرید اشتراک', iconPath: 'assets/images/ic_buy_subscription.png', isFavorite: true, isFixed: true, slideId: 1, onTap: onTapList[3]),
        Service(id: 5, serviceName: 'حمل خودرو', iconPath: 'assets/images/ic_car_movement.png', isFavorite: false, isFixed: false, slideId: 2, onTap: onTapList[4]),
        Service(id: 6, serviceName: 'پنچری', iconPath: 'assets/images/ic_flat_tire.png', isFavorite: false, isFixed: false, slideId: 2, onTap: onTapList[5]),
        Service(id: 7, serviceName: 'امداد باتری', iconPath: 'assets/images/ic_battery.png', isFavorite: false, isFixed: false, slideId: 2, onTap: onTapList[6]),
        Service(id: 8, serviceName: 'عوارض خودرو', iconPath: 'assets/images/ic_car_toll.png', isFavorite: false, isFixed: false, slideId: 3, onTap: onTapList[7]),
        Service(id: 9, serviceName: 'خلافی خودرو', iconPath: 'assets/images/ic_car_charge.png', isFavorite: false, isFixed: false, slideId: 3, onTap: onTapList[8]),
        Service(id: 10, serviceName: 'هواشناسی', iconPath: 'assets/images/ic_weather.png', isFavorite: false, isFixed: false, slideId: 4, onTap: onTapList[9]),
        Service(id: 11, serviceName: 'سرعت سنج', iconPath: 'assets/images/ic_speedometer.png', isFavorite: false, isFixed: false, slideId: 4, onTap: onTapList[10]),
        Service(id: 12, serviceName: 'قطب نما', iconPath: 'assets/images/ic_compass.png', isFavorite: false, isFixed: false, slideId: 4, onTap: onTapList[11]),
      ];

      for (int i = 0; i < serviceItemList.length; i++) {
        _hiveDB.putData(i, 'serviceBox', serviceItemList[i]);
      }
      servicesList = serviceItemList;
      // return servicesList;
    }
    for (int i = 0; i < servicesList.length; i++) {
      servicesList[i].onTap = onTapList[i];
    }
    homeSliderServicesList.clear();
    homeSliderServicesList = [firstSlideServicesWidget(), secondSlideServicesWidget(), thirdSlideServicesWidget(), forthSlideServicesWidget()];
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
              _servicesController.animateToPage(index.round(),
                  duration: Duration(seconds: 1), curve: Curves.ease);
            },
            position: _currentServicePage.toDouble(),
            dotsCount: homeSliderServicesList.length,
            decorator: DotsDecorator(
              activeSize: Size(15, 15),
              size: Size(15, 15),
              spacing: EdgeInsets.all(2),
              color: Colors.transparent,
              shape: CircleBorder(
                  side: BorderSide(width: 1.0, color: Color(0xFF2E3D3D))),
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
      ]
        // SliderItemWidget(imagePath: 'assets/images/ic_car_red.png',showingTexts: Text('برای ثبت خودرو کلیک کنید'))
      ),
    );
  }

  Widget _serviceWidget(
      {required Function onTap,
      required String imagePath,
      required String title}) {
    return NeumorphicButton(
      onPressed: () {
        onTap();
      },
      padding: EdgeInsets.only(
          top: defaultPadding / 2,
          right: defaultPadding / 2,
          left: defaultPadding / 2),
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
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Vazir',
                        fontWeight: FontWeight.bold,
                        fontSize: 14))),
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
            padding: EdgeInsets.all(4),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              // color: Theme.of(context).accentColor,
            ),

            //one final
            // child: Center(child: Icon(Icons.airport_shuttle_rounded, size: 45, color:color_sharp_orange_darker2 ,)),
            // child: Center(child: Icon(Icons.airport_shuttle_rounded, size: 45, color:color_sharporange_dark_font ,)),
          ),
        ),
        // Expanded(child: Image.asset(imagePath,  fit: BoxFit.cover,)),
        // SizedBox(height: defaultPadding/3,),
        // Expanded(child: Container()),

        if(title != ' ') Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Vazir',
                      fontWeight: FontWeight.bold,
                      fontSize: 14))),
        ),
      ],
    );
  }
}
