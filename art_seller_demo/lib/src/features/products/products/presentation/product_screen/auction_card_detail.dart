import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuctionCardDetail extends StatelessWidget {
  const AuctionCardDetail({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.loc.produt_estimate,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colorTheme.outline),
                ),
                Text(
                  context.loc.produt_current_bid,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colorTheme.outline),
                ),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ 800 - 1000',
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ 700',
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(
                    begin: 0,
                    end: 0.6,
                  ),
                  builder: (context, value, _) => Expanded(
                    child: LinearProgressIndicator(
                      value: value,
                      color: context.colorTheme.primary,
                      backgroundColor:
                      context.colorTheme.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Sizes.p20),
                    ),
                  ),
                ),
                gapW64,
                FaIcon(
                  FontAwesomeIcons.clock,
                  size: Sizes.p20,
                  color: context.colorTheme.outline,
                ),
                gapW12,
                Text(
                  '00:30',
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
