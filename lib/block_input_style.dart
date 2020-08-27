import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BlockInputStyle with Diagnosticable {

  final Color backgroundColor;
  final Color fontColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isExtended;

  BlockInputStyle({
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black87,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(5),
    this.isExtended = false,
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