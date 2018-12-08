import 'package:flutter/material.dart';
import 'package:gymnopolis/view/login_page.dart';
import 'package:gymnopolis/view/home_page.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/view/exerciseinfo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    DayPage.tag: (context) => DayPage(),
    ExerciseInfoPage.tag: (context) => ExerciseInfoPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.blueGrey[50],
        fontFamily: 'Nunito'
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}


