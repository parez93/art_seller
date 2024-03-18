import 'package:art_seller_demo/src/common_widgets/async_value_widget.dart';
import 'package:art_seller_demo/src/common_widgets/border_scaffold.dart';
import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/constants/test_offer.dart';
import 'package:art_seller_demo/src/constants/test_products.dart';
import 'package:art_seller_demo/src/features/products/data/fake_product_repository.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/auction_card_detail.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/circle_seller_avatar.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/last_offers_list.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/product_image.dart';
import 'package:art_seller_demo/src/features/products/presentation/product_screen/title_product.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductScreen extends ConsumerWidget {
  ProductScreen({super.key, required this.productId}){
  }

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productFutureProvider(productId));
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.arrowUpFromBracket))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: AsyncValueWidget<Product>(
            value: productAsync,
            data: (product) => SizedBox(
              // height: size.height,
              child: Stack(
                children: <Widget>[
                  ProductImage(product: product),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: context.colorTheme.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.p32),
                        topRight: Radius.circular(Sizes.p32),
                      ),
                    ),
                    child: BorderScaffold(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Aggiungere il contenuto
                          gapH24,
                          TitleProduct(product: product),
                          gapH24,
                          AuctionCardDetail(),
                          gapH12,
                          LastOffersList(product: product, offers: kTestOffers.where((p) => p.idProduct == product.id).toList()..sort((a, b) => b.proposal.compareTo(a.proposal))),
                        ],
                      ),
                    ),
                  ),
                  CircleSellerAvatar(product: product),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





