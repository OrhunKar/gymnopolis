import 'package:flutter/material.dart';
import 'package:gymnopolis/model/InstructorModels/Template.dart';
import 'package:gymnopolis/view/instructor/templateCreationPages/template_workout_page.dart';

final List<Template> _templates = Template.allTemplates();

class TemplatesPage extends StatefulWidget {
  static String tag = 'templates-page';

  createState() {
    return TemplatesPageState();
  }

}

@override
class TemplatesPageState extends State<TemplatesPage> {


  Widget build(BuildContext context) {
    return new GridView.count(
      // Create a grid with 4 columns. If you change the scrollDirection to
      // horizontal, this would produce 4 rows.
        crossAxisCount: 4,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(_templates.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: Center(
                child: new ListTile(
                  title : new Text(_templates[index].name),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TemplateWorkoutPage(_templates[index].name)));
                  },
                ),
              ),
            ),
          );
        })
    );
  }
}


