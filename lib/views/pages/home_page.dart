import 'dart:ui';


import 'package:emdad_khodro_saipa/views/pages/tabs/emdad_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/questionnaire_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/subscribe/subscribe_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/user_profile_tab.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import 'drawer.dart';
import 'login/login/login_page.dart';
import 'menu_side/social_responsibility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  List<Widget> _items = [
    HomeTab(),
    QuestionnaireTab(),
    EmdadTab(),
    SubscribeTab(),
    UserProfileTab()
  ];
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

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MessageDialogWidget(
                      body:
                          'درخواست شما با موفقیت ثبت شد، همکاران ما تا دقایقی دیگر با شما تماس خواهند گرفت.',
                      positiveTxt: 'باشه',
                    );
                  });
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

  @override
  void initState() {
    super.initState();
    getSharedPref();
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
            'assets/images/emdad_khodro_logo_white_text.png',
            height: 30,
            width: MediaQuery.of(context).size.width * 0.35,
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
        body: Center(
            child: IndexedStack(
                index: _selectedIndex,
                children: _items) //_items.elementAt(_index),
            ),
        bottomNavigationBar: _showBottomNav(),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            _onFloatingActionButtonTap();
          },
          child: Icon(Icons.phone),
          backgroundColor: Theme.of(context).accentColor,
        ),
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
          icon: Icon(Icons.fact_check_rounded),
          label: 'نظرسنجی',
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
          icon: Icon(Icons.person),
          label: 'کاربری',
        ),
      ],
      currentIndex: _selectedIndex,
      // selectedItemColor: secondary_light_purple_color,
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

}
