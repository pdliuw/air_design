import 'package:flutter/material.dart';

/// AppCardContainer
class AppCardContainer extends StatefulWidget {
  Widget _child;
  AppCardContainer({
    @required Widget child,
  }) {
    _child = child ?? Container();
  }

  @override
  State<StatefulWidget> createState() {
    return _AppCardContainerState();
  }
}

/// _CardContainerState
class _AppCardContainerState extends State<AppCardContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50,
          color: Theme.of(context).primaryColor,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 10,
            top: 45,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: widget._child,
        ),
      ],
    );
  }
}
