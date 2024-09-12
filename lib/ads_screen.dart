import 'dart:developer';

import 'package:ads_tv_flutter/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'custom_video_player.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    final CarouselSliderController carouselController =
        CarouselSliderController();
    int currentIndex = 0;

    void moveToNextMedia() {
      setState(() {
        if (currentIndex < adsList.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0; // Loop back to the beginning if necessary
        }
      });
      // Change carousel index
      carouselController.animateToPage(currentIndex);

      // If the next item is a video, initialize it
      // if (adsList[currentIndex].link.endsWith(".mp4")) {
      //   _initializePlayer();
      // }
    }

    return Scaffold(
      body: CarouselSlider(
        carouselController: carouselController,
        items: List.generate(adsList.length, (index) {
          if (adsList[index].adType == AdType.image) {
            return CachedNetworkImage(
              imageUrl: adsList[index].link,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            );
          } else {
            return CustomVideoPlayer(
              link: adsList[currentIndex].link,
              currentIndex: currentIndex,
              onIndexChange: () {
                log('changing');
                moveToNextMedia();
              },
            );
          }
        }),
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
