import 'package:block_input/block_input_style.dart';
import 'package:flutter/material.dart';

class CharacterInput extends StatelessWidget {

  final TextInputType keyboardType;
  final TextEditingController textController;
  final FocusNode focusNode;
  final Function onChange;
  final BlockInputStyle blockInputStyle;

  const CharacterInput({
    Key key,
    @required this.keyboardType,
    @required this.textController,
    @required this.focusNode,
    @required this.onChange,
    @required this.blockInputStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: blockInputStyle.backgroundColor,
          borderRadius: blockInputStyle.border.borderRadius
      ),
      width: blockInputStyle.width,
      child: TextFormField(
        textAlign: TextAlign.center,
        obscureText: false,
        style: TextStyle(fontSize: blockInputStyle.fontSize, color: blockInputStyle.fontColor),
        maxLength: 1,
        enabled: true,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: blockInputStyle.padding,
          border: InputBorder.none,
          enabledBorder: blockInputStyle.border,
          focusedBorder: blockInputStyle.focusedBorder,
        ),
        controller: textController,
        focusNode: focusNode,
        onChanged: onChange,
      ),
    );
  }

}