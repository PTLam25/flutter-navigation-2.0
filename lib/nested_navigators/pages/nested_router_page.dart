import 'package:flutter/material.dart';
import 'package:navigator_2/nested_navigators/routes/nested_router_delegate.dart';

class NestedRouterPage extends StatelessWidget {
  const NestedRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childBackButtonDispatcher =
        ChildBackButtonDispatcher(Router.of(context).backButtonDispatcher!);

    childBackButtonDispatcher.takePriority();
    return Router(
      routerDelegate: NestedRouterDelegate(),
      backButtonDispatcher: childBackButtonDispatcher,
    );
  }
}
