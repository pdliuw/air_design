import 'package:flutter/material.dart';

///
/// AirCardListItemTitleHead6Widget
// ignore: must_be_immutable
class AirCardListItemTitleHead6Widget extends StatelessWidget {
  String _title;
  String _tooltip;
  Color _color;

  AirCardListItemTitleHead6Widget({String title, String tooltip, Color color}) {
    _title = title;
    _tooltip = tooltip;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "$_tooltip",
      child: Text(
        "$_title",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.headline6.fontSize,
          color: _color ?? Theme.of(context).textTheme.headline6.color,
        ),
      ),
    );
  }
}
