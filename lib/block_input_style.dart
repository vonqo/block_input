import 'package:block_input/block_keyboard_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BlockInputStyle with Diagnosticable {

  final Color backgroundColor;
  final OutlineInputBorder border;
  final OutlineInputBorder focusedBorder;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextStyle textStyle;
  final double width;
  final bool isExtended;
  final BlockKeyboardStyle keyboardStyle;

  const BlockInputStyle({
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(5),
    this.isExtended = false,
    this.border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.black, width: 2.0),
    ),
    this.focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.black, width: 2.0),
    ),
    this.textStyle = const TextStyle(
      fontSize: 19
    ),
    this.width = 42,
    this.keyboardStyle,
  });

  BlockInputStyle apply () {
    // TODO: implement
    throw UnimplementedError();
  }

  BlockInputStyle copyWith() {
    // TODO: implement
    throw UnimplementedError();
  }

  BlockInputStyle merge() {
    // TODO: implement
    throw UnimplementedError();
  }

  BlockInputStyle compareTo() {
    // TODO: implement
    throw UnimplementedError();
  }

}