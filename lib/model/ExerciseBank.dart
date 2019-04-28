
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/Exercise.dart';

class ExerciseBank{


  static List<Exercise> exampleExercises()
  {
    var list = new List<Exercise>();

    list.add(new Exercise(name: "Bench Press", image: Image.asset('assets/benchpress3.png')));
    list.add(new Exercise(name: "French Press", image: Image.asset('assets/benchpress3.png')));
    list.add(new Exercise(name: "Dumbell Press", image: Image.asset('assets/benchpress3.png')));
    list.add(new Exercise(name: "Romanian Deadlift", image: Image.asset('assets/benchpress3.png')));

    return list;
  }
}