import 'package:flutter/material.dart';
import 'package:navigator_2/nested_navigators/routes/authentication_router_delegate.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        routerDelegate: AuthenticationRouterDelegate(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
