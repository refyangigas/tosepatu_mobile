import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';
import 'package:tosepatu_mobile/login_page.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      onSkip: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
        debugPrint("On Skip Called....");
      },
      showPrevNextButton: true,
      showIndicator: true,
      backgourndColor: Colors.white,
      activeDotColor: Colors.amber,
      deactiveDotColor: Colors.grey,
      iconColor: Colors.amber,
      leftIcon: Icons.arrow_circle_left_rounded,
      rightIcon: Icons.arrow_circle_right_rounded,
      iconSize: 30,
      pages: [
        OnBoardingModel(
          image: Image.asset("assets/images/onboarding1.png"),
          title: "SELAMAT DATANG",
          body:
              "Memberikan pelayanan terbaik dan berkualitas, untuk mencuci sepatu kotormu.",
          bodyColor: Color.fromARGB(255, 236, 184, 29),
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/onboarding2.png"),
          title: "BERSIH, CEPAT, DAN BERKUALITAS",
          body:
              "Menjadi kewajiban bagi kami untuk memberikan perawatan terbaik pada sepatu kesayangan customer kami",
          bodyColor: Color.fromARGB(255, 236, 184, 29),
        ),
        OnBoardingModel(
          image: Image.asset("assets/images/onboarding3.png"),
          title: "SOLUSI CEPAT UNTUK SEPATUMU",
          body:
              "Sebagai partner bagi customer yang mampu memberikan solusi terbaik untuk segala macam keluhan pada sepatunya.",
          bodyColor: Color.fromARGB(255, 236, 184, 29),
        ),
      ],
    );
  }
}
