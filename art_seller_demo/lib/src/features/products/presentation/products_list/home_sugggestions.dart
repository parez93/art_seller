import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/home_carousel.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';

class HomeSuggestions extends StatelessWidget {
  const HomeSuggestions({
    super.key,
    required this.products,
  });

  final products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Sizes.p24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.product_list_new_arrival,
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w800)),
              Text(context.loc.product_list_upcoming,
                  style: context.textTheme.titleMedium),
              Text(context.loc.product_list_recomended,
                  style: context.textTheme.titleMedium),
            ],
          ),
        ),
        gapH12,
        HomeCarousel(products: products,)
      ],
    );
  }
}
