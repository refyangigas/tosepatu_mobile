import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tosepatu_mobile/login_page.dart';
import 'package:tosepatu_mobile/onboarding.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => onboarding()));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 145, right: 20),
            child: Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                color: Colors.amberAccent,
              ))
        ],
      ),
    );
  }
}
