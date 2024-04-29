
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
        Column(children: [
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(context.tr('language'), style: Theme.of(context).textTheme.titleSmall),
              IconButton(
                icon: const Icon(Icons.language_outlined),
                tooltip: 'English',
                onPressed: () {
                  setState(() {
                    context.setLocale(const Locale('en'));
                  });

                },
              ),

            ],)
        ],)


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png', color: Colors.red,
              width: 120.0,
              height: 120.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20,),
            Text(
                context.tr('title'),
                style: Theme.of(context).textTheme.displayLarge
            ),
          ],
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/intro_slider');
    });

  }
}
