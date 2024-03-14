import 'package:art_seller_demo/src/common_widgets/cached_circle_avatar.dart';
import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/features/products/domain/offer.dart';
import 'package:art_seller_demo/src/features/products/domain/product.dart';
import 'package:art_seller_demo/src/features/products/presentation/live_auction_ripple/live_auction_ripple.dart';
import 'package:art_seller_demo/src/routing/app_router.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

class LastOffersList extends StatelessWidget {
  const LastOffersList({
    super.key,
    required this.product,
    required this.offers,
  });

  final Product product;
  final List<Offer> offers;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (offers != null && offers.isNotEmpty) ...[
                Row(
                  children: [
                    gapW4,
                    CircleAvatar(
                      child: FaIcon(
                        FontAwesomeIcons.gavel,
                        color: context.colorTheme.primary,
                        size: Sizes.p20,
                      ),
                      radius: Sizes.p16,
                    ),
                    gapW20,
                    SizedBox(
                      width: 140,
                      child: Text(
                        "Warning 1 at \$ ${offers[0].proposal.toInt()}",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${context.loc.product_list_live} ${context.loc.product_list_auction}',
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorTheme.primary,
                          fontWeight: FontWeight.w700),
                    ),
                    gapW4,
                    LiveAuctionRipple()
                  ],
                ),
                gapH12,
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: SizedBox(
                          width: Sizes.p20 * 2,
                          height: Sizes.p20 * 2,
                          child: CachedCircleAvatar(
                            url: offers[index].imageUrl,
                            radius: Sizes.p20,
                          )),
                      title: Text(
                          '${offers[index].name} ${offers[index].surname}',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      subtitle: Text(
                          '${timeago.format(DateTime.now().subtract(Duration(hours: offers[index].time.hour, minutes: offers[index].time.minute, seconds: offers[index].time.second)), locale: 'en_short')}',
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colorTheme.outline)),
                      trailing: Text(
                        '\$ ${offers[index].proposal}',
                        style: context.textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      minLeadingWidth: 30,
                    ),
                    itemCount: offers.length,
                  ),
                ),
                gapH16,
              ],
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Not implemented feature'),
                      content: const Text('This feature is not implemented yet. See you next meetup!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // context.pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // context.goNamed(AppRoute.notImplemented.name);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.colorTheme.primary),
                  ),
                  child: Text(
                    'Place your bid!',
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: context.colorTheme.onPrimary),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
