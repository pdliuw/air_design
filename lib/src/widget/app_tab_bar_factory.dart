import 'package:flutter/material.dart';

///
/// AppTabFactory
class AppTabBarFactory {
  ///
  /// Create tab bar of the whole application
  static TabBar createTabBar({
    required TabController controller,
    required List<String> tabTexts,
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
