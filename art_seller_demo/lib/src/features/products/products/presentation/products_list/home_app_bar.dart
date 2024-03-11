import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(context.loc.product_list_title,
            style: context.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.sliders),
        )
      ],
    );
  }
}
