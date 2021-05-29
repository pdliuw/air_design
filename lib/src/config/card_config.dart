import 'package:flutter/widgets.dart';

const EdgeInsetsGeometry _defaultPadding = EdgeInsets.all(8);
const EdgeInsetsGeometry _defaultMargin = EdgeInsets.all(8);
const BorderRadius _defaultBorderRadius = BorderRadius.all(Radius.circular(12));
const BorderSide _defaultBorderSide = BorderSide(color: Color(0xFFEEEEEE));

///
/// CardConfig
class CardConfig {
  EdgeInsetsGeometry? defaultMargin;
  EdgeInsetsGeometry? defaultPadding;
  BorderRadius? defaultBorderRadius;
  BorderSide? defaultBorderSide;
  CardConfig({
    this.defaultMargin,
    this.defaultPadding,
    this.defaultBorderRadius,
    this.defaultBorderSide,
  }) {
    defaultMargin ??= _defaultMargin;
    defaultPadding ??= _defaultPadding;
    defaultBorderRadius ??= _defaultBorderRadius;
    defaultBorderSide ??= _defaultBorderSide;
  }
}
