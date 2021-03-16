import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselController = CarouselController();
  final _imagePath = [
    'assets/images/img0.jpg',
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Testing"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 350,
              child: CarouselSlider(
                carouselController: carouselController,
                items: _imagePath.map((image) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        image,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 400,
                  onPageChanged: (index, reason) {
                    print("page changed, $reason");
                  },
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      carouselController.previousPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.decelerate,
                      );
                    },
                    child: Icon(
                      Icons.arrow_left,
                      size: 30.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      carouselController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.decelerate,
                      );
                    },
                    child: Icon(
                      Icons.arrow_right,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
