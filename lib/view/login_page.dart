//Log In page design inspired from https://github.com/putraxor/flutter-login-ui

import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';
import 'package:flutter/services.dart';
import 'package:gymnopolis/view/instructor/instructor_home_page.dart';
import 'package:gymnopolis/ExternalStyles/TabIndicationPainter.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page'; //tag for router
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String loginType = "Trainee";


  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      )
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'example@example.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      )
    );

    final password = TextFormField(
        autofocus: false,
        initialValue: '******',
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0)
            )
        )
    );

    final loginButton = new RaisedButton(
      child: new Text('Log In', style: TextStyle(fontSize: 18.0, color: Colors.white),),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushNamed(context, userType());
      },
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.white,
    );
    final registerButton = new RaisedButton(
      child: new Text('Register', style: TextStyle(fontSize: 18.0, color: Colors.white),),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pushNamed(context, userType());
      },
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.white,
    );
   /* final becomeTrainerButton = new RaisedButton(
      child: new Text('Register', style: TextStyle(fontSize: 18.0, color: Colors.white),),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.white,
    );*/

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 8.0),
            _buildMenuBar(context),
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            SizedBox(height: 8.0),
            registerButton
            //        SizedBox(height: 8.0),
  //          becomeTrainerButton
          ],
        ),
      ),
    );

  }

  Widget _buildMenuBar(BuildContext context) {

    return Container(
      width: 300.0,
      height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: getColorForTrainee(loginType),
              child: FlatButton(
                onPressed: ()=> setState(() => loginType = "Trainee"),

                child: Text(
                  "Trainee",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Container(
              color: getColorForTrainer(loginType),
              child: FlatButton(
                onPressed: () => setState(() => loginType = "Trainer"),

                child: Text(
                  "Trainer",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
    );
  }

  Color getColorForTrainee(String type) {
    if (type == "Trainee") {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  Color getColorForTrainer(String type) {
    if (type == "Trainer") {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  String userType(){
    if(loginType == "Trainer")
      return 'instructor-home-page';
    else
      return 'home-page';

  }
}


