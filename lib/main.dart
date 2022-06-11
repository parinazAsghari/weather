import 'package:emdad_khodro_saipa/models/car.dart';
import 'package:emdad_khodro_saipa/models/user.dart';
import 'package:emdad_khodro_saipa/views/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'views/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CarAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (_,ThemeMode mode, __){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'امداد خودرو سایپا',

            home: SplashPage(),
            // home: HomePage(),

            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("fa", "IR"),
            ],
            locale: Locale("fa", "IR"),

            themeMode: mode,

            //saipa color set
            theme: ThemeData(
                fontFamily: 'Vazir',
                scaffoldBackgroundColor: light_theme_background_light,
                primaryColor: light_theme_primary,
                cardColor: light_theme_box_background_light,
                shadowColor: light_theme_box_shadow_dark,
                accentColor: light_theme_secondary,
                backgroundColor: light_theme_primary,
                primaryColorLight: light_theme_primary_low,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(light_theme_primary),
                        textStyle: MaterialStateProperty.all(
                            TextStyle(
                                color: light_theme_white
                            )
                        )

                    )
                ),
                appBarTheme: AppBarTheme(
                  color: light_theme_primary,
                  centerTitle: true,
                  titleTextStyle: TextStyle(color: light_theme_white,fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
                  iconTheme: IconThemeData(color: light_theme_secondary),
                  actionsIconTheme: IconThemeData(color: light_theme_secondary),
                ),
                tabBarTheme: TabBarTheme(
                    labelColor: light_theme_secondary,
                    unselectedLabelColor: light_theme_primary_light
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: light_theme_primary,
                    unselectedItemColor: light_theme_white,
                    selectedItemColor: light_theme_secondary,
                    selectedLabelStyle: TextStyle(color: light_theme_white),
                    unselectedLabelStyle: TextStyle(color: light_theme_white),
                    showUnselectedLabels: true,
                    showSelectedLabels: true),
                navigationBarTheme: NavigationBarThemeData(
                    backgroundColor: light_theme_primary,
                    labelTextStyle:
                    MaterialStateProperty.all(TextStyle(color: light_theme_white)),
                    indicatorColor: light_theme_secondary,
                    iconTheme: MaterialStateProperty.all(
                        IconThemeData(color: light_theme_primary_light)))),



            darkTheme: ThemeData(
                fontFamily: 'Vazir',
                scaffoldBackgroundColor: dark_theme_background_light,
                primaryColor: dark_theme_primary,
                cardColor: dark_theme_box_background_light,
                shadowColor: dark_theme_box_shadow_dark,
                accentColor: dark_theme_secondary,
                backgroundColor: dark_theme_primary,
                primaryColorLight: dark_theme_primary_low,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(dark_theme_primary),
                        textStyle: MaterialStateProperty.all(
                            TextStyle(
                                color: dark_theme_white
                            )
                        )

                    )
                ),
                appBarTheme: AppBarTheme(
                  color: dark_theme_primary,
                  centerTitle: true,
                  titleTextStyle: TextStyle(color: dark_theme_white,fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
                  iconTheme: IconThemeData(color: dark_theme_secondary),
                  actionsIconTheme: IconThemeData(color: dark_theme_secondary),
                ),
                tabBarTheme: TabBarTheme(
                    labelColor: dark_theme_secondary,
                    unselectedLabelColor: dark_theme_primary_light
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: dark_theme_primary,
                    unselectedItemColor: dark_theme_white,
                    selectedItemColor: dark_theme_secondary,
                    selectedLabelStyle: TextStyle(color: dark_theme_white),
                    unselectedLabelStyle: TextStyle(color: dark_theme_white),
                    showUnselectedLabels: true,
                    showSelectedLabels: true),
                navigationBarTheme: NavigationBarThemeData(
                    backgroundColor: dark_theme_primary,
                    labelTextStyle:
                    MaterialStateProperty.all(TextStyle(color: dark_theme_white)),
                    indicatorColor: dark_theme_secondary,
                    iconTheme: MaterialStateProperty.all(
                        IconThemeData(color: dark_theme_primary_light)))),


          );

        });
  }
}
