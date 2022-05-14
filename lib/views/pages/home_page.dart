import 'dart:ui';

import 'package:emdad_khodro_saipa/views/pages/menu_side/about_us.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/settings.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/user_profile.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/emdad_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/questionnaire_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/subscribe/subscribe_tab.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> _items = [
    HomeTab(),

    EmdadTab(),

    SubscribeTab(),

    QuestionnaireTab(),


  ];
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=> false,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/emdad_khodro_logo_single.png', height: 20, width: 20,fit: BoxFit.cover,),

              SizedBox(width: defaultPadding/2,),

              Text('امداد خودرو سایپا'),
            ],
          ),
          centerTitle: true,
          backgroundColor: color_holoGrey_primary,

        ),
        endDrawer: DrawerWidget(),

        body:Center(
            child: IndexedStack(
                index: _selectedIndex,
                children: _items
            )//_items.elementAt(_index),
        ),
        bottomNavigationBar: _showBottomNav(),
      ),
    );
  }

  Widget _showBottomNav()
  {
    return BottomNavigationBar(
      enableFeedback: false,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          label: 'خانه',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.miscellaneous_services),
          label: 'امداد',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'اشتراک',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_rounded),
          label: 'نظرسنجی',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,

    );
  }

  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });
  }



  Widget DrawerWidget(){
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
            width: 240,
            decoration: BoxDecoration(

                color: color_holoGrey_primaryDark.withOpacity(0.9),
                border: Border.all(width: 3,color: color_holoGrey_primaryLow),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0))

            ),
            child: Drawer(
                elevation: 0,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(shrinkWrap: true,
                    children: <Widget>[
                      // SizedBox(height: 25,)
                      // ,
                      // Container(
                      //   margin: EdgeInsets.only(top: 15,left: 15),
                      //   alignment: Alignment.centerLeft,
                      //   child: IconButton(
                      //     onPressed: (){
                      //       Navigator.pop(context);
                      //     },
                      //     icon: Icon(Icons.close,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                      //   ),
                      // )
                      // ,
                      SizedBox(height: 15,)
                      ,
                      Image.asset('assets/images/emdad_khodro_logo_single.png',height: 80,width: 80,)
                      ,
                      SizedBox(height: 20,)
                      ,
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('کاربر مهمان',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: color_holoGrey_primaryLow),)
                        ,

                      )
                      ,
                      SizedBox(height: 20,)
                      ,
                      Divider(height: 5,thickness: 0.25,color: color_sharp_orange_low,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: color_sharp_orange)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(Icons.account_circle,color: color_holoGrey_primaryLow,),
                              )
                          ),
                          onTap: (){
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
                          },
                          trailing: Text('پروفایل کاربری',textAlign: TextAlign.end,style: TextStyle(color: color_holoGrey_primaryLow),),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,


                      Divider(height: 5,thickness: 0.25,color: color_sharp_orange_low,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: color_sharp_orange)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.settings,color: color_sharp_orange_low,),
                              )
                          ),



                          onTap: (){
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Settings()));
                          },
                          trailing: Text('تنظیمات',textAlign: TextAlign.end,style: TextStyle(color: color_sharp_orange_low),),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,
                      Divider(height: 5,thickness: 0.25,color: color_sharp_orange_low,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: color_sharp_orange)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.info,color: color_sharp_orange_low,),
                              )
                          ),


                          onTap: (){
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
                          },
                          trailing: Text('درباره ما',textAlign: TextAlign.end,style: TextStyle(color: color_sharp_orange_low)),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,
                      Divider(height: 5,thickness: 0.25,color: color_sharp_orange_low,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: color_sharp_orange)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.exit_to_app,color: color_sharp_orange_low,),
                              )
                          ),



                          onTap: (){
                            Navigator.pop(context);
                            // Navigator.pushAndRemoveUntil(context, FadeRoute(page: LoginPage('customer')), (Route<dynamic >route) => false);
                          },
                          trailing: Text('خروج  از حساب',textAlign: TextAlign.end,style: TextStyle(color: color_sharp_orange_low)),
                        ),
                      )
                      ,
                      SizedBox(height: 20,)
                      ,
                      Text( versionName, textAlign: TextAlign.center,style: TextStyle(color: color_sharp_orange_low),)
                      ,
                      SizedBox(height: 10,)

                    ],
                  ),
                )
            )
        ),
      ),
    );

  }
}
