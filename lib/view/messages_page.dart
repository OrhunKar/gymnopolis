import 'package:flutter/material.dart';
import 'package:gymnopolis/view/home_page.dart';

class MessagesPage extends StatefulWidget {
  static String tag = 'login-page'; //tag for router
  @override
  MessagesPageState createState() => MessagesPageState();
}

class MessagesPageState extends State<MessagesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    int _radioValue1 = -1;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: "canavci95@gmail.com",
            decoration: const InputDecoration(
              labelText: 'Email',
            ),

          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: "Can Avcı",
            decoration: const InputDecoration(
              labelText: 'Full name',
            ),

          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: "1.78",
            decoration: const InputDecoration(
              labelText: 'Height',
            ),

          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: "70",
            decoration: const InputDecoration(
              labelText: 'Weight',
            ),

          ),
          const SizedBox(height: 16.0),
          TextFormField(
            initialValue: "5323911251",
            decoration: const InputDecoration(
              labelText: 'Phone',
            ),

          ),
          const SizedBox(height: 16.0),
          new Text(
            'Gender:',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          new Text(
            'Male',
            style: new TextStyle(fontSize: 16.0),
          ),
          new Radio(
            value: 0,
            groupValue: _radioValue1,

          ),
          new Text(
            'Female',
            style: new TextStyle(fontSize: 16.0),
          ),


          new Radio(
            value: 1,
            groupValue: _radioValue1,

          ),

          Row(
            children: <Widget>[
              const Spacer(),
              OutlineButton(
                  highlightedBorderColor: Colors.black,
                  //        onPressed: _submittable() ? _submit : null,
                  child: const Text('Save Changes')
              ),
            ],
          ),
        ],
      ),
    );
  }
}