import 'package:flutter/material.dart';

///
/// ListView created factory
class AppListViewFactory {
  ///
  /// Create builder's list view
  static createListViewBuilder({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    bool shrinkWrap = false,
    double? cacheExtent,
    bool vertical = true,
  }) {
    return ListView.builder(
      itemCount: itemCount,
      cacheExtent: cacheExtent,
      shrinkWrap: shrinkWrap,
      physics: BouncingScrollPhysics(),
      scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
      itemBuilder: itemBuilder,
    );
  }

  ///
  /// Create reorder's list view
  static createReorderListView<T>({
    required BuildContext context,
    required List<T> list,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    int index = 0;
    return ReorderableListView(
      children: list.map((T e) {
        return itemBuilder(context, index);
      }).toList(),
      onReorder: (int oldIndex, int newIndex) {},
    );
  }
}
