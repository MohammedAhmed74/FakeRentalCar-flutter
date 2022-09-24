import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../components.dart';
import '../constants.dart';

class BookedCars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body:
            /* Column(
          children: [
            
               Container(
               height: (mediaquery.size.height - mediaquery.padding.top) *
                        0.1,
                child: Text(
                  'Booked Cars',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                padding: EdgeInsets.all(15),
              ), */

            CarouselSlider(
                options: CarouselOptions(
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index, R) {},
                    scrollPhysics: BouncingScrollPhysics(),
                    //viewportFraction: 1, //ONE item shown
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    //autoPlay: true,
                    height:
                        (mediaquery.size.height - mediaquery.padding.top) * 1),
                items: Items.map((element) {
                  return carItem(context, mediaquery, element, true);
                }).toList()),

        //],
        //),
      ),
    );
  }
}
