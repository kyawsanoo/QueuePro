import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({super.key});

  @override
  State<IntroSliderScreen> createState() => IntroSliderScreenState();
}

class IntroSliderScreenState extends State<IntroSliderScreen> {
  CarouselController buttonCarouselController = CarouselController();
  List<Intro> list = [
    Intro("Make payments safety and quickly with Queue Pro", "Make payments safety and quickly with Queue Pro"),
    Intro("First and simple to make reservation and check in", "First and simple to make reservation and check in"),
    Intro("Easily find CNG gas stations around you", "Easily find CNG gas stations around you"),
  ];
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  void onSkipPress() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //title: Text("Home", style: Theme.of(context).textTheme.headlineLarge),
        ),
        body:

        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                items: list
                    .map((item) =>
                    Container(
                      width: 320,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset(
                          'assets/images/logo.png', color: Colors.red,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 30,),
                        Text("${item.title}", style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10,),
                          Text("${item.description}", style: const TextStyle(fontSize: 15, color: Colors.grey)),
                      ],)

                    ))
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  viewportFraction: 0.85,
                  aspectRatio: 1.3,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                      setState(() {
                      _current = index;
                      });
                  },

                ),
              ),
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                list.asMap().entries.map((entry) {
                    return Container(
                      width: 20.0,
                      height: 20.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    );
                }).toList(),
              ),
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
                    child: const Text('Skip', style: TextStyle(color: Colors.blue)),
                  ),
                const SizedBox(width: 20,),
                FilledButton(
                  style: FilledButton.styleFrom(fixedSize: const Size(150, 35),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    if(_current==2){
                      onSkipPress();

                    }else {
                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }
                  },
                  child: const Text('Next', style: TextStyle(color: Colors.white),
                  ),
                )

                ],),

            ]
        )

    );
  }
}

class Intro {
  String? title;
  String? description;
  Intro(this.title, this.description);

}