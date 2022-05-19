import 'dart:ui';

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:qrscan/qrscan.dart' as scanner;


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


  bool _isPanelOpen= false;



  @override
  void initState() {
    super.initState();
    _flipCardController = FlipCardController();

  }


  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.65;
    _panelHeightClosed = MediaQuery.of(context).size.height * 0.45;

    return Scaffold(
      backgroundColor: primary_grey_color,
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
            color: secondary_light_grey_color,
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

            SizedBox(height: defaultPadding,),


            //logo
            Image.asset('assets/images/emdad_khodro_logo_single.png', height: 40, width: 40,fit: BoxFit.cover,),


            // SizedBox(height: defaultPadding,),


            //top box - car selection
            _isPanelOpen?
            //on panel close
            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary_light_grey_color
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
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: secondary_light_grey_color,
                    image: DecorationImage(
                      alignment: Alignment.bottomLeft,

                      opacity: 0.5,
                      // fit: BoxFit.cover,
                      image: carItemSelectedState==0?
                      AssetImage('assets/images/car_icon.png',)
                          :
                      AssetImage('assets/images/car2_icon.png',)

                    )
                ),

                child: Column(

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
                                margin: EdgeInsets.only(top: defaultPadding/2, right: defaultPadding),
                                padding: EdgeInsets.all(defaultPadding/4),
                                decoration: BoxDecoration(
                                    color: primary_grey_color,
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

                                margin: EdgeInsets.only(top: defaultPadding/2, right: defaultPadding),
                                padding: EdgeInsets.all(defaultPadding/4),
                                decoration: BoxDecoration(
                                    color: primary_grey_color,
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
                                Icon(Icons.add, size: 20,color: primary_grey_color,),
                                SizedBox(width: defaultPadding/4,),
                                Text('اضافه کردن', style: TextStyle(fontSize: 12,color: primary_grey_color),)
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
              ),


              back: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.29,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: secondary_light_grey_color,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primary_grey_color
                          ),
                          onPressed: () async {
                            await Permission.camera.request();
                            String? barcode = await scanner.scan();
                          },
                          child: Text('اسکن بارکد خودرو')
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text('یا'),
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primary_grey_color
                          ),
                          onPressed: (){},
                          child: Text('ثبت اطلاعات')
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
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),


                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),
                  _serviceWidget(
                    onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                    imagePath: 'assets/images/news.png',
                    title: 'اطلاعیه',

                  ),


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
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),


                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

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
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),


                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
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
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),


                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

                      ),
                      _serviceWidget(
                        onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                        imagePath: 'assets/images/news.png',
                        title: 'اطلاعیه',

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
              activeDotColor: primary_grey_color,
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
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),


                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
                      title: 'اطلاعیه',

                    ),
                    _serviceWidget(
                      onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage())),
                      imagePath: 'assets/images/news.png',
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


  Widget _serviceWidget({required Function onTap, required String imagePath, required String title}){
    return InkWell(
      onTap: (){
       onTap();
      },
      child: Container(
        // width: 70,
        height: 100,
        margin: EdgeInsets.all(defaultPadding/2),
        padding: EdgeInsets.all(defaultPadding/2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primary_grey_color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 30,width: 30,),
            SizedBox(height: defaultPadding/3,),
            Text(title, style: TextStyle(fontSize: 10))


          ],
        ),

      ),
    );
  }
}
