import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class BlockKeyboardStyle with Diagnosticable {
  final TextStyle? textStyle;
  final Color? keyColor;
  final Color? backgroundColor;
  final ShapeBorder? keyShape;
  final double? width;
  final double? height;

  const BlockKeyboardStyle({
    this.textStyle,
    this.keyColor,
    this.backgroundColor,
    this.keyShape,
    this.width = 40,
    this.height = 40,
  });

  BlockKeyboardStyle apply () {
    // TODO: implement
    throw UnimplementedError();
  }

  BlockKeyboardStyle copyWith() {
    // TODO: implement
    throw UnimplementedError();
  }

  BlockKeyboardStyle merge() {
    // TODO: implement
    throw UnimplementedError();
  }

  BlockKeyboardStyle compareTo() {
    // TODO: implement
    throw UnimplementedError();
  }
}