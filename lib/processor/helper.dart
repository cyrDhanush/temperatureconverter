import 'package:flutter/material.dart';
import 'package:temperatureconverter/colors.dart';
import 'package:temperatureconverter/processor/unitconverter.dart';

class Helpers {
  static keyStroke({
    required String currenttext,
    required String stroke,
  }) {
    // currenttext represents the present text or variable
    // stoke represents the new text or number pressed by user
    String result = '';
    switch (stroke) {
      case 'backspace':
        {
          if (currenttext.length > 1) {
            var splitlist = currenttext.split('.');
            result = (splitlist[0].substring(0, splitlist[0].length - 1)) +
                '.' +
                splitlist[1];
            // result = currenttext.substring(0, currenttext.length - 1);
          }
        }
        break;
      case 'C':
        result = '0.0';
        break;
      case '.':
        {
          if (currenttext.contains('.')) {
            result = currenttext;
          } else {
            result = currenttext + '.';
          }
        }
      default:
        {
          if (currenttext == '0.0')
            result = stroke + '.0';
          else {
            var splitlist = currenttext.split('.');
            result = splitlist[0] + stroke + '.' + splitlist[1];
          }
        }
    }
    return result;
  }
}

getUnit({required BuildContext context}) async {
  String unit = '';
  setunit(u) {
    unit = u;
    Navigator.pop(context, unit);
  }

  await showModalBottomSheet(
    context: context,
    backgroundColor: bgwhite,
    constraints:
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4),
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                Spacer(),
                Text(
                  'Select Unit',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 60,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: fgwhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // tempUnitButton(setunit: setunit, text: 'Celcuis'),
                  // tempUnitButton(setunit: setunit, text: 'Kelvin'),
                  // tempUnitButton(setunit: setunit, text: 'Fahrenheit'),
                  for (String i in units)
                    tempUnitButton(setunit: setunit, text: i),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
  return unit;
}

Widget tempUnitButton({required Function setunit, required String text}) {
  return TextButton(
    onPressed: () {
      setunit(text);
    },
    style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black.withAlpha(200),
          ),
        ),
      ],
    ),
  );
}
