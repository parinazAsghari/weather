import 'package:carousel_slider/carousel_slider.dart';
import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/new_ui/custom_service_item_widget_new.dart';
import 'package:emdad_khodro_saipa/views/pages/new_ui/custom_top_slider_item.dart';
import 'package:emdad_khodro_saipa/views/pages/new_ui/map_new_page.dart';
import 'package:flutter/material.dart';

class HomeTabNew extends StatefulWidget {
  const HomeTabNew({Key? key}) : super(key: key);

  @override
  _HomeTabNewState createState() => _HomeTabNewState();
}

class _HomeTabNewState extends State<HomeTabNew> {
  final CarouselController _controller = CarouselController();
  final CarouselController _firstSliderController = CarouselController();
  int _currentPage = 0;
  List<Widget> sliderItemList = [];
  List<Widget> topSliderItemList = [
    CustomTopSliderItem(
      model: 'مدل 1399',
      name: 'شاهین - نقره ای',
      imagePath: 'assets/images/new_car.png',
    ),
    // CustomTopSliderItem(model: 'مدل 1399', name: 'شاهین - نقره ای', imagePath: 'assets/images/new_car.png',),
  ];

  Widget firstSlideServicesWidget() {
    return GridView.extent(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      maxCrossAxisExtent: 120,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: EdgeInsets.all(defaultPadding),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 3,
      //     // childAspectRatio: 3 / 2,
      //     crossAxisSpacing: 16,
      //     mainAxisSpacing: 16),
      children: [
        CustomServiceItem(
          imagePath: 'assets/images/khadamat_emdad.png',
          serviceName: 'خدمات امداد',
        ),
        CustomServiceItem(
          imagePath: 'assets/images/emdad_dar_mahal.png',
          serviceName: 'امداد در محل',
        ),
        CustomServiceItem(
          imagePath: 'assets/images/haml_khodro.png',
          serviceName: 'حمل خودرو',
        ),
        CustomServiceItem(
          imagePath: 'assets/images/panchari.png',
          serviceName: 'پنچری',
        ),
        CustomServiceItem(
          imagePath: 'assets/images/taxi.png',
          serviceName: 'تاکسی',
        ),
        CustomServiceItem(
          imagePath: 'assets/images/etelaie.png',
          serviceName: 'اطلاعیه',
        ),
      ],
      // shrinkWrap: true,
      // scrollDirection: Axis.vertical,
      // physics: const NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.all(defaultPadding),
      // maxCrossAxisExtent: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    sliderItemList.clear();
    sliderItemList.add(firstSlideServicesWidget());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 5),
            child: Container(
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
              child: CarouselSlider(
                carouselController: _firstSliderController,
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: topSliderItemList.length > 1 ? true : false,
                    viewportFraction: 1,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    }),
                items: topSliderItemList,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'map',
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NewMapPage()));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: sliderItemList.length > 1 ? true : false,
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
        ],
      ),
    );
  }
}
