import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gymnopolis/view/settings_page.dart';
import 'package:gymnopolis/view/Page.dart';
import 'package:human_anatomy/human_anatomy.dart';


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


  var _finalBodyPartList = [];

  
  @override
  Widget build(BuildContext context) {

    print(_finalBodyPartList.length);

    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HumanAnatomy(
                    onChanged: bodyPartList,
                  )
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: _finalBodyPartList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Text(
                              'test'
                          );
                        }),
                  ),
                ),
              ],
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new SizedBox(
                height: 200.0,
                child: new charts.LineChart(widget.seriesList, animate: widget.animate),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new SizedBox(
                height: 200.0,
                child: new charts.LineChart(widget.seriesList, animate: widget.animate),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new SizedBox(
                height: 200.0,
                child: new charts.LineChart(widget.seriesList, animate: widget.animate),
              ),
            ),
          ],
        ),
      );

    
  }
  void bodyPartList(List value) {
    _finalBodyPartList = value;
  }

}
