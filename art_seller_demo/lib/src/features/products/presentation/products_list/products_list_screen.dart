import 'package:art_seller_demo/src/common_widgets/async_value_widget.dart';
import 'package:art_seller_demo/src/common_widgets/border_scaffold.dart';
import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/constants/test_products.dart';
import 'package:art_seller_demo/src/features/products/data/fake_product_repository.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/home_app_bar.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/home_carousel_shimmer.dart';
import 'package:art_seller_demo/src/features/products/presentation/products_list/home_sugggestions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final productsAsync =
                          ref.watch(productListFutureProvider);
                      return AsyncValueWidget<List<Product>>(
                        value: productsAsync,
                        data: (products) => HomeCarousel(products: products),
                        loading: HomeCarouselShimmer(),
                      );
                    },
                  ),
                  gapH32,
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final productsAsync =
                          ref.watch(newArrivalProductListFutureProvider);
                      return AsyncValueWidget<List<Product>>(
                          value: productsAsync,
                          data: (products) =>
                              HomeSuggestions(products: products));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
