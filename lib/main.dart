

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



      theme: ThemeData(
        backgroundColor: primary_grey_color,
        primaryColor: primary_grey_color,
        fontFamily: 'Vazir',
        accentColor: primary_orange_color,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}



