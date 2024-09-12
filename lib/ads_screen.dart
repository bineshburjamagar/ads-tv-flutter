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
    return Scaffold(
      body: CarouselSlider(
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
              link: adsList[index].link,
            );
          }
        }),
        options: CarouselOptions(),
      ),
    );
  }
}
