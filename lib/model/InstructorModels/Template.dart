class Template {
  final String name;

  Template({this.name});


  static List<Template> allTemplates()
  {
    var list = new List<Template>();

    list.add(new Template(name: "Fatty"));
    list.add(new Template(name: "Skinny"));
    list.add(new Template(name: "Runner"));
    list.add(new Template(name: "Jumper"));
    list.add(new Template(name: "Builder"));
    list.add(new Template(name: "+"));

    return list;
  }


}