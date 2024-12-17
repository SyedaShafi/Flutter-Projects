import 'package:flutter/material.dart';
import 'package:line_chart/widget/line_chart_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 16, 42),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const LineChartWidget(),
      ),
    );
  }
}
