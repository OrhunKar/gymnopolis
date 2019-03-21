import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graph {

  final List<charts.Series<LinearSales, int>> data = _createSampleData();

  Graph();

  List<charts.Series<LinearSales, int>> getData(){
    return data;
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}



/// Sample linear data type.
class LinearSales {

  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}