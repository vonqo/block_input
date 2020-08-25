
import 'dart:async';

import 'package:block_input/input/character_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class BlockInput extends StatefulWidget {

//  static const MethodChannel _channel =
//      const MethodChannel('block_input');
//
//  static Future<String> get platformVersion async {
//    final String version = await _channel.invokeMethod('getPlatformVersion');
//    return version;
//  }

  final int inputSize;
  final String errorMessage;

  const BlockInput({
    Key key,
    this.inputSize = 4,
    this.errorMessage
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlockInputState(inputSize, errorMessage);
  }
}

class _BlockInputState extends State<BlockInput> {

  final int _inputSize;
  final String errorMessage;
  List<TextEditingController> _controllerList = List<TextEditingController>();
  List<FocusNode> _focusControllerList = List<FocusNode>();
  List<CharacterInput> _charInputList = List<CharacterInput>();

  _BlockInputState(this._inputSize, this.errorMessage);

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < _inputSize; i++) {
      _controllerList.add(TextEditingController());
      _focusControllerList.add(FocusNode());
      _charInputList.add(CharacterInput());
    }
  }

  @override
  void dispose() {
    for(int i = 0; i < _inputSize; i++) {
      _controllerList[i]?.dispose();
      _focusControllerList[i]?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      ],
    );
  }

}
