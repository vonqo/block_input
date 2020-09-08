import 'package:flutter/foundation.dart';

@immutable
class BlockInputKeyboardType with Diagnosticable {

  final int index;

  const BlockInputKeyboardType._(this.index) : assert(index != null);

  static const BlockInputKeyboardType text = BlockInputKeyboardType._(1);
  static const BlockInputKeyboardType number = BlockInputKeyboardType._(2);

  static const List<BlockInputKeyboardType> values = <BlockInputKeyboardType>[
    text, number
  ];

  static const List<String> _names = <String>[
    'text', 'number'
  ];

}