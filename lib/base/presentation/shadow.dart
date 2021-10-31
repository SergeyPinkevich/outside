import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AppBoxShadow extends BoxShadow {
  @override
  ui.Color get color => Color.fromRGBO(88, 150, 253, 0.25);

  @override
  double get spreadRadius => 2;

  @override
  double get blurRadius => 15;

  @override
  ui.Offset get offset => Offset(0, 4);
}
