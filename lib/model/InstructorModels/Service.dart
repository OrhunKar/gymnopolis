import 'package:gymnopolis/model/InstructorModels/Trainer.dart';

class Service {
  int id;
  String name;
  String description;
  double rating;
  double cost;
  Service(this.id,this.name,  this.description, this.rating, this.cost);

  static List<Service> canServices()
  {
    var list = new List<Service>();

    list.add(new Service(1,"Begginer Fitness",  "ATHLEAN XERO is an intense all out bodyweight assault, requiring absolutely no equipment. You literally need your own body and that’s it, making it possible to perform these workouts any where at any time. From dorm rooms to hotel rooms, military barracks to the most desolate surroundings or ill equipped gym…XERO leaves behind the machines, and the excuses! With ATHLEAN XERO, you are the machines! 3…2…1…XERO, the wait is over. The revolution in bodyweight strength training has arrived!",  8,  900));
    list.add(new Service(2,"Intermediate Fitness",  "afgdgdfhgfh",  5,  50));
    list.add(new Service(3,"Calistenichs Begginer",  "hdfhgjbnbnbnb",  6,  70));
    list.add(new Service(4,"Street Workout",  "sdgfdgjhkghjdsdsfsdfdfs",  9,  90));

    return list;
  }
  static List<Service> jeffcavaliere()
  {
    var list = new List<Service>();

    list.add(new Service(1,"Max Size",  "Max/Size is a high volume, high intensity, hardcore training program designed around the classic, old school lifts. Intended to force hardgainers into building muscle, Max/Size will also help seasoned athletes take their physiques to whole new levels and experience new gains. Whether you’re just starting out or have been in the iron game for years Max/Size sets the old rule books ablaze and delivers scorching results.",  8,  40));
    list.add(new Service(2,"Breakout",  "Breakout is a 12-week training program designed for experienced lifters whose strength and hypertrophy gains have slowed or come to a complete halt. If you’re not an experienced lifter then BREAKOUT is NOT for you. If you are, and you’re ready to start making gains like you used to then it’s time to break through your plateaus and start redefining what your true muscular potential looks like!.",  5,  50));
    list.add(new Service(3,"Total Beaxst",  "“That guy’s a total beast”! Without even knowing who is being spoken about we have a clear mental picture of someone with thick powerful muscle and a “no quit” work capacity that turns out savage performances in the weight room or on the field.",  6,  70));
    list.add(new Service(4,"XERO",  "“That guy’s a total beast”! Without even knowing who is being spoken about we have a clear mental picture of someone with thick powerful muscle and a “no quit” work capacity that turns out savage performances in the weight room or on the field.",  9,  30));

    return list;
  }

  static List<Service> mikeetyson()
  {
    var list = new List<Service>();

    list.add(new Service(1,"Professional Boxing Training",  "If you are a professional boxer or want to become one, this is the program you need.",  8,  40));

    return list;
  }
  static List<Service> greg()
  {
    var list = new List<Service>();

    list.add(new Service(1,"Super Hero Bulking Program",  "The Superhero Bulking Program is a comprehensive training program that teaches you how to rapidly put on muscle with aesthetic proportion to achieve the muscular Hollywood Physique like Henry Cavill in Man of Steel, or Chris Hemsworth in Thor.",  8,  40));
    list.add(new Service(2,"Goddess Toning Program",  "Used by over 13,421 women, this programs shows you exactly how to slim down to a low body fat while developing great-looking shape and muscle tone (but not too much to look “bulky” or too muscular. Best of all, you’ll do this working out just 3 days per week and enjoying the foods you love.",  8,  40));
    list.add(new Service(3,"Bodyweight Mastery Program",  "Used by over 6,626 people to build incredible (and functional) physiques, the Bodyweight Mastery Program is the ideal program to supplement with other programs to build mobility and strength outside of the gym.",  8,  40));
    return list;
  }
}