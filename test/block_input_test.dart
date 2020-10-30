import 'package:block_input/block_input_controller.dart';
import 'package:block_input/block_input_keyboard_type.dart';
import 'package:block_input/block_input_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:block_input/block_input.dart';

void main() {
  const MethodChannel channel = MethodChannel('block_input');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
  
  testWidgets('BlockInput widget test', (WidgetTester tester) async {

    BlockInputController controller = BlockInputController(6);
    Widget blockInput = BlockInput(
      controller: controller,
      keyboardType: BlockInputKeyboardType.number,
      style: BlockInputStyle(
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
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: blockInput,
      ),
    ));
  });
}
