import 'dart:ui';

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {


  int carItemSelectedState = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: defaultPadding/2,),


              //top box - car selection
              Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: color_holoGrey_primaryLight
                ),

                child: Row(
                  children: [


                    //tiba sefid - car item
                    InkWell(
                      onTap: (){
                        setState(() {
                          carItemSelectedState = 0;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.all(defaultPadding/2),
                        padding: EdgeInsets.all(defaultPadding/2),
                        decoration: BoxDecoration(
                          color: color_holoGrey_primaryDark,
                          borderRadius: BorderRadius.circular(16),


                            border: carItemSelectedState==0? Border.all(
                              color: color_holoGrey_primaryLow
                            ) :null
                        ),

                        child: Column(
                          children: [

                            Padding(
                                padding: EdgeInsets.all(defaultPadding/4),
                                child: Image.asset('assets/images/car_icon.png', height: 60,),

                            ),

                            Text('تیبا سفید'),
                            Text('۱۳۹۸'),
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
                        width: 100,

                        margin: EdgeInsets.all(defaultPadding/2),
                        padding: EdgeInsets.all(defaultPadding/2),
                        decoration: BoxDecoration(
                          color: color_holoGrey_primaryDark,
                          borderRadius: BorderRadius.circular(16),

                          border: carItemSelectedState==1? Border.all(
                            color: color_holoGrey_primaryLow
                          ) :null
                        ),

                        child: Column(
                          children: [

                            Padding(
                                padding: EdgeInsets.all(defaultPadding/4),
                                child: Image.asset('assets/images/car2_icon.png', height: 60,),

                            ),

                            Text('پراید نقره ای'),
                            Text('۱۳۹۶'),
                            // Text('مشخصات'),

                          ],
                        ),
                      ),
                    ),





                    Expanded(child: Container()),


                    //add + button
                    Container(
                      margin: EdgeInsets.all(defaultPadding/2),
                      padding: EdgeInsets.all(defaultPadding/2),
                      decoration: BoxDecoration(
                        color: color_holoGrey_primaryDark,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.add, size: 28,),
                          )



                        ],
                      ),
                    )
                  ],
                ),
              ),







              //second section - row menu items - roads/weather/news
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      //weather
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
                        },
                        child: Container(
                          width: 90,
                          height: 100,
                          // margin: EdgeInsets.all(defaultPadding/2),
                          padding: EdgeInsets.all(defaultPadding/2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: color_holoGrey_primaryLight
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/images/weather.png', height: 50,fit: BoxFit.cover,),
                              SizedBox(height: defaultPadding/2,),
                              Text('هواشناسی')


                            ],
                          ),

                        ),

                      ),

                      //roads
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
                        },
                        child: Container(
                          width: 90,
                          height: 100,
                          // margin: EdgeInsets.all(defaultPadding/2),
                          padding: EdgeInsets.all(defaultPadding/2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: color_holoGrey_primaryLight
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/images/road.png', height: 50,),
                              SizedBox(height: defaultPadding/2,),
                              Text('وضعیت راه')


                            ],
                          ),

                        ),
                      ),

                      //news
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevelopingPage()));
                        },

                        child: Container(
                          width: 90,
                          height: 100,
                          // margin: EdgeInsets.all(defaultPadding/2),
                          padding: EdgeInsets.all(defaultPadding/2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: color_holoGrey_primaryLight
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset('assets/images/news.png', height: 50,),
                              SizedBox(height: defaultPadding/2,),
                              Text('اطلاعیه')


                            ],
                          ),

                        ),
                      ),



                    ],
                  )
              ),






              Container(
                height: 220,
                margin: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: color_holoGrey_primaryLight
                ),

                child: carItemSelectedState==0?
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
              )






            ],
          ),
        ),
      )
    );
  }
}
