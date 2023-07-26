import 'package:flutter/material.dart';
import 'package:temperatureconverter/colors.dart';
import 'package:temperatureconverter/processor/helper.dart';
import 'package:temperatureconverter/widgets/numpad.dart';
import 'package:temperatureconverter/widgets/tempbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String box1 = '0';
  String box2 = '0';
  String unit1 = 'c';
  String unit2 = 'c';
  int currentbox = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgwhite,
      appBar: AppBar(
        backgroundColor: bgwhite,
        centerTitle: true,
        title: Text('Temperature Converter'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TempBox(
              text: box1,
              boxno: 1,
              currentbox: currentbox,
              onToggle: (boxno) {
                currentbox = boxno;
                setState(() {});
              },
            ),
            TempBox(
              text: box2,
              boxno: 2,
              currentbox: currentbox,
              onToggle: (boxno) {
                currentbox = boxno;
                setState(() {});
              },
            ),
            Spacer(),
            NumPad(
              onChanged: (text) {
                if (currentbox == 1) {
                  box1 = Helpers.keyStroke(currenttext: box1, stroke: text);
                } else if (currentbox == 2) {
                  box2 = Helpers.keyStroke(currenttext: box2, stroke: text);
                }
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
