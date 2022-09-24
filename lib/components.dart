import 'package:flutter/material.dart';
import 'layouts/Details.dart';

Widget carItem(BuildContext context, MediaQueryData mediaquery, Map cars,
    bool bookedScreen) {
  return LayoutBuilder(builder: (ctx, constraint) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => Details(
                    image: cars['img2'],
                    description: cars['description'],
                    title: cars['title'],
                  )),
        );
      },
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 10),
        //width: mediaquery.size.width,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFFBB917),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: constraint.maxHeight * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage('${cars['image']}'), fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '${cars['title']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                   
                   
                   
                       Expanded(
                         flex: 3,
                        child: Padding(
                          
                          padding: const EdgeInsets.only(right: 5),
                          
                            child: Text(
                              '\$${cars['price']}/Day',
                              style: TextStyle(color: Colors.white),
                            
                      
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
             flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                child: Text(
                  '${cars['description']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ElevatedButton(
                  onPressed: null,
                  child: Text(bookedScreen ? 'Details' : 'BOOK NOW'),
                ),
            ),
            
          ],
        ),
      ),
    );
  });
}