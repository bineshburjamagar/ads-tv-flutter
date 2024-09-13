import 'dart:developer';

import 'package:ads_tv_flutter/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'custom_cached_image.dart';
import 'custom_video_player.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  late final CarouselSliderController _carouselController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselSliderController();
  }

  void _moveToNextMedia() {
    log("Current index: $_currentIndex");
    setState(() {
      if (_currentIndex < adsList.length - 1) {
        _currentIndex += 1;
      } else {
        _currentIndex = 0; // Loop back to the beginning
      }
    });
    _carouselController.animateToPage(_currentIndex, curve: Curves.ease);
    log("Moved to index: $_currentIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: adsList.length,
        itemBuilder: (context, index, realIndex) {
          final ad = adsList[index];
          if (ad.adType == AdType.image) {
            return CustomCachedImage(
              index: index,
              onIndexChange: _moveToNextMedia,
            );
          } else {
            return CustomVideoPlayer(
              link: ad.link,
              currentIndex: index,
              onIndexChange: _moveToNextMedia,
            );
          }
        },
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
              log("Page changed: $_currentIndex");
            });
          },
        ),
      ),
    );
  }
}
