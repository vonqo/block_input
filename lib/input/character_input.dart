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
          color: Colors.black12,
          borderRadius: blockInputStyle.borderRadius
      ),
      width: 42,
      child: TextFormField(
        textAlign: TextAlign.center,
        obscureText: false,
        style: TextStyle(fontSize: 19, color: Colors.black),
        maxLength: 1,
        enabled: true,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Theme.of(context).canvasColor, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Theme.of(context).accentColor, width: 2.0),
          ),
        ),
        controller: textController,
        focusNode: focusNode,
        onChanged: onChange,
      ),
    );
  }

}