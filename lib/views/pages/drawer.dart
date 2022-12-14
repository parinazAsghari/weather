import 'package:emdad_khodro_saipa/views/pages/menu_side/contact_us.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/product_introduction/product_introduction.dart';
import 'package:emdad_khodro_saipa/views/pages/menu_side/terms_page.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/user_profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import 'login/login/login_page.dart';
import 'menu_side/about_us.dart';
import 'menu_side/settings.dart';
import 'menu_side/social_responsibility.dart';
import 'menu_side/user_profile.dart';

Widget DrawerWidget(BuildContext context) {
  final Uri _urllinkedin = Uri.parse('https://www.linkedin.com/in/emdadsaipa');
  final Uri _urlaparat = Uri.parse('https://www.aparat.com/emdadsaipa');
  final Uri _urlinstagram = Uri.parse('https://www.instagram.com/accounts/login/?next=/emdadsaipa.ir/');
  final Uri _urltelegram = Uri.parse('https://t.me/emdadsaipa');

  void _launchUrlinkedin() async {
    if (!await launchUrl(_urllinkedin)) throw 'Could not launch $_urllinkedin';
  }

  void _launchUrlaparat() async {
    if (!await launchUrl(_urlaparat)) throw 'Could not launch $_urlaparat';
  }

  void _launchUrlinstagram() async {
    if (!await launchUrl(_urlinstagram)) throw 'Could not launch $_urlinstagram';
  }

  void _launchUrltelegram() async {
    if (!await launchUrl(_urltelegram)) throw 'Could not launch $_urltelegram';
  }


  return Drawer(
      backgroundColor: dark_theme_primary_low,
      // elevation: 0,
      child: ListView(
        shrinkWrap: true,
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
          SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/emdad_khodro_logo.png', height: 60),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset(
                  'assets/images/ic_guestuser.png',
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                '?????????? ??????????',
                style: TextStyle(fontWeight: FontWeight.bold),
                // textAlign: TextAlign.end,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     const Directionality(
          //       textDirection: TextDirection.rtl,
          //       child: Text(
          //         '?????????? ??????????',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 16,
          //           // color: secondary_light_grey_color
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          // const SizedBox(
          //   height: 5,
          // ),
          const Divider(
            height: 5, thickness: 0.25,
            // color: secondary_light_grey_color,
            indent: 20, endIndent: 20,
          ),
          const SizedBox(
            height: 3,
          ),

          _itemBoxDrawer(context, '?????????????? ??????????', Icons.account_circle, () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserProfile()));
          }),

          const SizedBox(
            height: 3,
          ),

          // Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          const SizedBox(
            height: 3,
          ),
          _itemBoxDrawer(context, '??????????????', Icons.settings, () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Settings()));
          }),
          const SizedBox(
            height: 3,
          ),
          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          //until

          const SizedBox(
            height: 3,
          ),
          _itemBoxDrawer(context, '?????????? ??????????', Icons.production_quantity_limits, () {
            // Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProductIntroduction()));
          }),
          // const SizedBox(
          //   height: 3,
          // ),

          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          const SizedBox(
            height: 3,
          ),
          _itemBoxDrawer(context, '???????? ???? ????', Icons.call, () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ContactUs()));
          }),

          const SizedBox(
            height: 3,
          ),
          _itemBoxDrawer(context, '???????????? ????', Icons.info, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const AboutUs()));
          }),

          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          const SizedBox(
            height: 3,
          ),

          _itemBoxDrawer(context, '?????????????? ?????? ??????????????', Icons.description, () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SocialResponsibility()));
          }),

          // const SizedBox(
          //   height: 3,
          // ),
          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          // const SizedBox(
          //   height: 3,
          // ),

          // const SizedBox(
          //   height: 3,
          // ),
          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          // const SizedBox(
          //   height: 3,
          // ),
          // _itemBoxDrawer(context,'???????????? ?? ????????????', Icons.rule, (){
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (BuildContext context) => const TermsPage(),),);
          // },),
          // const SizedBox(
          //   height: 3,
          // ),
          // const Divider(
          //   height: 5, thickness: 0.25,
          //   // color: secondary_light_grey_color,
          //   indent: 20, endIndent: 20,
          // ),
          const SizedBox(
            height: 3,
          ),
          _itemBoxDrawer(context, '????????  ???? ????????', Icons.exit_to_app, () async {
            SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
            await sharedPrefs.setBool('loggedIn', false);
            await sharedPrefs.setString('user_phone_number', '');
            await sharedPrefs.setString('user_full_name', '');
            await sharedPrefs.setString('user_national_code', '');

            //TODO remove every storage data - defined cars

            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
          }),
          // const SizedBox(
          //   height: 20,
          // ),

          const SizedBox(
            height: 20,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          // border: Border.all(width: 1,
                          //   // color: primary_orange_color
                          // )
                        ),
                        child: GestureDetector(
                          onTap: _launchUrlinkedin,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              'assets/images/ic_linkedin.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          // border: Border.all(width: 1,
                          //   // color: primary_orange_color
                          // )
                        ),
                        child: GestureDetector(
                          onTap:_launchUrltelegram ,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              'assets/images/telegram.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          // border: Border.all(width: 1,
                          //   // color: primary_orange_color
                          // )
                        ),
                        child: GestureDetector(
                          onTap: _launchUrlinstagram,
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Image.asset(
                              'assets/images/ic_instagram.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          // border: Border.all(width: 1,
                          //   // color: primary_orange_color
                          // )
                        ),
                        child: GestureDetector(
                          onTap: _launchUrlaparat,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Image.asset(
                                'assets/images/aparat.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          )
        ],


      ));
}

Widget _logoBox(String _imagePath, double _marginAll, _onTap) {
  return Container(
      margin: EdgeInsets.all(_marginAll),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        // border: Border.all(width: 1,
        //   // color: primary_orange_color
        // )
      ),
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'assets/images/$_imagePath',
              height: 25,
              width: 25,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ));
}

Widget _itemBoxDrawer(BuildContext context, String _title, IconData _icon, _onTap) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: ListTile(
      leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            // border: Border.all(
            //   width: 1,
            //   // color: primary_orange_color
            // )
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(


              _icon,
              color: Theme.of(context).accentColor,
            ),
          )),
      onTap: _onTap,
      title: Text(
        _title,
        textAlign: TextAlign.start,
      ),
    ),
  );
}

