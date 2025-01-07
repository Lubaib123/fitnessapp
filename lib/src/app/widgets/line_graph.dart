import 'package:fitapp/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class LineChartWidget extends StatelessWidget {
  final List<FlSpot> chartData;

  LineChartWidget({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LineChart(mainData()),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 2,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 30,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: chartData, // Use the passed data here
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 6,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true, // Show points
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 3, // Point size
                color: Colors.deepPurple, // Point color
                strokeWidth: .5, // Stroke width of the point
                strokeColor: Colors.white, // Stroke color
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withAlpha((0.3 * 255).toInt()))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12, // Slightly larger font size
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold, // Makes the text bolder
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 2:
        text = 'Tue';
        break;
      case 4:
        text = 'Wed';
        break;
      case 6:
        text = 'Thu';
        break;
      case 8:
        text = 'Fri';
        break;
      case 10:
        text = 'Sat';
        break;
      case 12:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String image;
    switch (value.toInt()) {
      case 1:
        image = Assets.icons.angryemoji.keyName;
        break;
      case 2:
        image = Assets.icons.sadEmoji.keyName;
        break;
      case 3:
        image = Assets.icons.neutralEmoji.keyName;
        break;
      case 4:
        image = Assets.icons.confusedEmoji.keyName;
        break;
      case 5:
        image = Assets.icons.happyEmoji.keyName;
        break;

      default:
        return Container();
    }

    return CircleAvatar(radius: 10, child: Image.asset(image));
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
}
