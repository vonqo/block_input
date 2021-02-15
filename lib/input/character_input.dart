import 'package:block_input/block_input_style.dart';
import 'package:flutter/material.dart';

class CharacterInput extends StatelessWidget {

  final TextInputType keyboardType;
  final TextEditingController textController;
  final FocusNode focusNode;
  final Function onChange;
  final BlockInputStyle blockInputStyle;
  final bool isCyrillic;

  const CharacterInput({
    Key key,
    @required this.keyboardType,
    @required this.focusNode,
    @required this.onChange,
    @required this.blockInputStyle,
    this.isCyrillic = false,
    this.textController,
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
        readOnly: this.isCyrillic,
        showCursor: this.isCyrillic,
        textAlign: TextAlign.center,
        obscureText: false,
        style: blockInputStyle.textStyle,
        keyboardType: keyboardType,
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