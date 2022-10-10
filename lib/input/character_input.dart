import 'package:block_input/block_input_style.dart';
import 'package:flutter/material.dart';

class CharacterInput extends StatelessWidget {

  final TextInputType? keyboardType;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final void Function(String)? onChange;
  final BlockInputStyle? blockInputStyle;
  final bool isCyrillic;

  const CharacterInput({
    Key? key,
    this.keyboardType,
    this.focusNode,
    this.onChange,
    this.blockInputStyle,
    this.isCyrillic = false,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blockInputStyle?.backgroundColor,
        // borderRadius: blockInputStyle.border.isOutline ?? false,
        // borderRadius: blockInputStyle.border.isOutline ? (blockInputStyle.border as OutlineInputBorder).borderRadius : 0
      ),
      width: blockInputStyle?.width,
      child: TextFormField(
        readOnly: this.isCyrillic,
        showCursor: this.isCyrillic,
        textAlign: TextAlign.center,
        obscureText: false,
        style: blockInputStyle?.textStyle,
        keyboardType: keyboardType,
        maxLength: 1,
        enabled: true,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: blockInputStyle?.padding,
          border: InputBorder.none,
          enabledBorder: blockInputStyle?.border,
          focusedBorder: blockInputStyle?.focusedBorder,
        ),
        controller: textController,
        focusNode: focusNode,
        onChanged: onChange,
      ),
    );
  }

}