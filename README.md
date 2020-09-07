# Block Input 

[![build](https://github.com/vonqo/block_input/workflows/build/badge.svg) ](https://github.com/vonqo/block_input/actions)
[![pub package](https://img.shields.io/pub/v/block_input.svg)](https://pub.dev/packages/block_input)

Simple character blocked input that usually used for redeem code or validation code input.

## Gallery
<img src="https://raw.githubusercontent.com/vonqo/block_input/master/example/example-1.gif">

## Usage
### Controller and Listener
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
blockInputController.text = 'Maaraa'; // set + 
// + throws exception when text length was exceeded from input size

blockInputController.clear(); // clear

// Disposing
blockInputController.dispose();
```

### Widget
```dart
@override
Widget build(BuildContext context) {
  return BlockInput(
     blockInputController: blockInputController,
     blockInputKeyboardType: BlockInputKeyboardType.number, // Number or Text
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
     ),
  );
}


```

