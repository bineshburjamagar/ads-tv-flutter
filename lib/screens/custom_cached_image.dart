import 'dart:async';
import 'dart:developer';

import 'package:ads_tv_flutter/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatefulWidget {
  const CustomCachedImage({
    super.key,
    required this.index,
    required this.onIndexChange,
  });
  final int index;
  final Function() onIndexChange;

  @override
  State<CustomCachedImage> createState() => _CustomCachedImageState();
}

class _CustomCachedImageState extends State<CustomCachedImage> {
  Duration duration = const Duration(seconds: 10);

  @override
  void initState() {
    super.initState();
    log("\x1B[32m image index = ${widget.index} \x1B[0m");
    Timer(duration, () {
      widget.onIndexChange.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: adsList[widget.index].link,
      alignment: Alignment.center,
      fit: BoxFit.fill,
    );
  }
}
