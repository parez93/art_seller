import 'package:art_seller_demo/src/constants/app_sizes.dart';
import 'package:art_seller_demo/src/routing/app_router.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(context.loc.error_screen_title,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              gapH32,
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.home.name),
                child: Text(context.loc.error_screen_button),
              )
            ],
          ),
        ),
      ),
    );
  }
}
