import 'dart:ui';


import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
import 'package:emdad_khodro_saipa/models/response_model/UrgentRequestResponse.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/emdad_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/home_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/questionnaire_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/subscribe/subscribe_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/user_profile_tab.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import 'drawer.dart';
import 'login/login/login_page.dart';
import 'menu_side/about_us.dart';
import 'menu_side/settings.dart';
import 'menu_side/social_responsibility.dart';
import 'menu_side/user_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void goToWidget2() {
    setState(() {
      _selectedIndex = 1;
    });
  }




  // List<Widget> _items = [
  //   HomeTab(goToWidget2: goToWidget2),
  //   SubscribeTab(),
  //   // EmdadTab(),
  //   QuestionnaireTab(),
  //   UserProfileTab()
  // ];
  int _selectedIndex = 0;

  getSharedPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(
        'this is shared in home ==== > ${sharedPreferences.getBool('loggedIn')}');
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void _onImediateEmdadButtonTap() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MessageDialogWidget(
            body: 'نیاز به امداد ضروری دارید؟',
            dismissable: true,
            positiveTxt: 'بله',
            positiveFunc: () async {
              // showDialog(context: context, builder: (BuildContext context){
              //   return CircleLoadingWidget(
              //     dismissable: false,
              //     msgTxt: 'در حال ثبت درخواست',
              //   );
              // });
              // // await Future.delayed(Duration(seconds: 3));
              // // Navigator.of(context).pop();
              sendUrgentRequest();
            },
          );
        });
  }

  void _onFloatingActionButtonTap() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MessageDialogWidget(
              dismissable: true,
              positiveTxt: 'برقراری تماس',
              body: 'تماس مستقیم با پشتیبانی امداد خودرو سایپا؟',
              positiveFunc: () async {
                const url = "tel:096550";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              });
        });
  }

  void sendUrgentRequest() async {
    UrgentRequestResponse response = await ApiProvider.sendUrgentRequest();
    if (response.resultCode == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              body: '   درخواست شما با موفقیت ثبت شد،کد پیگیری  شما ${response.data!.trackingCode} میباشد همکاران ما تا دقایقی دیگر با شما تماس خواهند گرفت. ',
              positiveTxt: 'باشه',
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              body: 'عملیات با خطا مواجه شد.مجددا تلاش کنید',
              positiveTxt: 'باشه',
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedPref();
    // _hiveDb.getData(car, 'userBox');
  }

  Widget body() {
    switch (_selectedIndex) {
      case 0:
        return HomeTab(goToWidget2);
      case 1:
        return SubscribeTab();
      case 2:
        return EmdadTab();
      case 3:
        return QuestionnaireTab();
      case 4:
        return UserProfileTab();
    }
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            // 'assets/images/emdad_khodro_logo_white_text.png',
            'assets/images/emdad_khodro_logo.png',
            // height: 30,
            width: MediaQuery.of(context).size.width * 0.45,
            fit: BoxFit.contain,
          ),
          actions: [
            InkWell(
              onTap: () {
                _onImediateEmdadButtonTap();
              },
              child: Container(
                  margin: EdgeInsets.only(left: defaultPadding),
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor),
                  child: Image.asset(
                    'assets/images/alert.png',
                  )),
            )
          ],
        ),
        drawer: DrawerWidget(context),
        // body: _items[_selectedIndex],
        body: body(),
        // body: Center(
        //     child: IndexedStack(
        //         index: _selectedIndex,
        //         children: _items) //_items.elementAt(_index),
        //     ),
        bottomNavigationBar: _showBottomNav(),
        /*
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            _onFloatingActionButtonTap();
          },
          child: Icon(Icons.phone),
          backgroundColor: Theme.of(context).accentColor,

        ),

         */


        //floating action button
        /*
        floatingActionButton: InkWell(
          onTap: () {
            _onFloatingActionButtonTap();
          },
          enableFeedback: true,
          child: Container(
            height: 45,
            width: 140,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Theme.of(context).accentColor),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تماس با 096550',
                    style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: defaultPadding / 4,
                  ),
                  Icon(Icons.phone, color: Colors.white, size: 20),
                ],
              ),
            )),
          ),
        ),

         */
      ),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'خانه',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'اشتراک',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.miscellaneous_services),
          label: 'امداد',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fact_check_rounded),
          label: 'نظرسنجی',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'پروفایل',
        ),
      ],
      currentIndex: _selectedIndex,
      // selectedItemColor: secondary_light_purple_color,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }




}
