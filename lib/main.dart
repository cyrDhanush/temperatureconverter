import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperatureconverter/homescreen.dart';
import 'package:temperatureconverter/processor/unitconverter.dart';
import 'package:temperatureconverter/providers/uidata.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataElementsProvider()),
        ChangeNotifierProvider(create: (_) => TempUnitProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
