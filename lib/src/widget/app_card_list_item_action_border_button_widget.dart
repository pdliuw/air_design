import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///
/// AppCardListItemActionBorderButtonWidget
// ignore: must_be_immutable
class AppCardListItemActionBorderButtonWidget extends StatelessWidget {
  String _text;
  VoidCallback _onTap;
  Color _borderColor;
  Color _textColor;
  double _borderRadius;
  bool _showBorder;

  ///
  /// Default style
  AppCardListItemActionBorderButtonWidget.defaultStyle({
    String text = '',
    VoidCallback onTap,
    Color borderColor = Colors.blue,
    Color textColor = Colors.white,
    double borderRadius = 10,
    bool showBorder = true,
  }) {
    _text = text;
    _onTap = onTap;
    _borderColor = borderColor;
    _textColor = textColor;
    _borderRadius = borderRadius;
    _showBorder = showBorder;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      padding: EdgeInsets.only(
        left: 20,
        top: 5,
        right: 20,
        bottom: 5,
      ),
      onPressed: _onTap,
      textColor: _textColor,
      child: Text(
        "$_text",
      ),
    );
  }
}
