import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
// import './image_screen.dart';

class CarouselModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.height * 0.5,
            child: Carousel(
              boxFit: BoxFit.cover,
              images: [
                AssetImage('assets/images/salon_image.jpg'),
                AssetImage('assets/images/image5.jpg'),
                AssetImage('assets/images/image2.jpg'),
                AssetImage('assets/images/image4.jpg'),
                AssetImage('assets/images/image3.jpg'),
              ],
              // borderRadius: true,
              // radius: Radius.circular(30),
              autoplay: false,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 6.0,
              // height: 400.0,
            )));
  }
}
