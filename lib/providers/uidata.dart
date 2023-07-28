import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperatureconverter/processor/helper.dart';

class DataElementsProvider extends ChangeNotifier {
  String box1 = '';
  String box2 = '';

  String unit1 = '';
  String unit2 = '';

  int currentbox = 1;

  addText(String keystroke) {
    if (currentbox == 1) {
      String rText = Helpers.keyStroke(currenttext: box1, stroke: keystroke);
      box1 = rText;
    } else {
      String rText = Helpers.keyStroke(currenttext: box2, stroke: keystroke);
      box2 = rText;
    }
    notifyListeners();
  }

  toggleBox(int boxno) {
    currentbox = boxno;
    notifyListeners();
  }
}
