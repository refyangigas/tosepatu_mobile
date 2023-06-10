import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tosepatu_mobile/login_page.dart';
import 'package:tosepatu_mobile/onboarding.dart';
import 'package:tosepatu_mobile/bottomnav.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('user_id');

      if (userId != null) {
        // Pengguna sudah tersimpan di dalam SharedPreferences, langsung navigasi ke bottomnav
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => bottomnav(currentTab: 2)),
        );
      } else {
        // Pengguna belum tersimpan di dalam SharedPreferences, tampilkan onboarding
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => onboarding()),
        );
      }
    });
  }

  @override
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
            ),
          ),
        ],
      ),
    );
  }
}
