import 'package:flutter/material.dart';

///
/// AirTabBarFactory
class AirTabBarFactory {
  ///
  /// Create tab bar of the whole app
  static TabBar createTabBar({
    @required TabController controller,
    List<String> tabTexts,
  }) {
    return TabBar(
      controller: controller,
      labelColor: Colors.white,
      tabs: tabTexts.map((e) {
        return Tab(
          text: e,
        );
      }).toList(),
    );
  }
}
