import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
class Trainer {
  final int id;
  final String picture;
  final String fullname;
  final double rating;
  final double salary;
  final String bio;
  final String location;
  final String profession;
  Trainer(this.id, this.picture, this.fullname, this.rating, this.salary,this.bio,this.location,this.profession);


  static List<Trainer> allTrainers()
  {
    var list = new List<Trainer>();

    list.add(new Trainer(1, "https://i.hizliresim.com/k9dbRJ.png", "Can Avcı",  8,  900,  "I was born in etc etc etc","Ankara","Calisthenics"));
    list.add(new Trainer(2, "https://i.hizliresim.com/k9dbRJ.png", "Umut Ak",  7, 900,  "I was born in etc etc etc","İstanbul","Body Building"));
    list.add(new Trainer(3, "https://i.hizliresim.com/k9dbRJ.png", "Orhun Kar",  8,  900,  "I was born in etc etc etc","Mersin","Power Lifting" ));
    list.add(new Trainer(4, "https://i.hizliresim.com/k9dbRJ.png", "Alperen Kaya",  8, 900,  "I was born in etc etc etc","Denizli","Boxing"));
    list.add(new Trainer(5, "https://i.hizliresim.com/k9dbRJ.png", "Burak Gök",  8,  900,  "I was born in etc etc etc","Malatya","Running"));
    return list;
  }
  static List<Trainer> collab1()
  {
    var list = new List<Trainer>();

    list.add(new Trainer(1, "https://i.hizliresim.com/k9dbRJ.png", "Can Avcı",  8,  900,  "I was born in etc etc etc","Ankara","Calisthenics"));
    list.add(new Trainer(2, "https://i.hizliresim.com/k9dbRJ.png", "Umut Ak",  7, 900,  "I was born in etc etc etc", "Istanbul","Body Building"));

    return list;
  }
}