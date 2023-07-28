import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperatureconverter/colors.dart';
import 'package:temperatureconverter/processor/helper.dart';
import 'package:temperatureconverter/providers/uidata.dart';
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
              boxno: 1,
              text: Provider.of<DataElementsProvider>(context).box1,
            ),
            TempBox(
              boxno: 2,
              text: Provider.of<DataElementsProvider>(context).box2,
            ),
            Spacer(),
            NumPad(),
          ],
        ),
      ),
    );
  }
}
