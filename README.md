# Block Input 

[![build](https://github.com/vonqo/block_input/workflows/build/badge.svg?branch=master)](https://github.com/vonqo/block_input/actions)
[![pub package](https://img.shields.io/pub/v/block_input.svg)](https://pub.dev/packages/block_input)

Simple character blocked input that usually used for redeem code or validation code input.

## Gallery
<img src="https://raw.githubusercontent.com/vonqo/block_input/master/example/example-1.gif">

### Example

Full [example](https://pub.dev/packages/block_input/example)

```dart
import 'package:block_input/block_input.dart';
```

```dart
BlockInput(
  controller: blockInputController,
  keyboardType: BlockInputKeyboardType.number, // Number or Text
  axisAlignment: MainAxisAlignment.spaceBetween, // Same as Row/Column MainAxisAlignment
  blockInputStyle: BlockInputStyle(
    backgroundColor: Colors.black12, // Color
    border: OutlineInputBorder( // Same as InputDecoration border
         borderRadius: BorderRadius.all(Radius.circular(10)),
         borderSide: BorderSide(color: Colors.deepOrange, width: 1)
    ),
    focusedBorder: OutlineInputBorder( // Same as InputDecoration border
         borderRadius: BorderRadius.all(Radius.circular(10)),
         borderSide: BorderSide(color: Colors.blueAccent, width: 2)
    )
  )
)
```
### Cyrillic support
Mongolian cyrillic input is **loosely** supported for now. This feature will help you to build Mongolian Registration No input. Cyrillic input triggers custom keyboard layout. Usage:

```dart
BlockInput(
  keyboardType: BlockInputKeyboardType.mnCyrillic
  ...
)
```
Cyrillic keyboard styling:
```dart
BlockInputStyle(
    keyboardStyle: BlockKeyboardStyle(
      keyColor: Colors.blueAccent,
      backgroundColor: Colors.white,
      width: 40,
      height: 40,
      textStyle: TextStyle(),
      keyShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)
      ),
    ),
    ...
),
```

## Controller and Listener

Controller is almost same as classic TextEditingController :D
```dart
// Initializing controller
int inputSize = 6; // input size is required for controller
BlockInputController blockInputController = BlockInputController(inputSize);

// Attaching listener
blockInputController.addListener(() {
  print(blockInputController.text);
});

// Getting and Setting value
String getValue = blockInputController.text; // get
blockInputController.text = 'maaraa'; // set + 
// + throws exception when text length was exceeded from input size

blockInputController.clear(); // clear

// Disposing
blockInputController.dispose();
```

## Attributes

### BlockInput
| Attribute              | Type                   |
|------------------------|------------------------|
| blockInputKeyboardType | BlockInputController   |
| blockInputKeyboardType | BlockInputKeyboardType |
| blockInputStyle        | BlockInputStyle        |
| errorMessage           | String                 |
| errorMessageStyle      | TextStyle              |
| axisAlignment          | MainAxisAlignment      |



### BlockInputStyle
| Attribute      | Type               |
|-----------------|--------------------|
| backgroundColor | Color              |
| border          | OutlineInputBorder |
| focusedBorder   | OutlineInputBorder |
| padding         | EdgeInsets         |
| width           | double             |
| textStyle       | TextStyle          |
| keyboardStyle   | BlockKeyboardStyle |



## Licence
**Apache License version 2.0**

Enkh-Amar.G // vonqo



