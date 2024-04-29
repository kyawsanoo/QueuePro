import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';

Future<void> main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp( EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('my', 'MM')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      //startLocale: true,
      child: const App()
  ),);
}


