import 'package:block_input/block_keyboard_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class MNKeyboard extends StatelessWidget {

  final BlockKeyboardStyle style;
  final TextEditingController controller;
  final YYDialog dialog;

  const MNKeyboard({
    Key key,
    this.style,
    this.controller,
    this.dialog
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildKey('А'),
            _buildKey('Б'),
            _buildKey('В'),
            _buildKey('Г'),
            _buildKey('Д'),
            _buildKey('Е'),
            _buildKey('Ё'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildKey('Ж'),
            _buildKey('З'),
            _buildKey('И'),
            _buildKey('Й'),
            _buildKey('К'),
            _buildKey('Л'),
            _buildKey('М'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildKey('Н'),
            _buildKey('О'),
            _buildKey('Ө'),
            _buildKey('П'),
            _buildKey('Р'),
            _buildKey('С'),
            _buildKey('Т'),

          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildKey('У'),
            _buildKey('Ү'),
            _buildKey('Ф'),
            _buildKey('Х'),
            _buildKey('Ц'),
            _buildKey('Ч'),
            _buildKey('Ш'),

          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildKey('Щ'),
            _buildKey('Ы'),
            _buildKey('Э'),
            _buildKey('Ю'),
            _buildKey('Я'),
          ],
        ),
      ],
    );
  }

  Widget _buildKey(String char) {
    return Container(
      width: style.width,
      height: style.height,
      child: RaisedButton(
        color: Colors.blueAccent,
        visualDensity: VisualDensity.compact,
        shape: style.keyShape,
        onPressed: () {
          dialog.dismiss();
          controller.text = char;
        },
        child: Text(char, style: style.textStyle,),
      ),
    );
  }
}