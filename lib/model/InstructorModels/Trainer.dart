
import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Service.dart';
import 'package:gymnopolis/model/InstructorModels/Certificates.dart';

class Trainer {
  final int id;
  final String picture;
  final String fullname;
  final double rating;
  final double salary;
  final String bio;
  final String location;
  final String profession;
  final List<Certificates> certificates;
  final int age;
  final List<Service> services;
  Trainer(this.id, this.picture, this.fullname, this.rating, this.salary,this.bio,this.location,this.profession, this.age, this.certificates,this.services);


  static List<Trainer> allTrainers()
  {
    var list = new List<Trainer>();

    list.add(new Trainer(1, "https://i.hizliresim.com/RrdXW1.jpg", "Can Avcı",  8,  900,  "I was born in etc etc etc df g yes and then I etc etc also known asdg dsaddfgfgfg fsgdgdfgdfg","Ankara","Calisthenics",23,Certificates.certificate1(),Service.canServices()));
    list.add(new Trainer(2, "https://i.hizliresim.com/RrdXW1.jpg", "Umut Ak",  7, 900,  "I was born in etc etc etc","İstanbul","Body Building",24,Certificates.certificate1(),Service.canServices()),);
    list.add(new Trainer(3, "https://i.hizliresim.com/RrdXW1.jpg", "Orhun Kar",  8,  900,  "I was born in etc etc etc","Mersin","Power Lifting",25,Certificates.certificate1(),Service.canServices() ));
    list.add(new Trainer(4, "https://i.hizliresim.com/RrdXW1.jpg", "Alperen Kaya",  8, 900,  "I was born in etc etc etc","Denizli","Boxing",26,Certificates.certificate1(),Service.canServices()));
    list.add(new Trainer(5, "https://i.hizliresim.com/RrdXW1.jpg", "Burak Gök",  8,  900,  "I was born in etc etc etc","Malatya","Running",27,Certificates.certificate1(),Service.canServices()));
    return list;
  }
  static List<Trainer> collab1()
  {
    var list = new List<Trainer>();

    list.add(new Trainer(1, "https://i.hizliresim.com/k9dbRJ.png", "Can Avcı",  8,  900,  "I was born in etc etc etc","Ankara","Calisthenics",23,Certificates.certificate1(),Service.canServices()));
    list.add(new Trainer(2, "https://i.hizliresim.com/k9dbRJ.png", "Umut Ak",  7, 900,  "I was born in etc etc etc", "Istanbul","Body Building",24,Certificates.certificate1(),Service.canServices()));

    return list;
  }
}