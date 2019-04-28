import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/InstructorModels/Template.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/Page.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/template_workout_page.dart';
import 'dart:math' as math;



class TemplatesPage extends StatefulWidget with Page{
  static String tag = 'templates-page';

  static List<Template> templates = Template.allTemplates();

  String creationName;

  List<Widget> topBar(BuildContext context){
    return <Widget>[
      new IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: TemplateSearch(),);
        },
      ),
    ];
  }

  FloatingActionButton floatingButton(BuildContext context){

    final myController = TextEditingController();

    return FloatingActionButton(
      onPressed: (){showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: new Text("Template Name"),
            content: new TextField(
              controller: myController,
              autofocus: true,
              decoration: new InputDecoration(
                  hintText: 'eg. Upper Body Workout'),
              onEditingComplete: (){
                TemplatesPage.templates.add(new Template(name: myController.text, workout: new Workout("Fatty", "PlaceHolder Inst", List<Day>())));
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TemplateWorkoutPage(templates.last.name, templates.last.workout)));
                },

            ),
          )
      );},
      child: Icon(Icons.add)
        //(context) => TemplateWorkoutPage('PlaceHolder', new Workout('PlaceHolder', 'PlaceHolder Trainer', new List<Day>()))
    );
  }

  createState() {
    return TemplatesPageState();
  }
}

@override
class TemplatesPageState extends State<TemplatesPage> {


  Widget build(BuildContext context) {
    return new GridView.builder(
      itemCount: TemplatesPage.templates.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Card(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.bottomCenter,
                    child: new Text(TemplatesPage.templates[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    child: new Image.asset('assets/benchpress3.png'),
                  )
                ],
              ),
            ),
          ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateWorkoutPage(TemplatesPage.templates[index].name, TemplatesPage.templates[index].workout)));
        },
      );
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
    final results = TemplatesPage.templates.where((a) => a.name.toLowerCase().contains(query));


    return GridView.builder(
        itemCount: results.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0),
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
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateWorkoutPage(results.toList()[index].name, results.toList()[index].workout)));
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    final results = TemplatesPage.templates.where((a) => a.name.toLowerCase().contains(query));


    return GridView.builder(
        itemCount: results.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0),
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
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateWorkoutPage(results.toList()[index].name, results.toList()[index].workout)));
            },
          );
        });
  }
}


