

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymnopolis/model/Workout.dart';

class Template {
  final String name;
  final Workout workout;
  final DocumentReference reference;

  Template({this.name, this.workout, this.reference});




  /*static List<Template> allTemplates()
  {
    var list = new List<Template>();

    list.add(new Template(name: "Fatty", workout: new Workout("Fatty", "PlaceHolder Inst", Workout.allDays())));
    list.add(new Template(name: "Skinny", workout: new Workout("Skinny", "PlaceHolder Inst", Workout.allDays())));
    list.add(new Template(name: "Runner", workout: new Workout("Runner", "PlaceHolder Inst", List<Day>())));
    list.add(new Template(name: "Jumper", workout: new Workout("Jumper", "PlaceHolder Inst", List<Day>())));
    list.add(new Template(name: "Builder", workout: new Workout("Builder", "PlaceHolder Inst", List<Day>())));

    return list;
  }*/


}