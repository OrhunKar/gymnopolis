class Workout {

  final String name;
  final int day;
  final String instructorName;

  Workout({this.name, this.day, this.instructorName});

  static List<Workout> allWorkouts()
  {
    var list = new List<Workout>();

    list.add(new Workout(name: "Chest", day: 1, instructorName: "Can"));
    list.add(new Workout(name: "Back", day: 2, instructorName: "Can"));
    list.add(new Workout(name: "Legs", day: 3, instructorName: "Can"));
    list.add(new Workout(name: "Shoulder", day: 4, instructorName: "Can"));

    return list;
  }
}