import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/views/pages/drawer.dart';
import 'package:emdad_khodro_saipa/views/pages/new_ui/home_tab_new.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/emdad_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/questionnaire_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/subscribe/subscribe_tab.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/user_profile_tab.dart';
import 'package:flutter/material.dart';

class HomePageNewUi extends StatefulWidget {
  const HomePageNewUi({Key? key}) : super(key: key);

  @override
  _HomePageNewUiState createState() => _HomePageNewUiState();
}

class _HomePageNewUiState extends State<HomePageNewUi> {
  List<Widget> _items = [HomeTabNew(), SubscribeTab(), EmdadTab(), QuestionnaireTab(), UserProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(color: Colors.white, iconTheme: IconThemeData(color: Theme.of(context).accentColor)),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            'assets/images/emdad_khodro_logo.png',
            // height: 30,
            width: MediaQuery.of(context).size.width * 0.45,
            fit: BoxFit.contain,
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.only(left: defaultPadding),
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).accentColor),
                  child: Image.asset(
                    'assets/images/alert.png',
                  )),
            )
          ],
        ),
        drawer: DrawerWidget(context),
        bottomNavigationBar: _showBottomNav(),
        body: _items[_selectedIndex],
      ),
    );
  }

  int _selectedIndex = 0;

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

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
