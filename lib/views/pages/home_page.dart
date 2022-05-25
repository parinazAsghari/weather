import 'dart:ui';

import 'package:emdad_khodro_saipa/views/pages/menu_side/about_us.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/settings.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/user_profile.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/emdad_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/questionnaire_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/subscribe/subscribe_tab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'login_page.dart';

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


  getSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('this is shared in home ==== > ${sharedPreferences.getBool('loggedIn')}');
  }



  void _onTap(int index)
  {
    _selectedIndex = index;
    setState(() {

    });
  }


  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=> false,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          actions: [
            Image.asset('assets/images/emdad_khodro_logo_white_text.png', height: 30,width: MediaQuery.of(context).size.width*0.39, fit: BoxFit.contain,),
          ],

        ),

        drawer: DrawerWidget(),

        body:Stack(
          children: [
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image.asset('assets/images/img_bg_orange.png', fit: BoxFit.cover,),
            ),

            Center(
                child: IndexedStack(
                    index: _selectedIndex,
                    children: _items
                )//_items.elementAt(_index),
            ),
          ],
        ),
        bottomNavigationBar: _showBottomNav(),
      ),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
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
      // selectedItemColor: secondary_light_purple_color,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,

    );
  }




  Widget DrawerWidget(){
    return Drawer(
        // backgroundColor: secondary_dark_purple_color,
        // elevation: 0,
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
            SizedBox(height: defaultPadding*2,)
            ,
            Image.asset('assets/images/emdad_khodro_logo.png',height: 100)
            ,
            SizedBox(height: 20,)
            ,
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text('کاربر مهمان',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,
                  // color: secondary_light_grey_color
              ),)
              ,

            )
            ,
            SizedBox(height: 20,)
            ,
            Divider(height: 5,thickness: 0.25,
              // color: secondary_light_grey_color,
              indent: 20,endIndent: 20,)
            ,
            SizedBox(height: 3,)
            ,
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 1,
                            // color: primary_orange_color
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(Icons.account_circle,
                        // color: secondary_light_grey_color,
                      ),
                    )
                ),
                onTap: (){
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
                },
                trailing: Text('پروفایل کاربری',textAlign: TextAlign.end,style: TextStyle(
                    // color: secondary_light_grey_color
                ),),
              ),
            )
            ,
            SizedBox(height: 3,)
            ,


            Divider(height: 5,thickness: 0.25,
              // color: secondary_light_grey_color,
              indent: 20,endIndent: 20,)
            ,
            SizedBox(height: 3,)
            ,
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 1,
                            // color: primary_orange_color
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child:
                      Icon(Icons.settings,
                        // color: secondary_light_grey_color,
                      ),
                    )
                ),



                onTap: (){
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Settings()));
                },
                trailing: Text('تنظیمات',textAlign: TextAlign.end,style: TextStyle(
                    // color: secondary_light_grey_color
                ),),
              ),
            )
            ,
            SizedBox(height: 3,)
            ,
            Divider(height: 5,thickness: 0.25,
              // color: secondary_light_grey_color,
              indent: 20,endIndent: 20,)
            ,
            SizedBox(height: 3,)
            ,
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 1,
                            // color: primary_orange_color
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child:
                      Icon(Icons.info,
                        // color: secondary_light_grey_color,
                      ),
                    )
                ),


                onTap: (){
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AboutUs()));
                },
                trailing: Text('درباره ما',textAlign: TextAlign.end,style: TextStyle(
                    // color: secondary_light_grey_color
                )),
              ),
            )
            ,
            SizedBox(height: 3,)
            ,
            Divider(height: 5,thickness: 0.25,
              // color: secondary_light_grey_color,
              indent: 20,endIndent: 20,)
            ,
            SizedBox(height: 3,)
            ,
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 1,
                            // color: primary_orange_color
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child:
                      Icon(Icons.exit_to_app,
                        // color: secondary_light_grey_color,
                      ),
                    )
                ),



                onTap: () async {
                  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
                  await sharedPrefs.setBool('loggedIn', false);

                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                },
                trailing: Text('خروج  از حساب',textAlign: TextAlign.end,style: TextStyle(
                    // color: secondary_light_grey_color
                )),
              ),
            )
            ,
            SizedBox(height: 20,),
            // Expanded(child: Container()),
            Text( versionName, textAlign: TextAlign.center,style: TextStyle(
                // color: secondary_light_grey_color
            ),),
            SizedBox(height: 10,)

          ],
        )
    );
  }
}
