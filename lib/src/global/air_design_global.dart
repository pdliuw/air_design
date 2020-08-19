import 'package:air_design/src/global/color/air_color_defaulted.dart';
import 'package:air_design/src/global/color/air_design_color.dart';

///
/// AirDesignGlobal
class AirDesignGlobal {
  ///
  /// Singleton
  static AirDesignGlobal _instance = AirDesignGlobal._();

  AirDesignColor _airDesignColor = AirDesignColorDefaulted();

  AirDesignGlobal._();

  ///
  /// Global Singleton
  AirDesignGlobal globalInstance() {
    return _instance;
  }

  AirDesignColor get airDesignColor => _airDesignColor;

  set airDesignColor(AirDesignColor color) {
    if (color == null) {
      return;
    }
    _airDesignColor = color;
  }
}
