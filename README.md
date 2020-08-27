# Block Input 

![build](https://github.com/vonqo/block_input/workflows/build/badge.svg) 
[![pub package](https://img.shields.io/pub/v/block_input.svg)](https://pub.dartlang.org/packages/geolocator)

Simple character blocked input that usually used for redeem code or validation code input.

## Gallery
<img src="https://raw.githubusercontent.com/vonqo/block_input/master/example/example-1.gif">

## Usage
```dart
BlockInput(
    blockInputKeyboardType: BlockInputKeyboardType.number,
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
    inputSize: 6,
)
```

## Todo
* Input Controller
* Input Listener
* More Extensive Styles

