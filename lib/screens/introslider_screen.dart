import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';


class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({super.key});

  @override
  State<IntroSliderScreen> createState() => IntroSliderScreenState();
}

class IntroSliderScreenState extends State<IntroSliderScreen> {
  CarouselController buttonCarouselController = CarouselController();
  List<Intro> list = [
    Intro("Make payments safety and quickly with Queue Pro", "Make payments safety and quickly with Queue Pro", "assets/images/intro_slide_1.jpg"),
    Intro("First and simple to make reservation and check in", "First and simple to make reservation and check in", "assets/images/intro_slide_2.jpg"),
    Intro("Easily find CNG gas stations around you", "Easily find CNG gas stations around you", "assets/images/intro_slide_3.jpg"),
  ];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _current = 0;
  }

  void onSkipPress() {
    onDonePress();
  }

  void onDonePress() {
    Navigator.pushNamed(context, '/otp');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //title: Text("Home", style: Theme.of(context).textTheme.headlineLarge),
           title: Column(children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(context.tr('language'), style: Theme.of(context).textTheme.titleSmall),
                  IconButton(
                    icon: const Icon(Icons.language_outlined),
                    onPressed: () {
                      bool isEng = context.locale == const Locale('en');
                      if(isEng) {
                        context.setLocale(const Locale('my'));
                      }
                      else {
                        context.setLocale(const Locale('en'));
                      }

                      setState(() {

                        debugPrint("language changed");
                      });

                    },
                  ),

                ],)
            ],)
        ),
        body:
                      Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/intro_slide_bg.jpg"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.yellow.withOpacity(0.9),
                                BlendMode.dstATop,
                              ),

                            ),

                          ),
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            CarouselSlider(
                              items: list
                                  .map((item) =>
                                  Container(
                                      padding: EdgeInsets.only(top:10, bottom: 10, left: 10, right: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.transparent),
                                      child:
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding:EdgeInsets.all(10),
                                            //width: MediaQuery.sizeOf(context).width,
                                            height: 280,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            child:Image.asset(
                                              item.img!,
                                              fit: BoxFit.fill,
                                            ),),


                                          const SizedBox(height: 20,),
                                          Text("${item.title}", style: const TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold)),

                                          const SizedBox(height: 10,),
                                          Text("${item.description}", style: const TextStyle(fontSize: 18, color: Colors.grey)),

                                          const SizedBox(height: 20,),
                                          Text("${item.title}", style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),

                                          const SizedBox(height: 10,),
                                          Text("${item.description}", style: const TextStyle(fontSize: 18, color: Colors.grey)),

                                        ],)

                                  ))
                                  .toList(),
                              carouselController: buttonCarouselController,
                              options: CarouselOptions(
                                height: 700,
                                aspectRatio: 16/9,
                                viewportFraction: 1,
                                //viewportFraction: 0.8,
                                initialPage: 0,
                                autoPlay: false,
                                enlargeCenterPage: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },

                              ),
                            ),

                            const SizedBox(height: 20,),
                            Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              list.asMap().entries.map((entry) {
                                return Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness == Brightness.dark
                                          ? Colors.white
                                          : Colors.cyan)
                                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                );
                              }).toList(),
                            ),),


                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {onSkipPress();},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(150, 35),
                                    side: const BorderSide(width: 2.0, color: Colors.blue),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: Text(LocaleKeys.skip.tr(), style: const TextStyle(color: Colors.blue)),
                                ),
                                const SizedBox(width: 20,),
                                FilledButton(
                                  style: FilledButton.styleFrom(fixedSize: const Size(150, 35),
                                      backgroundColor: Colors.blue),
                                  onPressed: () {
                                    if(_current==2){
                                      onDonePress();
                                    }
                                    else {
                                      buttonCarouselController.nextPage(
                                          duration: Duration(milliseconds: 300), curve: Curves.linear);
                                    }
                                  },
                                  child: Text(LocaleKeys.next, style: const TextStyle(color: Colors.white),
                                  ),
                                )

                              ],),



                          ]
                      )
                      ),



    );
  }
}

class Intro {
  String? title;
  String? description;
  String? img;
  Intro(this.title, this.description, this.img);

}