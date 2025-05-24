import 'package:flutter/material.dart';

class Shadows {
  Shadows._();

  static final mainShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 4.0,
      offset: const Offset(0, 4),
    ),
  ];
}
