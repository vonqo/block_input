import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BlockInputController extends ValueNotifier<BlockEditingValue> {

  BlockInputController(this.size, {String text})
      : super(text == null ? BlockEditingValue.empty : BlockEditingValue(text: text));

  final int size;

  String get text => value.text;

  set text(String newText) {
    if(newText.length > size) {
      throw RangeError('Input size exceeded');
    }
    value = value.copyWith(text: newText);
  }

  void clear() {
    value = BlockEditingValue.empty;
  }

}

@immutable
class BlockEditingValue {

  final String text;

  static BlockEditingValue empty = BlockEditingValue();

  BlockEditingValue({
    this.text = ''
  }) : assert(text != null);

  BlockEditingValue copyWith({String text}) {
    return BlockEditingValue(text: text ?? this.text);
  }

}