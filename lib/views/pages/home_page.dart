import 'dart:ui';


import 'package:emdad_khodro_saipa/data_base/hive_db.dart';
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
  final Uri _urltelegram = Uri.parse('https://t.me/emdadsaipa');
  final Uri _urllinkedin = Uri.parse('https://www.linkedin.com/authwall?trk=ripf&trkInfo=AQG7KfpQ-FOLxgAAAYETvF5oKwOy6t1MLezA9lQXElA3cqrzXDUzSFJGZ-G7e6rUfZBXEJHbSsJPXBc10IA2rEHyA_J5WeQcQM1EfbpiSO0ht1e4a8qOfpbG51WRsd7gOTgUSVk=&original_referer=https://emdadsaipa.ir/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fin%2Femdadsaipa');
  final Uri _urlaparat = Uri.parse('https://www.aparat.com/emdadsaipa');
  final Uri _urlinstagram = Uri.parse('https://www.instagram.com/accounts/login/?next=/emdadsaipa.ir/');
   void _launchUrltelegram() async {
    if (!await launchUrl(_urltelegram)) throw 'Could not launch $_urltelegram';
  }
  void _launchUrlinkedin() async {
    if (!await launchUrl(_urllinkedin)) throw 'Could not launch $_urllinkedin';
  }
  void _launchUrlaparat() async {
    if (!await launchUrl(_urlaparat)) throw 'Could not launch $_urlaparat';
  }
  void _launchUrlinstagram() async {
    if (!await launchUrl(_urlinstagram)) throw 'Could not launch $_urlinstagram';
  }



  List<Widget> _items = [
    HomeTab(),
    SubscribeTab(),
    EmdadTab(),
    QuestionnaireTab(),
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
     // _hiveDb.getData(car, 'userBox');
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
        drawer: DrawerWidget(),
        body: _items[_selectedIndex],
        // body: Center(
        //     child: IndexedStack(
        //         index: _selectedIndex,
        //         children: _items) //_items.elementAt(_index),
        //     ),
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
          label: 'کاربری',
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
                      child: Icon(Icons.account_circle,
                        // color: secondary_light_grey_color,
                      ),
                    )
                ),
                onTap: (){
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>SocialResponsibility ()));
                },
                trailing: Text('مسولیت های اجتماعی',textAlign: TextAlign.end,style: TextStyle(
                  // color: secondary_light_grey_color
                ),),
              ),
            )
            ,
            SizedBox(height: 3,),




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
            // Text( versionName, textAlign: TextAlign.center,style: TextStyle(
            //     // color: secondary_light_grey_color
            // ),),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                     onTap:_launchUrlaparat,
                    child: Image.asset('assets/images/aparat.png',height: 30,width: 30,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: _launchUrltelegram,
                    child: Image.asset('assets/images/telegram.png',height: 30,width: 30,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                     onTap: _launchUrlinstagram,
                    child: Image.asset('assets/images/instagram.png',height: 30,width: 30,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: _launchUrlinkedin,
                    child: Image.asset('assets/images/linkedin.png',height: 30,width: 30,),
                  ),
                ),
              ],
            )

          ],
        )
    );
  }
}
