import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppCircleAvatarWidget extends StatelessWidget {
  String? _avatarString;
  String? _tooltip;

  AppCircleAvatarWidget({
    required String avatar,
  }) {}

  AppCircleAvatarWidget.defaultStyle({
    String? avatarString,
    String? tooltip,
  }) {
    _avatarString = avatarString;
    _tooltip = tooltip;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "$_tooltip",
      child: CircleAvatar(
        child: Text(
          "${_getAvatar()}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String _getAvatar() {
    String avatarFirst = _avatarString ?? '--';
    return avatarFirst.substring(0, 1);
  }
}
