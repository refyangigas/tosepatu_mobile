import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class status extends StatefulWidget {
  const status({super.key});

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
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
            ],
          ),
        ),
      ),
    );
  }
}
