import 'package:flutter/material.dart';

/// UserFace
class UserFace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserFaceState();
  }
}

/// _UserFaceState
class _UserFaceState extends State<UserFace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
      child: Hero(
        tag: "user_face",
        child: ClipOval(
          child: Image.asset(
            "images/personal_background.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
