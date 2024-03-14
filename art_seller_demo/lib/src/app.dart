import 'package:art_seller_demo/src/constants/app_theme.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:art_seller_demo/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
      theme: light,
      darkTheme: dark,
      routerConfig: router,
    );
  }
}
