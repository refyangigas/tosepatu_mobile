import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'slider/slider.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.sports_hockey_rounded),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'TOSEPATU',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Shine Your Shoes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  )
                ],
              ),
              slider(),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/group1.png",
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Layanan\nAntar Jemput',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/group2.png",
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Layanan\nCepat',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/group3.png",
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Sepatu Kamu\nDiasuransikan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LAYANAN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2, // Ubah jumlah item sesuai kebutuhan
                  itemBuilder: (context, index) {
                    String imagePath = 'assets/images/card${index + 1}.png';
                    return Container(
                      width: 180.0,
                      height: 180.0,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 0, 0, 0),
                          image: DecorationImage(
                              image: AssetImage(imagePath), fit: BoxFit.cover)),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('GALERI',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Ubah jumlah item sesuai kebutuhan
                  itemBuilder: (context, index) {
                    String imagePath = 'assets/images/galeri${index + 1}.jpeg';
                    return Container(
                      width: 180.0,
                      height: 180.0,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 0, 0, 0),
                          image: DecorationImage(
                              image: AssetImage(imagePath), fit: BoxFit.cover)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
