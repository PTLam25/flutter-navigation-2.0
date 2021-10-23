import 'package:flutter/material.dart';
import 'package:navigator_2/nested_navigators/pages/profile_page.dart';
import 'package:navigator_2/nested_navigators/pages/setting_page.dart';

final GlobalKey<NavigatorState> _nestedNavigatorKey =
    GlobalKey<NavigatorState>();

class NestedRouterDelegate extends RouterDelegate with ChangeNotifier {
  int selectedIndex = 0;

  @override
  Future<bool> popRoute() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You are connected'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        onTap: onNewIndexSelected,
      ),
      body: Navigator(
        key: _nestedNavigatorKey,
        observers: [HeroController()],
        pages: [
          if (selectedIndex == 0)
            MaterialPage(
              key: const ValueKey('ProfilePage'),
              child: ProfilePage(
                onPressed: () {},
              ),
            ),
          if (selectedIndex == 1)
            const MaterialPage(
              key: ValueKey('NestedNavigatorPage'),
              child: SettingPage(),
            ),
        ],
        onPopPage: (route, result) {
          onNewIndexSelected(selectedIndex == 0 ? 1 : 0);
          return false;
        },
      ),
    );
  }

  // We don't use named navigation so we don't use this
  @override
  Future<void> setNewRoutePath(configuration) async {}

  void onNewIndexSelected(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
