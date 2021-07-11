import 'package:flutter/material.dart';

/// 大きさを指定しやすいスペーサー
/// SpaceBox.width(50)
class SpaceBox extends SizedBox {
  SpaceBox({double width = 8, double height = 8})
      : super(width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}
