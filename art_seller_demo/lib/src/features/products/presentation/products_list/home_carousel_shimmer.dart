import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarouselShimmer extends StatelessWidget {
  const HomeCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p32 * 10,
      child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
            child: Container(
              width: Sizes.p32 * 8,
              height: Sizes.p32 * 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.p16),
                color: Colors.white.withOpacity(.4),
              ),
              padding: const EdgeInsets.symmetric(vertical: Sizes.p24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p32),
                child: Column(
                  children: [
                    Container(
                      width: Sizes.p64 * 3,
                      height: Sizes.p64 * 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.p16),
                        color: Colors.white,
                      ),
                    ),
                    gapH24,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Sizes.p64 * 2,
                          height: Sizes.p24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.p16),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(bottom: Sizes.p8),
                        ),
                        Container(
                          width: Sizes.p64 * 3,
                          height: Sizes.p12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.p16),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(bottom: Sizes.p8),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
