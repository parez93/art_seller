import 'package:art_seller_demo/src/constants/app_theme.dart';
import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/products/presentation/products_list/products_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
      theme: light,
      darkTheme: dark,
      home: ProductsListScreen(),
    );
  }
}
