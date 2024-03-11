import 'package:art_seller_demo/src/common_widgets/border_scaffold.dart';
import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/constants/test_products.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/home_app_bar.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/home_sugggestions.dart';
import 'package:flutter/material.dart';

import 'home_bottom_nav_bar.dart';
import 'home_carousel.dart';
import 'home_categories_list.dart';

class ProductsListScreen extends StatelessWidget {
  ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HomeAppBar(),
      body: BorderScaffold(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  HomeAppBar(),
                  gapH32,
                  HomeCategoriesList(),
                  gapH32,
                  HomeCarousel(products: kTestProducts.sublist(0, 5)),
                  gapH32,
                  HomeSuggestions(products: kTestProducts.sublist(6, 9)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






