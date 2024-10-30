import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  double maxPrice = 500;
  double minPrice = 200;

  double maxY = 8;

  List<List<double>> prices = [
    [10, 200],
    [9, 201],
    [8, 210],
    [7, 260],
    [6, 320],
    [5.5, 370],
    [5, 350],
    [4.3, 470],
    [3.7, 480],
    [3, 490],
    [2, 472]
  ];

  double? priceGap;

  @override
  void initState() {
    prices = prices.reversed.toList();
    priceGap = maxPrice - minPrice;
    priceGap = (priceGap! / maxY).ceilToDouble();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: maxPrice,
        minY: minPrice,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) =>
              const Color(0xffe17f2f).withOpacity(0.3),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
              getTitlesWidget: leftTitleWidgets,
              showTitles: true,
              interval: 50,
              reservedSize: 40,
              minIncluded: true),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.grey
    );

    // print(value);

    return Text('\$' + value.toInt().toString(),
        style: style, textAlign: TextAlign.center);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  List<FlSpot> get spots {
    List<FlSpot> spots = [];
    spots = prices.map((element) {
      print(prices);

      // double y = element.last * (1/minPrice);
      return FlSpot(element.first, element.last);

      // element
    }).toList();

    // print(y.toString());

    return spots;
  }

  FlGridData get gridData => FlGridData(
        show: false,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        horizontalInterval: priceGap,
        verticalInterval: 1,
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
        border: const Border(
          bottom: BorderSide(color: Colors.red, width: 2),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: spots,
      );
}
