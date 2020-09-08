import 'package:block_input/block_input_controller.dart';
import 'package:block_input/block_input_style.dart';
import 'package:block_input/input/character_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'block_input_keyboard_type.dart';

class BlockInput extends StatefulWidget {

  final String errorMessage;
  final TextStyle errorMessageStyle;
  final BlockInputController blockInputController;
  final BlockInputKeyboardType blockInputKeyboardType;
  final BlockInputStyle blockInputStyle;
  final MainAxisAlignment axisAlignment;

  const BlockInput({
    Key key,
    this.errorMessage,
    this.blockInputKeyboardType = BlockInputKeyboardType.text,
    this.blockInputStyle,
    this.errorMessageStyle,
    this.blockInputController,
    this.axisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlockInputState(
      errorMessage: errorMessage,
      errorMessageStyle: errorMessageStyle,
      blockInputKeyboardType: blockInputKeyboardType,
      blockInputStyle: blockInputStyle,
      blockInputController: (blockInputController == null) ? BlockInputController(4) : blockInputController,
      axisAlignment: axisAlignment
    );
  }
}

class _BlockInputState extends State<BlockInput> {

  final String errorMessage;
  final TextStyle errorMessageStyle;
  final BlockInputKeyboardType blockInputKeyboardType;
  final BlockInputStyle blockInputStyle;
  final BlockInputController blockInputController;
  final MainAxisAlignment axisAlignment;

  List<TextEditingController> _controllerList = List<TextEditingController>();
  List<FocusNode> _focusControllerList = List<FocusNode>();
  List<CharacterInput> _charInputList = List<CharacterInput>();

  _BlockInputState({
    @required this.errorMessage,
    @required this.blockInputKeyboardType,
    @required this.blockInputStyle,
    this.blockInputController,
    this.errorMessageStyle,
    this.axisAlignment,
  });

  @override
  void initState() {
    super.initState();

    blockInputController.addListener(() {
      String textValue = blockInputController.text;
      for(int i = 0; i < _controllerList.length; i++) {
        if(textValue.length > i) {
          _controllerList[i].text = blockInputController.text[i];
        } else {
          _controllerList[i].text = '';
        }
      }
      if(textValue.length == 0) {
        FocusScope.of(context).requestFocus(_focusControllerList[0]);
      } else {
        FocusScope.of(context).requestFocus(_focusControllerList[textValue.length-1]);
      }
    });

    for(int i = 0; i < blockInputController.size; i++) {
      TextEditingController textController = TextEditingController();
      FocusNode focusNode = FocusNode();
      Function fx = (value) {};

      if(i == 0) {
        fx = (value) {
          blockInputController.text = _getText();
          if(value.length == 1) {
            FocusScope.of(context).requestFocus(_focusControllerList[i+1]);
          }
        };
      } else if(i == blockInputController.size - 1) {
        fx = (value) {
          blockInputController.text = _getText();
          if(value.length == 0) {
            FocusScope.of(context).requestFocus(_focusControllerList[i-1]);
          }
        };
      } else {
        fx = (value) {
          blockInputController.text = _getText();
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
        blockInputStyle: blockInputStyle,
      ));

      _controllerList.add(textController);
      _focusControllerList.add(focusNode);
    }
  }

  @override
  void dispose() {
    for(int i = 0; i < blockInputController.size; i++) {
      _controllerList[i]?.dispose();
      _focusControllerList[i]?.dispose();
    }
    super.dispose();
  }

  String _getText() {
    StringBuffer strBuffer = StringBuffer();
    for(TextEditingController controller in _controllerList) {
      strBuffer.write(controller.text);
    }
    return strBuffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: axisAlignment,
            children: _charInputList,
          ),
          buildErrorMessage(),
        ],
      ),
    );
  }

  Widget buildErrorMessage() {
    if(errorMessage == null) return SizedBox();
    return Text(errorMessage, style: errorMessageStyle,);
  }

}
