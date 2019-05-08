import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});


  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,

    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, behaviors: [
      new charts.SeriesLegend(position: charts.BehaviorPosition.end),
    ],animate: animate);
  }
  static List<charts.Series<MyData, int>> _createSampleData() {
    final data = [
      new MyData(0 , 10),
      new MyData(1, 11),
      new MyData(2, 7),
      new MyData(3, 10),
    ];

    final data2 = [
      new MyData(0 , 50),
      new MyData(1, 55),
      new MyData(2, 45),
      new MyData(3, 40),
    ];


    return [
      new charts.Series<MyData, int>(
        id: 'Dumble (kg)',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MyData sales, _) => sales.x,
        measureFn: (MyData sales, _) => sales.y,
        data: data,
      ),

      new charts.Series<MyData, int>(
        id: 'Deadlift (kg)',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (MyData sales, _) => sales.x,
        measureFn: (MyData sales, _) => sales.y,
        data: data2,
      )
    ];
  }
}



/// Sample linear data type.
class MyData {
  final int x;
  final int y;

  MyData(this.x, this.y);
}