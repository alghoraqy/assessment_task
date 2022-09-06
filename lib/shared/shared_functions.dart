import 'package:flutter/material.dart';

List<String> dayStrings = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
String getDayString(int index) {
  if (index < 7) {
    return dayStrings[index];
  } else {
    return (dayStrings +
        dayStrings +
        dayStrings +
        dayStrings +
        dayStrings)[index];
  }
}

Future navigato(context, {required Widget screen}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}
