import 'dart:math';

import 'package:block_input/block_input_controller.dart';
import 'package:block_input/block_input_keyboard_type.dart';
import 'package:block_input/block_input_style.dart';
import 'package:flutter/material.dart';

import 'package:block_input/block_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  BlockInputController blockInputController = BlockInputController(6);

  @override
  void initState() {
    blockInputController.addListener(() {
      print(blockInputController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    blockInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Block Input Example'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: BlockInput(
                blockInputController: blockInputController,
                blockInputKeyboardType: BlockInputKeyboardType.number,
                axisAlignment: MainAxisAlignment.spaceBetween,
                blockInputStyle: BlockInputStyle(
                    backgroundColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.deepOrange, width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.blueAccent, width: 2)
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  RaisedButton(
                    child: Text('CLEAR'),
                    onPressed: () {
                      blockInputController.clear();
                    },
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    child: Text('RANDOM FILL'),
                    onPressed: () {
                      Random rand = Random();
                      StringBuffer strBuffer = StringBuffer();
                      for(int i = 0; i < blockInputController.size; i++) {
                        strBuffer.write(rand.nextInt(9).toString());
                      }
                      blockInputController.text = strBuffer.toString();
                    },
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(
                    child: Text('TEST'),
                    onPressed: () {
                      blockInputController.text = 'MARAAAAAAA';
                    },
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }


}
