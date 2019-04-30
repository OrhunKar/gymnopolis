import 'package:gymnopolis/model/Workout.dart';

class Trainee {
  final String name;
  int lastActivity;
  Workout workout;

  Trainee({this.name, this.lastActivity});


  static List<Trainee> allTrainees()
  {
    var list = new List<Trainee>();

    list.add(new Trainee(name: "Can", lastActivity: 1));
    list.add(new Trainee(name: "Burak", lastActivity: 3));
    list.add(new Trainee(name: "Umut", lastActivity: 25));
    list.add(new Trainee(name: "Alperen", lastActivity: 16));
    list.add(new Trainee(name: "Orhun", lastActivity: 45));
    list.add(new Trainee(name: "Ali", lastActivity: 6));
    list.add(new Trainee(name: "Osman", lastActivity: 56));
    list.add(new Trainee(name: "Omer", lastActivity: 50));
    list.add(new Trainee(name: "Salih", lastActivity: 45));
    list.add(new Trainee(name: "Fatma", lastActivity: 32));
    list.add(new Trainee(name: "Buket", lastActivity: 25));
    list.add(new Trainee(name: "Ayse", lastActivity: 2));
    list.add(new Trainee(name: "Deniz", lastActivity: 9));

    return list;
  }
}