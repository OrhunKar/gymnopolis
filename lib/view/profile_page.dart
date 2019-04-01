import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gymnopolis/model/Graph.dart';

class ProfilePage extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ProfilePage(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory ProfilePage.withSampleData() {
    return new ProfilePage(
      new Graph().getData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/human_wood.jpg',
        ),
        new Padding(
          padding: new EdgeInsets.all(32.0),
          child: new SizedBox(
            height: 200.0,
            child: new charts.LineChart(seriesList, animate: animate),
          ),
        ),
        ],
      ),
    );
  }
}
