import 'package:flutter/material.dart';

class TempUnitProvider extends ChangeNotifier {
  double celcius = 0;
  double fahrenheit = 0;
  double kelvin = 0;

  setCelcius(double cel) {
    celcius = cel;
    fahrenheit = (celcius * 9 / 5) + 32;
    kelvin = celcius + 273.15;
    notifyListeners();
  }

  setFahrenheit(double fah) {
    fahrenheit = fah;
    celcius = (fahrenheit - 32) * 5 / 9;
    kelvin = (fahrenheit - 32) * 5 / 9 + 273.15;
    notifyListeners();
  }

  setKelvin(double kel) {
    kelvin = kel;
    fahrenheit = (kelvin - 273.15) * 9 / 5 + 32;
    celcius = kelvin - 273.15;
    notifyListeners();
  }
}
