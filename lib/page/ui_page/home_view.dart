import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Hello, ',
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                  TextSpan(
                      text: 'Human !',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ])),
                IconButton(onPressed: () {}, icon: Icon(Icons.shop_2))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 106, 116, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Stack(
                  children: [
                    Positioned(
                      top: -100,
                      left: -350,
                      right: -90,
                      bottom: 50,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                tileMode: TileMode.clamp,
                                colors: [
                                  Color(0xFF818AF9).withOpacity(0),
                                  Color.fromARGB(255, 206, 163, 255),
                                ]),
                            shape: BoxShape.circle),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      left: -90,
                      right: -350,
                      bottom: -20,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF818AF9).withOpacity(0),
                                  Color(0xFF818AF9).withOpacity(1),
                                ]),
                            color: Colors.black,
                            shape: BoxShape.circle),
                      ),
                    ),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                          'assets/images/bengal-kitten-isolated.png'),
                    )),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(children: [
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Your',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                                TextSpan(
                                    text: ' Catrine',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20)),
                                TextSpan(
                                    text: ' will get vaccination',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                TextSpan(
                                    text: ' tomorrow at 07.00 am!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ])),
                        ]),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
