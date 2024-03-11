import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:art_seller_demo/src/features/products/presentation/meta_tags/meta_tags.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TitleProduct extends StatelessWidget {
  const TitleProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                product.title,
                style: context.textTheme.displaySmall
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            MetaTags(
              product: product,
              mainAxisAlignment: MainAxisAlignment.start,
            )
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.heart,
              color: Colors.red,
            ))
      ],
    );
  }
}
