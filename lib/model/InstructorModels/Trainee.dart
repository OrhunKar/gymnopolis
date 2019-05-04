import 'package:gymnopolis/model/Workout.dart';

class Trainee {
  final String name;
  int lastActivity;
  Workout workout;

  Trainee({this.name, this.lastActivity, this.workout});


  static List<Trainee> allTrainees()
  {
    var list = new List<Trainee>();

    list.add(new Trainee(name: "Can", lastActivity: 1,workout: Workout.exampleWorkout()));
    list.add(new Trainee(name: "Burak", lastActivity: 3,workout: Workout.exampleWorkout()));
    list.add(new Trainee(name: "Umut", lastActivity: 25,workout: Workout.exampleWorkout()));
    list.add(new Trainee(name: "Alperen", lastActivity: 16,workout: Workout.exampleWorkout()));
    list.add(new Trainee(name: "Orhun", lastActivity: 45,workout: Workout.exampleWorkout()));

    return list;
  }

  static List measurements(){
    var list = new List();

    list.add(90);
    list.add(60);
    list.add(90);
    list.add(55);
    list.add(40);

    return list;
  }
}