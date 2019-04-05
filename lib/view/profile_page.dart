import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gymnopolis/model/Graph.dart';
import 'package:gymnopolis/view/settings_page.dart';
import 'package:gymnopolis/view/messages_page.dart';
import 'package:gymnopolis/view/Page.dart';

class ProfilePage extends StatefulWidget with Page{
  final List<charts.Series> seriesList;
  final bool animate;

  ProfilePage(this.seriesList, {this.animate});

  List<Widget> topBar(BuildContext context){
    return <Widget>[
        new IconButton(icon: new Icon(Icons.history), onPressed: null),
        new IconButton(
            icon: new Icon(Icons.account_balance_wallet), onPressed: null),
        new IconButton(icon: new Icon(Icons.settings), onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        })
      ];
  }

  @override
  ProfilePageState createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>{

  /// Creates a [LineChart] with sample data and no transition.
  /*factory ProfilePageState.withSampleData() {
    return new ProfilePageState(
      new Graph().getData(),
      // Disable animations for image tests.
      animate: false,
    );
  }*/

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
                child: new charts.LineChart(widget.seriesList, animate: widget.animate),
              ),
            ),
          ],
        ),
      );
  }

}
