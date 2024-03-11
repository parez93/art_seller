import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:art_seller_demo/src/features/products/presentation/live_auction_ripple/live_auction_ripple.dart';
import 'package:art_seller_demo/src/features/products/presentation/meta_tags/meta_tags.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/product_screen.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarousel extends StatelessWidget {
  HomeCarousel({
    required this.products,
  });

  final List<Product> products;

  final controller = PageController(viewportFraction: .8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Sizes.p24 * 15,
          child: PageView.builder(
            controller: controller,
            itemCount: products.length,
            padEnds: false,
            itemBuilder: (_, index) {
              final product = products[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          ProductScreen(productId: product.id),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: Sizes.p20 * 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.p20),
                            color: context.colorTheme.onPrimary
                                .withOpacity(.9), //Colors.grey.shade300,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.p16),
                                child: Text(
                                  "${product.title}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: context.textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              gapH8,
                              MetaTags(product: product),
                              gapH24
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CachedNetworkImage(
                          imageUrl: product.imageUrl,
                          fit: BoxFit.fitHeight,
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
                      if (product.isLiveAuction)
                        Padding(
                          padding: const EdgeInsets.only(left: Sizes.p16),
                          child: Row(
                            children: [
                              LiveAuctionRipple(),
                              gapW4,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.loc.product_list_live,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                        color: context.colorTheme.primary,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    context.loc.product_list_auction,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                        color: context.colorTheme.primary,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: SmoothPageIndicator(
            controller: controller,
            count: products.length,
            effect: ExpandingDotsEffect(
              dotHeight: Sizes.p4,
              dotWidth: Sizes.p20,
              activeDotColor: context.colorTheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}


