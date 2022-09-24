import 'package:flutter/material.dart';

import 'layouts/homelayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Raze App',
      theme: ThemeData(
        primaryColor: Color(0xffFBB917),
        iconTheme:IconThemeData(color: Colors.white) ,
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          
          style: ButtonStyle(
           // padding: MaterialStateProperty<EdgeInsetsGeometry>(),
            foregroundColor:MaterialStateProperty.all(Colors.black54) ,
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                // side: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ),
        scaffoldBackgroundColor: Color(0xFF2F3839),
         appBarTheme: AppBarTheme(
         
          //elevation: 0.0,
         
          titleTextStyle: TextStyle(
        
            fontWeight: FontWeight.bold,
            
          ),
        ),
        /*bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
        ), */
      ),
      home: Homelayout(),
    );
  }
}
