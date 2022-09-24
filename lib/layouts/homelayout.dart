import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:raze/constants.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components.dart';
import 'Description.dart';

class Homelayout extends StatefulWidget {
  @override
  _HomelayoutState createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final islandscape = mediaquery.orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Raze',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2),),
          
          actions: [
            Padding(
              padding:EdgeInsets.only(right: 10),
              
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => DesScreen()));
                },
                icon: Icon(
                  Icons.info,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          decoration: BoxDecoration(
            //color: Color(0xFF2F3839),
            image: DecorationImage(
              fit: BoxFit.cover,
              /*  colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop), */
              image: AssetImage('assets/images/b.jpg'),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Rent Now',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, R) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      scrollPhysics: BouncingScrollPhysics(),
                      //viewportFraction: 1, //ONE item shown
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      //autoPlay: true,
                      height: islandscape
                          ? (mediaquery.size.height - mediaquery.padding.top) *
                              0.8
                          : (mediaquery.size.height - mediaquery.padding.top) *
                              0.6,
                    ),
                    items: Items.map((element) {
                      return carItem(context, mediaquery, element, false);
                    }).toList()),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    /*   onDotClicked: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    }, */
                    count: Items.length,
                    effect: SlideEffect(
                      activeDotColor: Color(0xFFF2E7B1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
