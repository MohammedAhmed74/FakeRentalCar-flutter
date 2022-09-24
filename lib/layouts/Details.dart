import 'package:flutter/material.dart';

import 'BottomSheetScreen.dart';

class Details extends StatelessWidget {
  final String image;
  final String title;

  final String description;
  Details({required this.image, required this.description, required this.title});
  var heightfactor;
 
 
  

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).orientation == Orientation.landscape
        ? heightfactor = 0.85
        : heightfactor = 0.93;
    

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        /* appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
        ), */
        //backgroundColor: Color(0xff044928),
        body: Stack(
          children: [
            Container(
              color: Color(0xff044928),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        heightfactor,
                    padding: EdgeInsets.only(left: 15, right: 15, top: 35),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffFBB917),
                            Color(0xffFBB917),
                            Color(0xff044928)
                          ]),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  '$title',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Image(
                                  image: AssetImage('$image'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(children: [
                              Text(
                                description,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              /*  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                ),
                              ),
                              backgroundColor: Color(0xffFBB917), */

                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              builder: (_) {
                                return BottomSheetScreen();
                              });
                        },
                        child: Text(
                          'BOOK NOW',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}