import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: context.colorTheme.onPrimary,
        height: Sizes.p20 * Sizes.p20,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          fit: BoxFit.contain,
          height: Sizes.p64 * 4,
          placeholder: (context, url) => Center(
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator())),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fadeInDuration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
