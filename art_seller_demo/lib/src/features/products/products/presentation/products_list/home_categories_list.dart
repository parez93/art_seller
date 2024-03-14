import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/constants/test_categories.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kTestCategories.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: Sizes.p12),
          child: Chip(
            backgroundColor: index != 0 ? null : context.colorTheme.primary,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: index != 0
                        ? context.colorTheme.primary
                        : context.colorTheme.primary),
                borderRadius: BorderRadius.circular(Sizes.p20)),
            label: Text(kTestCategories[index],
                style: context.textTheme.labelLarge?.copyWith(
                    color: index != 0 ? null : context.colorTheme.onPrimary)),
          ),
        ),
      ),
    );
  }
}
