import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: CarouselSlider(
          items: _imagePath.map((image) {
            return Image.asset(image);
          }).toList(),
          options: CarouselOptions(height: 400.0),
        ),
      ),
    );
  }
}
