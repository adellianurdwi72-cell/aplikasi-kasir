import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const DashboardChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Convert JSON → BarChartGroupData
    final bars = data.asMap().entries.map((e) {
      return BarChartGroupData(
        x: e.key,
        barRods: [
          BarChartRodData(
            toY: (e.value['total'] ?? 0).toDouble(),
            width: 18,
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 260,
      child: BarChart(
        BarChartData(
          barGroups: bars,
          gridData: const FlGridData(show: false),

          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final labels = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun"];
                  return Text(
                    labels[value.toInt() % labels.length],
                    style: const TextStyle(fontSize: 12),
                  );
                },
              ),
            ),
          ),

          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
