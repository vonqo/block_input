import 'package:flutter/material.dart';

class CharacterInput extends StatelessWidget {

  final TextInputType keyboardType;
  final TextEditingController textController;
  final FocusNode focusNode;
  final Function onChange;

  const CharacterInput({
    Key key,
    this.keyboardType,
    this.textController,
    this.focusNode,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(8))
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