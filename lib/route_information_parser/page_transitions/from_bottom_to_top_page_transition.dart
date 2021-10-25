import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Creating own Page we can customize page transition animation in method createRoute
class FromBottomToTopPageTransition extends Page {
  const FromBottomToTopPageTransition({
    LocalKey? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (
        BuildContext _,
        Animation<double> animation,
        Animation<double> __,
      ) {
        final tween = Tween(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).chain(
          CurveTween(curve: Curves.easeInOut),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
