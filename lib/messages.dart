import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
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
                        icon: Icon(Icons.access_alarms_rounded),
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
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.access_alarms_rounded),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(
                              9,
                              9,
                            ),
                            blurRadius: 5,
                          ),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.only(left: 10, right: 2),
                          ),
                          Expanded(
                            child: Text("Y"),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text("Y1"),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text("Y2"),
                            flex: 1,
                          ),
                          Container(
                            height: 20,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors
                                  .amber, // Warna latar belakang Container
                              borderRadius: BorderRadius.circular(
                                  8.0), // Mengatur sudut Container
                            ),
                            child: Text(
                              'Selesai',
                              style: TextStyle(
                                fontSize: 16.0, // Ukuran teks
                                color: Colors.white, // Warna teks
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
