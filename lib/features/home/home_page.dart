import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView.router(
      tabs: [
        PersistentRouterTabConfig(
          item: ItemConfig(icon: const Icon(Icons.home), title: "Quests"),
        ),
        PersistentRouterTabConfig(
          item: ItemConfig(icon: const Icon(Icons.person), title: "Account"),
        )
      ],
      navBarBuilder: (navBarConfig) {
        return Style8BottomNavBar(navBarConfig: navBarConfig);
      },
      navigationShell: child,
    );
  }
}
