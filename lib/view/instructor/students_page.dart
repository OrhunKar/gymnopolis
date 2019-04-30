import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Trainee.dart';
import 'package:gymnopolis/view/Page.dart';
import 'package:gymnopolis/view/instructor/studentPages/student_profile_page.dart';

final List<Trainee> _trainees = Trainee.allTrainees();

class StudentsPage extends StatefulWidget with Page{
  static String tag = 'student-page';

  List<Widget> topBar(BuildContext context){
    return <Widget>[
      new IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: TraineeSearch());
        },
      ),
    ];
  }

  createState() {
    return StudentsPageState();
  }
}

@override
class StudentsPageState extends State<StudentsPage> {

  Widget build(BuildContext context) {
    return HelperWidget.pageContent(context, _trainees);
  }
}

//Search class
class TraineeSearch extends SearchDelegate<Trainee>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final results = _trainees.where((a) => a.name.toLowerCase().contains(query));

    return HelperWidget.pageContent(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final results = _trainees.where((a) => a.name.toLowerCase().contains(query));

    return HelperWidget.pageContent(context, results);

  }

}


//Helper Widget class
class HelperWidget{

  static Widget pageContent(BuildContext context, List<Trainee> results){
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage()),
            );*/},
          child: new ListTile(
            title : new Text(results.toList()[index].name),
            subtitle: new Text(results.toList()[index].lastActivity.toString() + ' minutes ago'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentProfilePage(results.toList()[index]),
                  )
              );},
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
