import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:flutter/material.dart';

class MetaTags extends StatelessWidget {
  const MetaTags({
    super.key,
    required this.product,
    this.mainAxisAlignment = MainAxisAlignment.center
  });

  final Product product;
  final mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: product.meta.map((m) {
        String value = '';
        if (product.meta.last != m) {
          value += '$m • ';
        } else {
          value += m;
        }
        return Text(value);
      }).toList(),
    );
  }
}
