import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class BorderScaffold extends StatelessWidget {
  const BorderScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.p24),
      child: child,
    );
  }
}
