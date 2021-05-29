import 'package:flutter/material.dart';

///
/// AppDialogRoute
class AppPopupRoute extends PopupRoute {
  late RoutePageBuilder _pageBuilder;
  Color? _barrierColor;
  bool? _barrierDismissible;
  String? _barrierLabel;
  Duration? _transitionDuration;
  RouteTransitionsBuilder? _transitionsBuilder;
  RouteSettings? _settings;

  AppPopupRoute({
    required RoutePageBuilder pageBuilder,
    bool? barrierDismissible = true,
    String? barrierLabel,
    Color? barrierColor = const Color(0x80000000),
    Duration? transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    RouteSettings? settings,
  }) {
    _pageBuilder = pageBuilder;
    _barrierDismissible = barrierDismissible;
    _barrierLabel = barrierLabel;
    _barrierColor = barrierColor;
    _transitionDuration = transitionDuration;
    _transitionsBuilder = transitionBuilder;
    _settings = settings;
  }

  @override
  Color get barrierColor => _barrierColor!;

  @override
  bool get barrierDismissible => _barrierDismissible!;

  @override
  String get barrierLabel => _barrierLabel!;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
      child: _pageBuilder(context, animation, secondaryAnimation),
      scopesRoute: true,
      explicitChildNodes: true,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (_transitionsBuilder == null) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
    } // Some default transition
    return _transitionsBuilder!(context, animation, secondaryAnimation, child);
  }

  @override
  Duration get transitionDuration => _transitionDuration!;
}
