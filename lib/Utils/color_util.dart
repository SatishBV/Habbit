import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

const List<Color> availableColors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  kPapayaColor,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

Color getColorFrom(String color) {
  switch (color) {
    case 'blue':
      return Colors.blue;
    case 'red':
      return Colors.red;
    case 'green':
      return Colors.green;
    case 'lightGreen':
      return Colors.lightGreen;
    case 'pink':
      return Colors.pink;
    case 'purple':
      return Colors.purple;
    case 'deepPurple':
      return Colors.deepPurple;
    case 'indigo':
      return Colors.indigo;
    case 'lightBlue':
      return Colors.lightBlue;
    case 'cyan':
      return Colors.cyan;
    case 'teal':
      return Colors.teal;
    case 'lime':
      return Colors.lime;
    case 'yellow':
      return Colors.yellow;
    case 'amber':
      return Colors.amber;
    case 'orange':
      return Colors.orange;
    case 'papaya':
      return kPapayaColor;
    case 'brown':
      return Colors.brown;
    case 'grey':
      return Colors.grey;
    case 'blueGrey':
      return Colors.blueGrey;
    default:
      return kPapayaColor;
  }
}

String colorString(Color color) {
  if (color == Colors.blue) {
    return 'blue';
  } else if (color == Colors.red) {
    return 'red';
  } else if (color == Colors.green) {
    return 'green';
  } else if (color == Colors.lightGreen) {
    return 'lightGreen';
  } else if (color == Colors.pink) {
    return 'pink';
  } else if (color == Colors.purple) {
    return 'purple';
  } else if (color == Colors.deepPurple) {
    return 'deepPurple';
  } else if (color == Colors.indigo) {
    return 'indigo';
  } else if (color == Colors.lightBlue) {
    return 'lightBlue';
  } else if (color == Colors.cyan) {
    return 'cyan';
  } else if (color == Colors.teal) {
    return 'teal';
  } else if (color == Colors.lime) {
    return 'lime';
  } else if (color == Colors.yellow) {
    return 'yellow';
  } else if (color == Colors.amber) {
    return 'amber';
  } else if (color == Colors.orange) {
    return 'orange';
  } else if (color == kPapayaColor) {
    return 'papaya';
  } else if (color == Colors.brown) {
    return 'brown';
  } else if (color == Colors.grey) {
    return 'grey';
  } else if (color == Colors.blueGrey) {
    return 'blueGrey';
  }
  return 'papaya';
}