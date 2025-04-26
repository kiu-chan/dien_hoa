import 'package:flutter/material.dart';
import 'line_chart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Line Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LineChartScreen(),
    );
  }
}