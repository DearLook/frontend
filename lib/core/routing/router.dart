import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:dearlook/core/routing/route_paths.dart';
import 'package:dearlook/presentation/dummy/dummy_screen.dart';
import 'package:dearlook/presentation/navigation/bottom_navigation.dart';
import 'package:dearlook/presentation/setting/setting_screen.dart';
import 'package:dearlook/presentation/home/home_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: [
    GoRoute(
      path: RoutePaths.dummy,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const DummyScreen(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavigation(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(
              index,
              initialLocation:  index == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              builder: (context, state) => HomeScreen()
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: RoutePaths.setting,
                builder: (context, state) => SettingScreen()
            ),
          ],
        ),
      ],
    ),
  ],
);