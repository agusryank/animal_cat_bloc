import 'package:flutter/material.dart';
import 'package:latihan_bloc/widget/custom_widget.dart';
import 'package:lazyui/lazyui.dart' hide Poslign;

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
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Iconr(
                      Icons.search,
                      color: Colors.grey,
                      margin: Ei.only(r: 20),
                    ),
                    Textr(
                      'Find best vaccinate, treatment...',
                      style: TextStyle(color: Colors.grey),
                    )
                  ])),
            ),

            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  padding: Ei.all(15),
                  itemCount: 5,
                  separatorBuilder: ((context, index) => SizedBox(width: 10)),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    List<String> text = [
                      'Vaccinate',
                      'Treatment',
                      'Grooming',
                      'Pet Shop',
                      'Pet Hotel'
                    ];

                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Color(0xFF818AF9)
                            : Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        text[index],
                        style: Gfont.fs18.copyWith(
                            color: index == 0 ? Colors.white : Colors.black38),
                      )),
                    );
                  })),
            ),

            ListView.separated(
                separatorBuilder: ((context, index) => SizedBox(height: 10)),
                itemCount: 10,
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 130,
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GetImage(
                              'https://plus.unsplash.com/premium_photo-1661962620229-614e281fe009?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: Col(
                            children: [
                              Textr('Dr. John Doe',
                                  margin: EdgeInsets.only(bottom: 10),
                                  style: Gfont.fs19
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Textr('Service : Vaccinate',
                                  margin: EdgeInsets.only(bottom: 10),
                                  style: Gfont.fs16),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Iconr(Ti.mapPin,
                                        color: Colors.grey, size: 25),
                                    Textr(
                                      '10 km',
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: Maa.spaceBetween,
                                children: [
                                  Textr(
                                    'Available For ',
                                    style: Gfont.fs18
                                        .copyWith(color: Colors.green),
                                  ),
                                  Row(
                                    children: [
                                      GetImage(
                                        'icon-cat.svg',
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
                                      GetImage(
                                        'icon-dog.svg',
                                        size: 25,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }))
          ],
        ),
      )),
    );
  }
}
