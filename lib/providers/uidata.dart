import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperatureconverter/processor/helper.dart';
import 'package:temperatureconverter/processor/unitconverter.dart';

class DataElementsProvider extends ChangeNotifier {
  String box1 = '0';
  String box2 = '0';

  String unit1 = units[0];
  String unit2 = units[1];

  int currentbox = 1;

  TempUnitProvider converter = TempUnitProvider();

  DataElementsProvider() {
    converter.setCelcius(5);
    box1 = converter.celcius.toString();
    box2 = converter.fahrenheit.toString();
  }

  updateCalculation() {
    // for first box
    print('update');
    if (unit1 == units[0]) {
      box1 = converter.celcius.toString();
    } else if (unit1 == units[1]) {
      box1 = converter.fahrenheit.toString();
    } else {
      box1 = converter.kelvin.toString();
    }
    // for second box
    if (unit2 == units[0]) {
      box2 = converter.celcius.toString();
    } else if (unit2 == units[1]) {
      box2 = converter.fahrenheit.toString();
    } else {
      box2 = converter.kelvin.toString();
    }
    notifyListeners();
  }

  addText(String keystroke) {
    if (currentbox == 1) {
      String rText = Helpers.keyStroke(currenttext: box1, stroke: keystroke);
      box1 = rText;
      if (unit1 == units[0]) {
        converter.setCelcius(double.parse(box1));
        print(converter.celcius);
      } else if (unit1 == units[1]) {
        converter.setFahrenheit(double.parse(box1));
      } else {
        converter.setKelvin(double.parse(box1));
      }
    } else {
      String rText = Helpers.keyStroke(currenttext: box2, stroke: keystroke);
      box2 = rText;
      if (unit2 == units[0]) {
        converter.setCelcius(double.parse(box2));
      } else if (unit2 == units[1]) {
        converter.setFahrenheit(double.parse(box2));
      } else {
        converter.setKelvin(double.parse(box2));
      }
    }
    // setting value into converter class

    updateCalculation();
    notifyListeners();
  }

  toggleBox(int boxno) {
    currentbox = boxno;
    notifyListeners();
  }

  changeUnits({required int boxno, required String unit}) {
    double value;
    if (boxno == 1) {
      unit1 = unit;
      value = double.parse(box1);
    } else if (boxno == 2) {
      unit2 = unit;
      value = double.parse(box2);
    } else
      value = 1;

    // setting value into converter class
    if (unit == units[0]) {
      converter.setCelcius(value);
    } else if (unit == units[1]) {
      converter.setFahrenheit(value);
    } else {
      converter.setKelvin(value);
    }
    updateCalculation();
    notifyListeners();
  }
}
