import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';
import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';


class HomePageSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageSliderState();
  }
}

class _HomePageSliderState extends State<HomePageSlider> {

  int _current = 0;

  final List<String> imgList = [
    'assets/images/banner_1.png',
    'assets/images/banner_2.png',
    'assets/images/banner_3.png',
  ];





  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = imgList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.fill, width: double.maxFinite),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'بنر شماره '+replaceFarsiNumber('${imgList.indexOf(item)+1}')+'.',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    )).toList();

    return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),

            child: CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(

                  autoPlay: true,
                  enlargeCenterPage: false,
                  // aspectRatio: 1/8,
                  // height: 200,
                  viewportFraction: 1.0,



                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,
                      //color: Colors.white
                  ),
                  shape: BoxShape.circle,
                  color: _current == index
                      // ? Color.fromRGBO(0, 0, 0, 0.9)
                      ? ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor
                      // : Color.fromRGBO(0, 0, 0, 0.1),
                      : ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,
                ),
              );
            }).toList(),
          ),
        ]
    );
  }




}