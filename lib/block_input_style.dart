import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BlockInputStyle with Diagnosticable {

  final Color backgroundColor;
  final Color fontColor;
  final OutlineInputBorder border;
  final OutlineInputBorder focusedBorder;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double fontSize;
  final double width;
  final bool isExtended;

  BlockInputStyle({
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black87,
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
    this.fontSize = 19,
    this.width = 42
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