class Trainee {
  final String name;
  final String lastActivity;

  Trainee({this.name, this.lastActivity});


  static List<Trainee> allTrainees()
  {
    var list = new List<Trainee>();

    list.add(new Trainee(name: "Can", lastActivity: '1 day ago'));
    list.add(new Trainee(name: "Burak", lastActivity: '2 days ago'));
    list.add(new Trainee(name: "Umut", lastActivity: '1 days ago'));
    list.add(new Trainee(name: "Alperen", lastActivity: '1 days ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));
    list.add(new Trainee(name: "Orhun", lastActivity: '1 minute ago'));

    return list;
  }


}