import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class LiveAuctionRipple extends StatefulWidget {
  LiveAuctionRipple({
    super.key,
  });

  @override
  State<LiveAuctionRipple> createState() => _LiveAuctionRippleState();
}

class _LiveAuctionRippleState extends State<LiveAuctionRipple>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AnimatedBuilder(
        animation: CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: Sizes.p8 * _animationController.value,
                height: Sizes.p8 * _animationController.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(1 - _animationController.value),
                ),
              ),
              Container(
                width: Sizes.p16 * _animationController.value,
                height: Sizes.p16 * _animationController.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(1 - _animationController.value),
                ),
              ),
            ],
          );
        },
      ),
      width: Sizes.p16,
    );
  }
}
