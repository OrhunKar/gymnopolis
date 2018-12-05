class Exercise {
  final String name;
  final int minRep;
  final int maxRep;
  final int minRPE;
  final int maxRPE;
  final int set;

  Exercise({this.name, this.minRep, this.maxRep, this.minRPE, this.maxRPE,
      this.set});

  static List<Exercise> allExercises()
  {
    var list = new List<Exercise>();

    list.add(new Exercise(name: "Bench Press", minRep: 12, maxRep: 15, minRPE: 8, maxRPE: 9, set: 5));

    return list;
  }

  String subtitle() {
    return "";
  }
}


