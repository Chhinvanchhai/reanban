import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(PieChartData(
              sections: piechartdata,
              startDegreeOffset: -90,
              sectionsSpace: 0.0)),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                Text("38",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 0.8)),
                Text('Of 128G')
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<PieChartSectionData> piechartdata = [
  PieChartSectionData(
      value: 40, color: Colors.red[500], showTitle: false, radius: 25),
  PieChartSectionData(
      value: 25, color: Color(0xFF42A5F5), showTitle: false, radius: 20),
  PieChartSectionData(
      value: 20, color: Colors.blue[300], showTitle: false, radius: 15),
  PieChartSectionData(
      value: 15, color: Colors.green[400], showTitle: false, radius: 10),
];
