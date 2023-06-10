import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class sliderorder extends StatefulWidget {
  const sliderorder({super.key});

  @override
  State<sliderorder> createState() => _sliderorderState();
}

class _sliderorderState extends State<sliderorder> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage(
        'assets/images/card1.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
          'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        'assets/images/card2.png',
      ),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CustomCarouselSlider(
            items: itemList,
            height: 250,
            subHeight: 70,
            width: MediaQuery.of(context).size.width * .9,
            autoplay: true,
            showSubBackground: false,
            showText: false,
          ),
        ],
      ),
    );
  }
}
