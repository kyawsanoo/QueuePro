import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queue_pro_app/introslider_screen.dart';
import 'package:queue_pro_app/login_screen.dart';
import 'package:queue_pro_app/splash_screen.dart';

import 'home_screen.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

class App extends StatefulWidget {
  const App({super.key});


  @override
  createState() => AppState();

}


class AppState extends State<App> {


  @override
  void initState() {
    super.initState();
    //FlutterNativeSplash.remove();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: TextTheme(
          displaySmall: GoogleFonts.pacifico(),
          displayLarge: const TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          titleSmall: GoogleFonts.oswald(
            color: Colors.blue,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.merriweather(),

        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/intro_slider': (context) => const IntroSliderScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}