import 'package:flutter/material.dart';

class NoTransitionPageRoute extends PageRouteBuilder {
  NoTransitionPageRoute({this.builder})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              child,
        );

  /// Builds the primary contents of the route.
  final WidgetBuilder builder;
}
