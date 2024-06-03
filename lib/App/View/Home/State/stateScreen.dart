import 'package:flutter/material.dart';

import '../../../util/line_chart_sample1.dart';
import '../../../util/line_chart_sample2.dart';

class ScreenState extends StatelessWidget {
  const ScreenState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('statistics'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            "Medication consumption per week",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromARGB(255, 237, 237, 237),
              child: SizedBox(
                width: double.infinity,
                child: BarChartSample7(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Medication consumption per year",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromARGB(255, 232, 230, 230),
              child: SizedBox(
                width: double.infinity,
                child: LineChartSample2(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
