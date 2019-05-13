import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/model/Day.dart';
import 'package:gymnopolis/model/InstructorModels/Template.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/Page.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/template_workout_page.dart';
import 'dart:math' as math;

class TemplatesPage extends StatefulWidget with Page{
  static String tag = 'templates-page';

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
                Engine.allTemplates.add(new Template(name: myController.text, workout: new Workout("Fatty", "PlaceHolder Inst", List<Day>())));
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TemplateWorkoutPage(Engine.allTemplates.last.name, Engine.allTemplates.last.workout, false)));
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
  @override
  Widget build(BuildContext context) {
    return builderFunc(context);
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
    return builderFunc(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return builderFunc(context, query);
  }
}

Widget builderFunc(BuildContext context, [String query = '']){
  return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('workout_plans').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting)
          return new Text('Loading...');

        List<Template> templates = snapshot.data.documents
          .where((document) => document.data.containsKey('name')
            && document.data['name'].toString().toLowerCase().contains(query))
          .map((document) => Template(
            name: document.data['name'],
            workout: Workout('', '', null)))
          .toList();

        return GridView.builder(
            itemCount: templates.length,
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
                          child: new Text(templates[index].name,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                    TemplateWorkoutPage(templates[index].name, templates[index].workout, true)));
                },
              );
            });
      });
}


