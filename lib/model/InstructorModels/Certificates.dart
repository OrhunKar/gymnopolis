class Certificates {
  final String name;


  Certificates(this.name);


  static List<Certificates> certificate1()
  {
    var list = new List<Certificates>();

    list.add(new Certificates("Physical Therapy"));
    list.add(new Certificates("Workout Science"));
    list.add(new Certificates("Conditioning"));
    return list;
  }
  static List<Certificates> boxing()
  {
    var list = new List<Certificates>();

    list.add(new Certificates("Professional Boxing"));
    list.add(new Certificates("Condiitoning"));

    return list;
  }
@override
  String toString() {
    // TODO: implement toString
    return this.name;
  }


}