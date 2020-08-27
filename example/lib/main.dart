import 'package:block_input/block_input_keyboard_type.dart';
import 'package:block_input/block_input_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:block_input/block_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Block Input Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: BlockInput(
            blockInputKeyboardType: BlockInputKeyboardType.text,
            blockInputStyle: BlockInputStyle(backgroundColor: Colors.white),
            inputSize: 6,
          ),
        )
      ),
    );
  }
}
