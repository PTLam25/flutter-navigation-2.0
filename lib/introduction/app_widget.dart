import 'package:flutter/material.dart';

import './routes/app_router_delegate.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(
        routerDelegate: AppRouterDelegate(),
      ),
    );
  }
}
