import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tosepatu_mobile/profile.dart';
import 'package:tosepatu_mobile/splash_screen.dart';
import 'package:tosepatu_mobile/status.dart';

import 'login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Untuk mengunci orientasi aplikasi
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
