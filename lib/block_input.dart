
import 'dart:async';

import 'package:block_input/block_input_style.dart';
import 'package:block_input/input/character_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'block_input_keyboard_type.dart';

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
  final BlockInputKeyboardType blockInputKeyboardType;
  final BlockInputStyle blockInputStyle;

  const BlockInput({
    Key key,
    this.inputSize = 4,
    this.errorMessage,
    this.blockInputKeyboardType = BlockInputKeyboardType.text,
    this.blockInputStyle
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlockInputState(
      inputSize: inputSize,
      errorMessage: errorMessage,
      blockInputKeyboardType: blockInputKeyboardType,
      blockInputStyle: blockInputStyle
    );
  }
}

class _BlockInputState extends State<BlockInput> {

  final int inputSize;
  final String errorMessage;
  final BlockInputKeyboardType blockInputKeyboardType;
  final BlockInputStyle blockInputStyle;
  List<TextEditingController> _controllerList = List<TextEditingController>();
  List<FocusNode> _focusControllerList = List<FocusNode>();
  List<CharacterInput> _charInputList = List<CharacterInput>();

  _BlockInputState({
    @required this.inputSize,
    @required this.errorMessage,
    @required this.blockInputKeyboardType,
    @required this.blockInputStyle
  });

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < inputSize; i++) {
      TextEditingController textController = TextEditingController();
      FocusNode focusNode = FocusNode();
      Function fx = (value) {};

      if(i == 0) {
        fx = (value) {
          if(value.length == 1) {
            FocusScope.of(context).requestFocus(_focusControllerList[i+1]);
          }
        };
      } else if(i == inputSize - 1) {
        fx = (value) {
          if(value.length == 0) {
            FocusScope.of(context).requestFocus(_focusControllerList[i-1]);
          }
        };
      } else {
        fx = (value) {
          if(value.length == 1) {
            FocusScope.of(context).requestFocus(_focusControllerList[i+1]);
          } else if(value.length == 0) {
            FocusScope.of(context).requestFocus(_focusControllerList[i-1]);
          }
        };
      }

      TextInputType textInputType =
        (blockInputKeyboardType == BlockInputKeyboardType.text) ? TextInputType.text :
        (blockInputKeyboardType == BlockInputKeyboardType.number) ? TextInputType.number : TextInputType.text;

      _charInputList.add(CharacterInput(
        textController: textController,
        focusNode: focusNode,
        onChange: fx,
        keyboardType: textInputType,
      ));

      _controllerList.add(textController);
      _focusControllerList.add(focusNode);
    }
  }

  @override
  void dispose() {
    for(int i = 0; i < inputSize; i++) {
      _controllerList[i]?.dispose();
      _focusControllerList[i]?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: _charInputList,),
          buildErrorMessage(),
        ],
      ),
    );
  }

  Widget buildErrorMessage() {
    if(errorMessage == null) return SizedBox();
    return Text(errorMessage, style: TextStyle(),);
  }

}
