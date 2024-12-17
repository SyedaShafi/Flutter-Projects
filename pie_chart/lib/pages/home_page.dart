import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/widgets/custom_badge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text('Pie Chart'),
      centerTitle: true,
    );
  }

  Widget _buildUI() {
    return Center(
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                } else {
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                }
              });
            },
          ),
          sections: pieChartSection(),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
        ),
      ),
    );
  }

  List<PieChartSectionData> pieChartSection() {
    List<Color> sectionColors = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
    ];

    List<IconData> sectionIcon = [
      Icons.business,
      Icons.shopping_bag,
      Icons.local_grocery_store,
      Icons.house,
    ];

    return List.generate(
      4,
      (index) {
        double value = (index + 1) * 10;
        final isTouched = index == touchedIndex;
        final radius = isTouched ? 110.0 : 100.0;
        final fontSize = isTouched ? 20.0 : 16.0;
        return PieChartSectionData(
          value: value,
          title: '$value%',
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
          color: sectionColors[index],
          radius: radius,
          badgeWidget: buildBadgeWidget(
            '$value%',
            sectionIcon[index],
          ),
          badgePositionPercentageOffset: 0.95,
        );
      },
    );
  }
}
