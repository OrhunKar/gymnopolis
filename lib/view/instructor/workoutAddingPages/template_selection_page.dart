import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/model/InstructorModels/Template.dart';

class TemplateSelectionPage extends StatefulWidget{

  static String tag = 'student-history-page';

  static List<Template> selectedTemplates = List<Template>();

  createState() {
    return TemplateSelectionPageState();
  }
}

@override
class TemplateSelectionPageState extends State<TemplateSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('workout_plans')
        .where('name', isNull: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting)
          return new Text('Loading...');
        
        return Scaffold(
          appBar: AppBar(
            title: Text('Templates'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: TemplateSearch());
                })]),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                
                Navigator.pop(context);
              },
              child: Icon(Icons.check)
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: builderFunc(context, snapshot.data.documents.map((document) =>
              Template(
                name: document.data['name'],
                workout: null
            )).toList()));
        });
  }
}

//Search class
class TemplateSearch extends SearchDelegate<Template>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //This is same as the suggestions part this method got triggered when search icon pressed on the keyboard
    final results = Engine.allTemplates.where((a) => a.name.toLowerCase().contains(query));


    return builderFunc(context, results.toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final results = Engine.allTemplates.where((a) => a.name.toLowerCase().contains(query));


    return builderFunc(context, results.toList());
  }
}

Widget builderFunc(BuildContext context, List results){

  return GridView.builder(
      itemCount: results.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return new SelectableWidget(
          new SelectableWidgetViewModel(
          results[index],
          isSelected: false)
        );






  /*Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Card(
            color: color,
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.bottomCenter,
                  child: new Text(results.toList()[index].name,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),),
                ),
                new Container(
                  alignment: Alignment.center,
                  child: new Image.asset('assets/benchpress3.png'),
                )
              ],
            ),
          ),
        );*/
      });
}

class SelectableWidget extends StatefulWidget {
  final SelectableWidgetViewModel viewModel;

  SelectableWidget(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return SelectableWidgetState();
  }
}

class SelectableWidgetState extends State<SelectableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget thisWidget;

    if (widget.viewModel.isSelected) {
      thisWidget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Card(
          color: Colors.green,
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.bottomCenter,
                child: new Text(widget.viewModel.template.name,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
              new Container(
                alignment: Alignment.center,
                child: new Image.asset('assets/benchpress3.png'),
              )
            ],
          ),
        ),
      );
    } else {
      thisWidget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Card(
          color: Colors.purple,
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.bottomCenter,
                child: new Text(widget.viewModel.template.name,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),),
              ),
              new Container(
                alignment: Alignment.center,
                child: new Image.asset('assets/benchpress3.png'),
              )
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.viewModel.isSelected = !widget.viewModel.isSelected;
          if(widget.viewModel.isSelected == true){
            TemplateSelectionPage.selectedTemplates.add(widget.viewModel.template);
          }
          else{
            TemplateSelectionPage.selectedTemplates.remove(widget.viewModel.template);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: thisWidget,
      ),
    );
  }
}

class SelectableWidgetViewModel {
  bool isSelected;
  Template template;

  SelectableWidgetViewModel(this.template, {this.isSelected = false});
}

class MarkedTemplate{
  Template _template;
  bool isMarked;

  MarkedTemplate(this._template, this.isMarked);

}