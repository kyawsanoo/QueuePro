import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:queue_pro_app/screens/complete_profile_screen.dart';
import 'package:queue_pro_app/screens/home_screen.dart';
import 'package:queue_pro_app/screens/introslider_screen.dart';
import 'package:queue_pro_app/screens/login_screen.dart';
import 'package:queue_pro_app/screens/otp_screen.dart';
import 'package:queue_pro_app/screens/signup_screen.dart';
import 'package:queue_pro_app/screens/splash_screen.dart';
import 'package:queue_pro_app/screens/vehicle_info_screen.dart';
import 'package:queue_pro_app/screens/verification_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: TextTheme(
          displaySmall: GoogleFonts.pacifico(),
          displayLarge: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
          titleSmall: GoogleFonts.oswald(
            color: Colors.black38,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: GoogleFonts.merriweather(),

        ),

      ),

      initialRoute: '/',
      routes: {
        //'/intro_slider': (context) => const SplashScreen(),
        '/': (context) => const IntroSliderScreen(),
        '/otp':(context) => const OtpScreen(),
        '/verification':(context) => const VerificationScreen(),
        '/complete_profile':(context) => const CompleteProfileScreen(),
        '/vehicle_info':(context) => const VehicleInfoScreen(),
        '/login': (context) => const LoginScreen(),
        "/signup": (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
      },
      builder: EasyLoading.init(),
    );
  }
}