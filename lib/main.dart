

import 'package:emdad_khodro_saipa/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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




      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
    );
  }
}



