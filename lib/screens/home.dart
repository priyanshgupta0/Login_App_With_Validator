import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);
  bool search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            height: 40,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                icon: Icon(CupertinoIcons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Search",
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.bell,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  height: 100,
                  width: 375,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      "https://www.corporatetelecom.biz/wp-content/uploads/2018/03/Iphone-10-web-banner.jpg",
                      fit: BoxFit.cover,
                    ),
                    elevation: 10,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Row(
            //   children: [
            //     SingleChildScrollView(
            //       child: Container(
            //         height: 10,
            //         width: 10,
            //         child: Card(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20)),
            //           elevation: 5,
            //           color: Colors.cyan,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        )));
  }
}
