import 'package:flutter/material.dart';
import 'package:navigator_2/pages/home_page.dart';
import 'package:navigator_2/pages/other_page.dart';

/// ChangeNotifier is the class which enable us to call notifyListeners() whenever the route changes. This is the equivalent of calling setState in a way.
/// PopNavigatorRouterDelegateMixin is just a class which implements the method popRoute for you to handle back button press.
class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AppRouterDelegate();

  bool showOtherPage = false;

  /// navigatorKey which is a key to refer to our navigator.
  /// It is used by the PopNavigatorRouterDelegateMixin and you can use it to navigate in an imperative way (though you should never need)
  @override
  late final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// build returns Navigator instead of Widget. Navigators' parameters:
  /// 1. key (navigatorKey) is unique identifier of Navigator in app. By default Flutter has only 1 Navigator, but we can add more.
  /// 2. pages is the stack of pages describing our navigation stack in a declarative way.
  /// Note that we don't use directly the widget but rather MaterialPage. MaterialPage describes for example the transition between different route.
  /// Also note that the key (ValueKey) parameter should be used in order to properly animate between the pages. It is needed for performance as well.
  /// 3. onPopPage describes what should happen when we want to pop a page.
  /// In our case we return false because we want handled the pop, preventing the default behaviour.
  /// If we wanted the default behavior, we could have returned route.didPop(result).
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('MyHomePage'),
          child: HomePage(
            onPressed: () {
              showOtherPage = true;
              notifyListeners();
            },
          ),
        ),
        if (showOtherPage)
          const MaterialPage(
            key: ValueKey('MyOtherPage'),
            child: OtherPage(),
          ),
      ],
      onPopPage: (_, __) {
        showOtherPage = false;
        notifyListeners();

        return false;
      },
    );
  }

  // We don't use named navigation so we don't use this. Used only on web.
  @override
  Future<void> setNewRoutePath(configuration) async {}
}
