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


                    Container(
                      width: 100,
                      margin: EdgeInsets.all(defaultPadding/2),
                      padding: EdgeInsets.all(defaultPadding/2),
                      decoration: BoxDecoration(
                        color: color_holoGrey_primaryDark,
                        borderRadius: BorderRadius.circular(16),
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
                    Container(
                      width: 100,

                      margin: EdgeInsets.all(defaultPadding/2),
                      padding: EdgeInsets.all(defaultPadding/2),
                      decoration: BoxDecoration(
                        color: color_holoGrey_primaryDark,
                        borderRadius: BorderRadius.circular(16),
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
              )






            ],
          ),
        ),
      )
    );
  }
}
