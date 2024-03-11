import 'package:art_seller_demo/src/common_widgets/cached_circle_avatar.dart';
import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleSellerAvatar extends StatelessWidget {
  const CircleSellerAvatar({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.3 - Sizes.p32,
      left: size.width / 2 - Sizes.p32,
      child: CachedCircleAvatar(url: product.imageSellerUrl, radius: Sizes.p32),
    );
  }
}
