import 'package:flutter/material.dart';

///
/// AppCardListItemTipWidget
// ignore: must_be_immutable
class AppCardListItemTipWidget extends StatelessWidget {
  String? _title;
  Color? _color;

  AppCardListItemTipWidget({
    required String title,
    Color color = Colors.deepOrange,
  }) {
    _title = title;
    _color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_title",
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.subtitle2?.fontSize,
        color: _color ?? Theme.of(context).textTheme.subtitle1?.color,
      ),
    );
  }
}
