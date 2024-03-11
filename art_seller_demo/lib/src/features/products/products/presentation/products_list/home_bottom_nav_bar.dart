import 'package:art_seller_demo/src/utils/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.compass),
          label: context.loc.bot_nav_bar_explore,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          label: context.loc.bot_nav_bar_search,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.user),
          label: context.loc.bot_nav_bar_profile,
        ),
      ],
      currentIndex: 0,
      onTap: (idx) {},
    );
  }
}
