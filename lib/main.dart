

import 'package:emdad_khodro_saipa/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants.dart';
import 'views/pages/home_page.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );



  runApp(
      MyApp()
  );
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Emdad Khodro',



      // home: SplashPage(),
      home: HomePage(),

      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      locale: Locale("fa", "IR"),



      darkTheme: ThemeData(
        // scaffoldBackgroundColor: dark_theme_white_low,
        primaryColor: dark_theme_primary,


        appBarTheme: AppBarTheme(
          color: dark_theme_primary,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: dark_theme_secondary
          ),
            actionsIconTheme: IconThemeData(
                color: dark_theme_secondary
            ),


        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: dark_theme_primary,
          unselectedItemColor: dark_theme_white,
          selectedItemColor: dark_theme_secondary,
          selectedLabelStyle: TextStyle(color: dark_theme_white),
          unselectedLabelStyle: TextStyle(color: dark_theme_white),
          showUnselectedLabels: true,
          showSelectedLabels: true
        ),

        accentColor: dark_theme_secondary,
        backgroundColor: dark_theme_primary,

        navigationBarTheme: NavigationBarThemeData(
          backgroundColor:dark_theme_primary,
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            color: dark_theme_white
          )),
          indicatorColor: dark_theme_secondary,
          iconTheme: MaterialStateProperty.all(IconThemeData(
            color: dark_theme_primary_light
          ))
        )
      ),






      theme: ThemeData(

        backgroundColor: dark_theme_white_low,
        primaryColor: dark_theme_primary,
        fontFamily: 'Vazir',
        accentColor: dark_theme_secondary,
      ),
      themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.dark,
    );
  }
}



