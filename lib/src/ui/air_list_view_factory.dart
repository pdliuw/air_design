import 'package:flutter/material.dart';

///
/// ListView created factory
class AirListViewFactory {
  ///
  /// Create builder's list view
  static createListViewBuilder({
    @required int itemCount,
    @required IndexedWidgetBuilder itemBuilder,
    bool shrinkWrap = false,
    double cacheExtent,
  }) {
    return ListView.builder(
      itemCount: itemCount,
      cacheExtent: cacheExtent,
      shrinkWrap: shrinkWrap,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: itemBuilder,
    );
  }

  ///
  /// Create reorder's list view
  static createReorderListView<T>({
    @required BuildContext context,
    @required List<T> list,
    IndexedWidgetBuilder itemBuilder,
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
