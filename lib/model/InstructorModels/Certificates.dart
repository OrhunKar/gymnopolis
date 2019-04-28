class Certificates {
  final String name;


  Certificates(this.name);


  static List<Certificates> certificate1()
  {
    var list = new List<Certificates>();

    list.add(new Certificates("Pilates eğitimi"));
    list.add(new Certificates("Fitness eğitimi"));
    list.add(new Certificates("Yüzme eğitimi"));
    return list;
  }

@override
  String toString() {
    // TODO: implement toString
    return this.name;
  }


}