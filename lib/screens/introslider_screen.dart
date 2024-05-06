import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //title: Text("Home", style: Theme.of(context).textTheme.headlineLarge),
           title: Column(children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(context.tr('language'), style: Theme.of(context).textTheme.titleSmall),
                  IconButton(
                    icon: const Icon(Icons.language_outlined, color: Colors.white,),
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
                  const SizedBox(width: 10,)

                ],)
            ],)
        ),
        body:
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage("assets/images/intro_slide_bg.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.8),
                      BlendMode.dstATop,
                    ),

                  ),

                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //margin: EdgeInsets.only(top: 20),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(flex: 8, child: Container(color: Colors.transparent, child: CarouselSlider(
                        items: list
                            .map((item) =>
                            Container(
                              //color: Colors.white,
                                    decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))
                              ),
                                child:
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(flex: 4, child: Container(
                                      //color:Colors.yellow,

                                  child:
                                      /*Center(child:Image.asset(
                                        item.img!,
                                        fit: BoxFit.fill,
                                      ),)*/
                                      FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.asset(item.img!),
                                      )
                                    )),
                                    const SizedBox(height: 10,),

                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                      color: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.center, children: [
                                         Expanded(flex:2, child:
                                        Container(padding: const EdgeInsets.all(5),
                                          /*color: Colors.green,*/child: Center(child:Text("${item.title}", style: const TextStyle(fontSize: 22, color: Colors.blue, fontWeight: FontWeight.bold)),),)),

                                      Expanded(flex: 1, child:Container(padding: EdgeInsets.all(5), /*color: Colors.red,*/
                                        child: Center(child: Text("${item.description}", style: const TextStyle(fontSize: 16, color: Colors.black38)),),)),


                                    ],)
                                      ,),)

                                  ],)

                            ))
                            .toList(),
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          height: MediaQuery.sizeOf(context).height,
                          //aspectRatio: 16/9,
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
                      )),
                      const SizedBox(height: 10),
                      Expanded(

                        child:
                      Container(
                        //color: Colors.yellow,
                        child: Row(
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
                      ),),),
                      const SizedBox(height: 10,),
                      Expanded(
                          child:
                          Container(
                            //color: Colors.green,
                            child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),

                              Expanded(flex:2, child: OutlinedButton(
                                onPressed: () {onSkipPress();},
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 45),
                                  side: const BorderSide(width: 2.0, color: Colors.blue),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                child: Text(LocaleKeys.skip.tr(), style: const TextStyle(color: Colors.blue)),
                              ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(flex:2, child: FilledButton(
                                style: FilledButton.styleFrom(fixedSize: const Size(150, 45),
                                    backgroundColor: Colors.blue),
                                onPressed: () {
                                  if(_current==2){
                                    onDonePress();
                                  }
                                  else {
                                    buttonCarouselController.nextPage(
                                        duration: const Duration(milliseconds: 300), curve: Curves.linear);
                                  }
                                },
                                child: Text(LocaleKeys.next.tr(), style: TextStyle(color: Colors.white),
                                ),
                              )
                              ),
                              const Spacer(),


                            ],), )

                      )

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