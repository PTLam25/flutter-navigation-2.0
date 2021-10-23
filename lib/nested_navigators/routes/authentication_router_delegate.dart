import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:navigator_2/nested_navigators/pages/authentication_page.dart';
import 'package:navigator_2/nested_navigators/pages/nested_router_page.dart';

class AuthenticationRouterDelegate extends RouterDelegate with ChangeNotifier {
  bool isAuthenticated = false;
  final GlobalKey<NavigatorState> navigatorKey;

  AuthenticationRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<bool> popRoute() async {
    MoveToBackground.moveTaskToBack();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [HeroController()],
      pages: [
        MaterialPage(
          key: const ValueKey('MyHomePage'),
          child: AuthenticationPage(
            onPressed: () {
              isAuthenticated = true;
              notifyListeners();
            },
          ),
        ),
        if (isAuthenticated)
          const MaterialPage(
            key: ValueKey('NestedNavigatorPage'),
            child: NestedRouterPage(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        isAuthenticated = false;
        notifyListeners();

        return true;
      },
    );
  }

  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async {}
}
