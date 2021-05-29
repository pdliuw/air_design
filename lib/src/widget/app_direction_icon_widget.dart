import 'package:flutter/material.dart';

///
/// AppDirectionIconWidget
class AppDirectionIconWidget extends StatelessWidget {
  ///
  /// [AppDirectionIconArrow]
  static AppDirectionIconArrow? _appDirectionIconArrow;

  ///
  /// [defaultStyle]
  AppDirectionIconWidget.defaultStyle({
    AppDirectionIconArrow directionIconArrow = AppDirectionIconArrow.bottom,
  }) {
    _appDirectionIconArrow = directionIconArrow;
  }
  @override
  Widget build(BuildContext context) {
    int quarterTurns;
    if (AppDirectionIconArrow.left == _appDirectionIconArrow)
      quarterTurns = 2;
    else if (AppDirectionIconArrow.top == _appDirectionIconArrow) {
      quarterTurns = 3;
    } else if (AppDirectionIconArrow.right == _appDirectionIconArrow) {
      quarterTurns = 0;
    } else if (AppDirectionIconArrow.bottom == _appDirectionIconArrow) {
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
/// AppDirectionIconArrow
enum AppDirectionIconArrow {
  left,
  top,
  right,
  bottom,
}
