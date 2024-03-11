import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  CachedCircleAvatar({super.key, required this.url, required this.radius});

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          height: radius * 2,
          width: radius * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              image: imageProvider,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
            child: SizedBox(
                height: Sizes.p48,
                width: Sizes.p48,
                child: CircularProgressIndicator())),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fadeInDuration: const Duration(seconds: 1),
      ),
      minRadius: radius,
    );
  }
}
