import 'package:flutter/material.dart';

///
/// AirDirectionIconWidget
class AirDirectionIconWidget extends StatelessWidget {
  ///
  /// [AirDirectionIconArrow]
  static AirDirectionIconArrow _airDirectionIconArrow;

  ///
  /// [defaultStyle]
  AirDirectionIconWidget.defaultStyle({
    AirDirectionIconArrow directionIconArrow = AirDirectionIconArrow.bottom,
  }) {
    _airDirectionIconArrow = directionIconArrow;
  }
  @override
  Widget build(BuildContext context) {
    int quarterTurns;
    if (AirDirectionIconArrow.left == _airDirectionIconArrow)
      quarterTurns = 2;
    else if (AirDirectionIconArrow.top == _airDirectionIconArrow) {
      quarterTurns = 3;
    } else if (AirDirectionIconArrow.right == _airDirectionIconArrow) {
      quarterTurns = 0;
    } else if (AirDirectionIconArrow.bottom == _airDirectionIconArrow) {
      quarterTurns = 1;
    } else {
      quarterTurns = 0;
    }

    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Icon(
        Icons.last_page,
      ),
    );
  }
}

///
/// AirDirectionIconArrow
enum AirDirectionIconArrow {
  left,
  top,
  right,
  bottom,
}
