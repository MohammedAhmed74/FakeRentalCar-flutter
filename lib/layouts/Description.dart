import 'package:flutter/material.dart';

class DesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // main axis alignment : start
    // cross axis alignment : center

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Image(
                          image: NetworkImage(
                              'https://th.bing.com/th/id/R.ada34263b02ddbec14d0906c50793d14?rik=bsTeLc1bCPxtMA&pid=ImgRaw&r=0'),
                        ))),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFE5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'RAZE Rental Cars',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              )),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'RAZE application has designed for leasing cars online from home.',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              'Next screen will provide you all available cars in our car showrooms with its price per day you can choose from them which one do you need by pressing on it so that you can see more info about it to help you make a decision then you should fill all required data to book any car.',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              margin: EdgeInsets.all(20),
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )),
                              width: double.infinity,
                              child: MaterialButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  'LETS GO',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 15,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
