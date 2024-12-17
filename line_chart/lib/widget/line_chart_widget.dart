import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        titlesData: getTitles(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Color(0Xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 3),
              const FlSpot(2.6, 2),
              const FlSpot(4.9, 5),
              const FlSpot(6.8, 2.5),
              const FlSpot(8, 4),
              const FlSpot(9.5, 3),
              const FlSpot(11, 4),
            ],
            isCurved: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            barWidth: 4,
            // dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

FlTitlesData getTitles() {
  return FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        reservedSize: 34,
        interval: 3,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          switch (value.toInt()) {
            case 0:
              return const Text(
                'Jan',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 1:
              return const Text(
                'Feb',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 2:
              return const Text(
                'Mar',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 3:
              return const Text(
                'Apr',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 4:
              return const Text(
                'May',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 5:
              return const Text(
                'Jun',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 6:
              return const Text(
                'Jul',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 7:
              return const Text(
                'Aug',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 8:
              return const Text(
                'Sep',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 9:
              return const Text(
                'Oct',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 10:
              return const Text(
                'Nov',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 11:
              return const Text(
                'Dec',
                style: TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            default:
              return const Text('');
          }
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        reservedSize: 35,
        interval: 2,
        showTitles: true,
        getTitlesWidget: (value, meta) {
          switch (value.toInt()) {
            case 0:
              return Text(
                '${value.round().toString()}k',
                style: const TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 2:
              return Text(
                '${value.round().toString()}k',
                style: const TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 4:
              return Text(
                '${value.round().toString()}k',
                style: const TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            case 6:
              return Text(
                '${value.round().toString()}k',
                style: const TextStyle(
                  color: Color(0Xff37434d),
                ),
              );

            default:
              return const Text('');
          }
        },
      ),
    ),
  );
}
