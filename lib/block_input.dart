import 'package:block_input/block_input_controller.dart';
import 'package:block_input/block_input_style.dart';
import 'package:block_input/block_keyboard_style.dart';
import 'package:block_input/input/character_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'block_input_keyboard_type.dart';
import 'input/mn_keyboard.dart';

class BlockInput extends StatefulWidget {

  final String errorMessage;
  final TextStyle errorMessageStyle;
  final BlockInputController controller;
  final BlockInputKeyboardType keyboardType;
  final BlockInputStyle style;
  final MainAxisAlignment axisAlignment;

  const BlockInput({
    Key key,
    this.errorMessage,
    this.keyboardType = BlockInputKeyboardType.text,
    this.style,
    this.errorMessageStyle,
    this.controller,
    this.axisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlockInputState(
      errorMessage: errorMessage,
      errorMessageStyle: errorMessageStyle,
      keyboardType: keyboardType,
      style: style,
      controller: (controller == null) ? BlockInputController(4) : controller,
      axisAlignment: axisAlignment
    );
  }
}

class _BlockInputState extends State<BlockInput> {

  final String errorMessage;
  final TextStyle errorMessageStyle;
  final BlockInputKeyboardType keyboardType;
  final BlockInputStyle style;
  final BlockInputController controller;
  final MainAxisAlignment axisAlignment;

  List<TextEditingController> _controllerList = List<TextEditingController>();
  List<FocusNode> _focusControllerList = List<FocusNode>();
  List<CharacterInput> _charInputList = List<CharacterInput>();
  bool _isKeyboardShowing = false;

  _BlockInputState({
    @required this.errorMessage,
    @required this.keyboardType,
    @required this.style,
    this.controller,
    this.errorMessageStyle,
    this.axisAlignment,
  });

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      String textValue = controller.text;
      for(int i = 0; i < _controllerList.length; i++) {
        if(textValue.length > i) {
          _controllerList[i].text = controller.text[i];
        } else {
          _controllerList[i].text = '';
        }
      }
      if(keyboardType != BlockInputKeyboardType.mnCyrillic) {
        if(textValue.length == 0) {
          FocusScope.of(context).requestFocus(_focusControllerList[0]);
        } else {
          FocusScope.of(context).requestFocus(_focusControllerList[textValue.length-1]);
        }
      }
    });

    for(int i = 0; i < controller.size; i++) {
      TextEditingController textController = TextEditingController();
      FocusNode focusNode = FocusNode();
      Function fx = (value) {};

      if(keyboardType == BlockInputKeyboardType.mnCyrillic) {
        focusNode.addListener(() {
          if(!_isKeyboardShowing) {
            _isKeyboardShowing = true;
            focusNode.unfocus();
            _buildMNKeyboard(context, style.keyboardStyle, textController, focusNode).show();
          }
        });
      } else {
        if(i == 0) {
          fx = (value) {
            controller.text = _getText();
            if(value.length == 1) {
              FocusScope.of(context).requestFocus(_focusControllerList[i+1]);
            }
          };
        } else if(i == controller.size - 1) {
          fx = (value) {
            controller.text = _getText();
            if(value.length == 0) {
              FocusScope.of(context).requestFocus(_focusControllerList[i-1]);
            }
          };
        } else {
          fx = (value) {
            controller.text = _getText();
            if(value.length == 1) {
              FocusScope.of(context).requestFocus(_focusControllerList[i+1]);
            } else if(value.length == 0) {
              FocusScope.of(context).requestFocus(_focusControllerList[i-1]);
            }
          };
        }
      }

      if(keyboardType == BlockInputKeyboardType.mnCyrillic) {
        _charInputList.add(CharacterInput(
          textController: textController,
          focusNode: focusNode,
          onChange: fx,
          isCyrillic: true,
          blockInputStyle: style,
        ));
      } else {
        TextInputType textInputType =
        (keyboardType == BlockInputKeyboardType.text) ? TextInputType.text :
        (keyboardType == BlockInputKeyboardType.number) ? TextInputType.number : TextInputType.text;

        _charInputList.add(CharacterInput(
          textController: textController,
          focusNode: focusNode,
          onChange: fx,
          isCyrillic: false,
          keyboardType: textInputType,
          blockInputStyle: style,
        ));
      }
      _controllerList.add(textController);
      _focusControllerList.add(focusNode);
    }
  }

  @override
  void dispose() {
    for(int i = 0; i < controller.size; i++) {
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
          _buildErrorMessage(this.errorMessage, errorMessageStyle),
        ],
      ),
    );
  }

  YYDialog _buildMNKeyboard(
      BuildContext context, BlockKeyboardStyle style,
      TextEditingController textController, FocusNode focusNode
    ) {
    YYDialog dialog = YYDialog();
    focusNode.unfocus();
    dialog.build(context)
      ..width = MediaQuery.of(context).size.width
      ..gravity = Gravity.bottom
      ..borderRadius = 12
      ..backgroundColor = style.backgroundColor
      ..barrierColor = Color(0x45000000)
      ..widget(
        Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: MNKeyboard(style: style, controller: textController, dialog: dialog,),
        ),
      )
      ..dismissCallBack = () {
        this.controller.text = _getText();
        _isKeyboardShowing = false;
        focusNode.unfocus();
      };
    focusNode.unfocus();
    return dialog;
  }
}



Widget _buildErrorMessage(String error, TextStyle errorStyle) {
  if(error == null) return SizedBox();
  return Text(error, style: errorStyle.copyWith(),);
}
