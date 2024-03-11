import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:art_seller_demo/src/utils/app_theme_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: context.colorTheme.background
          .withOpacity(.1),
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(label: context.loc.bot_nav_bar_explore, icon: FaIcon(FontAwesomeIcons.compass)),
          NavigationDestination(label: context.loc.bot_nav_bar_explore, icon: FaIcon(FontAwesomeIcons.magnifyingGlass)),
          NavigationDestination(label: context.loc.bot_nav_bar_profile, icon: FaIcon(FontAwesomeIcons.user)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
