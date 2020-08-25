
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
      TextEditingController textController = TextEditingController();
      FocusNode focusNode = FocusNode();
      Function fx = (value) {};

      if(i == 0) {
        fx = (value) {
          if(value.length == 1) {
            FocusScope.of(context).requestFocus(_focusControllerList[i+1]);
          }
        };
      } else if(i == _inputSize - 1) {
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

      _charInputList.add(CharacterInput(
        textController: textController,
        focusNode: focusNode,
        onChange: fx,
      ));

      _controllerList.add(textController);
      _focusControllerList.add(focusNode);
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
