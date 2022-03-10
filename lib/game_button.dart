import 'package:flutter/material.dart';

class GameButton {
  late int id;
  String text = "";
  Color backgroundColor = Colors.grey;
  bool enabled = true;

  GameButton (int id) {
    this.id = id;
  }
}