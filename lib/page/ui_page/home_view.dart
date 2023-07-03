import 'package:flutter/material.dart';
import 'package:latihan_bloc/widget/custom_widget.dart';
import 'package:lazyui/lazyui.dart' hide Poslign, GetImage;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Text Header ========================================
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
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
                  IconButton(
                      onPressed: () {},
                      icon: GetImage(
                        'shopping-bag.svg',
                        size: 200,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text Header ========================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
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
                      Poslign(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: GetImage(
                              'bubble.svg',
                              fit: BoxFit.fill,
                            ),
                          )),
                      Poslign(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                            width: 250,
                            height: 250,
                            child: GetImage('bengal-kitten-isolated.png')),
                      ),
                      Container(
                        padding: EdgeInsets.all(25),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Col(children: [
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Your',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                                TextSpan(
                                    text: ' Catrine',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18)),
                                TextSpan(
                                    text: ' will get vaccination',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                TextSpan(
                                    text: ' tomorrow at 07.00 am!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))
                              ])),
                          SizedBox(height: 10),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white.withOpacity(0.2)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {},
                              child: Text(
                                'See details',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ))
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Text Header ========================================
            SizedBox(
              height: 15,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Iconr(
                          Icons.search,
                          color: Colors.grey,
                          margin: Ei.only(r: 20),
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Find best vaccinate, treatment...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        )
                      ])),
            ),

            SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                    itemCount: 5,
                    separatorBuilder: ((context, index) => SizedBox(width: 10)),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          'Catrine',
                          style: TextStyle(color: Colors.grey),
                        )),
                      );
                    })),
              ),
            )
          ],
        ),
      )),
    );
  }
}
