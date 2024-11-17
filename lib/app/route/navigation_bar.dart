import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viewith/ui/widgets/vi_navigation_bar.dart';
import 'package:viewith/ui/widgets/vi_navigation_item.dart';

import '../../ui/gen/assets.gen.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: VINavigationBar(
        items: [
          VINavigationItem(
            activeIcon: Assets.images.chatSearchFill.svg(),
            inactiveIcon: Assets.images.chatSearch.svg(),
            title: '후기',
          ),
          VINavigationItem(
            activeIcon: Assets.images.chatSearchFill.svg(),
            inactiveIcon: Assets.images.chatSearch.svg(),
            title: '프로필',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
        onCenterButtonTap: () {},
      ),
    );
  }
}
