import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({super.key});

  @override
  State<IntroSliderScreen> createState() => IntroSliderScreenState();
}

class IntroSliderScreenState extends State<IntroSliderScreen> {
  CarouselController buttonCarouselController = CarouselController();
  List<int> list = [1, 2, 3];


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
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset(
                          'assets/images/logo.png', color: Colors.red,
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.fill,
                        ),

                        Text("Item  $item"),
                      ],)

                    ))
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 1,
                ),
              ),
              const SizedBox(height: 100,),
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
                    buttonCarouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
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