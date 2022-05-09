
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:emdad_khodro_saipa/providers/LanguageProvider.dart';
// import 'package:emdad_khodro_saipa/providers/ThemeProvider.dart';
// import 'package:emdad_khodro_saipa/utils/AppLocalizationModule.dart';
// import 'package:emdad_khodro_saipa/utils/Consts.dart';
// import 'package:emdad_khodro_saipa/views/pages/SplashPage.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );


  // LanguageProvider languageProvider = LanguageProvider();
  // await languageProvider.fetchLocale();
  //
  // ThemeProvider themeProvider = ThemeProvider();
  // await themeProvider.fetchTheme();

  runApp(
      MyApp()
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider<ThemeProvider>(create: (_)=>themeProvider),
      //     ChangeNotifierProvider<LanguageProvider>(create: (_)=>languageProvider,)
      //   ],
      //   child: MyApp(),
      // )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(
          child: Container(
            child: Text('Welcome to Emdad Khodro App'),
          ),
        ),
      ),
    );
  }
}



/*

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loyalty Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        //GlobalWidgetsLocalizations.delegate,//for layout direction in different language
        //GlobalCupertinoLocalizations.delegate,//for ios cupertino layout direction in different language
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa'),
        const Locale('en'),
      ],
      locale : context.watch<LanguageProvider>().getAppLocal,
      localeResolutionCallback: (locale,Iterable<Locale> supportedLocal){
        print('$LogTag - -------- ${locale!.languageCode}');
        return locale;
      },
      theme: context.watch<ThemeProvider>().getThemeData,
      home: SplashPage(),
    );
  }
}

 */


