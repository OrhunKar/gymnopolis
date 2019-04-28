///Orderable list view dependency taken from here
///https://github.com/knopp/flutter_reorderable_list/blob/master/example/lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:gymnopolis/model/Exercise.dart';
import 'package:gymnopolis/model/Workout.dart';
import 'package:gymnopolis/view/day_page.dart';
import 'package:gymnopolis/view/Page.dart';





class WorkoutPage extends StatefulWidget with Page{
  static String tag = 'workout-page';

  @override
  WorkoutState createState() => WorkoutState();

  List<Widget> topBar(BuildContext context){
    return null;
  }
}

class ItemData {
  ItemData(this.title, this.leadingNumber, this.instructorName, this.exercise, this.key);

  final String title;
  final String leadingNumber;
  final String instructorName;
  final List<Exercise> exercise;

  // Each item in reorderable list needs stable and unique key
  final Key key;
}

//This can be changed according to target audience
enum DraggingMode {
  iOS,
  Android,
}


class WorkoutState extends State<WorkoutPage> {

  Workout _workout = Workout("workout1", "Can Hoca", Workout.allDays());

  List<ItemData> _items;

  WorkoutState() {
    _items = List();
    for (int i = 0; i < _workout.allWorkouts().length; ++i) {
      String number = (i+1).toString();
      String label = _workout.allWorkouts()[i].name;
      String instructorName = _workout.instructorName;
      List<Exercise> exercise = _workout.allWorkouts()[i].exerciseList;
      _items.add(ItemData(label,number, instructorName, exercise, ValueKey(i)));
    }
  }

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return _items.indexWhere((ItemData d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder position
    // if (newPositionIndex % 2 == 1)
    //   return false;

    final draggedItem = _items[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      _items.removeAt(draggingIndex);
      _items.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = _items[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.title}}");
  }

  //
  // Reordering works by having ReorderableList widget in hierarchy
  // containing ReorderableItems widgets
  //

  DraggingMode _draggingMode = DraggingMode.Android;

  Widget build(BuildContext context) {
    return ReorderableList(
        onReorder: this._reorderCallback,
        onReorderDone: this._reorderDone,
        child: CustomScrollView(
          // cacheExtent: 3000,
          slivers: <Widget>[
            /*SliverAppBar(
              actions: <Widget>[
                PopupMenuButton<DraggingMode>(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("Options"),
                  ),
                  initialValue: _draggingMode,
                  onSelected: (DraggingMode mode) {
                    setState(() {
                      _draggingMode = mode;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<DraggingMode>>[
                    const PopupMenuItem<DraggingMode>(
                        value: DraggingMode.iOS,
                        child: Text('iOS-like dragging')),
                    const PopupMenuItem<DraggingMode>(
                        value: DraggingMode.Android,
                        child: Text('Android-like dragging')),
                  ],
                ),
              ],
              pinned: true,
              expandedHeight: 150.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: const Text('Demo'),
              ),
            ),*/
            SliverPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Item(
                        data: _items[index],
                        // first and last attributes affect border drawn during dragging
                        isFirst: index == 0,
                        isLast: index == _items.length - 1,
                        draggingMode: _draggingMode,
                      );
                    },
                    childCount: _items.length,
                  ),
                )),
          ],
        ),
      );
  }
}

class Item extends StatelessWidget {
  Item({
    this.data,
    this.isFirst,
    this.isLast,
    this.draggingMode,
  });

  final ItemData data;
  final bool isFirst;
  final bool isLast;
  final DraggingMode draggingMode;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like on iOS)
      decoration = BoxDecoration(color: Color(0xD0FFFFFF));
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context) //
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none //
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : Colors.white);
    }

    // For iOS dragging mdoe, there will be drag handle on the right that triggers
    // reordering; For android mode it will be just an empty container
    Widget dragHandle = draggingMode == DraggingMode.iOS
        ? ReorderableListener(
      child: Container(
        padding: EdgeInsets.only(right: 18.0, left: 18.0),
        color: Color(0x08000000),
        child: Center(
          child: Icon(Icons.reorder, color: Color(0xFF888888)),
        ),
      ),
    )
        : Container();

    Widget content = Container(
      decoration: decoration,
      child: Card(
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DayPage(data.title, data.exercise),
                )
            );},
          child: SafeArea(
              top: false,
              bottom: false,
              child: Opacity(
                // hide content for placeholder
                opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                            child: ListTile(
                              title: new Text(data.title, style: new TextStyle(fontSize: 22.0)),
                              subtitle: new Text(data.instructorName , style: new TextStyle(fontStyle: FontStyle.italic)),
                              leading: new CircleAvatar(
                                child: new Text(data.leadingNumber)
                              ),
                            ),
                          )),
                      // Triggers the reordering
                      dragHandle,
                    ],
                  ),
                ),
              )),
        ),
      ),
    );

    // For android dragging mode, wrap the entire content in DelayedReorderableListener
    if (draggingMode == DraggingMode.Android) {
      content = DelayedReorderableListener(
        child: content,
      );
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: data.key, //
        childBuilder: _buildChild);
  }


  /*
  Workout _workout = Workout("workout1", "Can Hoca");

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
      itemCount: _workout.allWorkouts().length,
      itemBuilder: (BuildContext context, int index){
        return new GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage(_workout.allWorkouts()[index].name, _workout.allWorkouts()[index].exerciseList),
              )
            );},
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: new ListTile(
                  title : new Text(_workout.allWorkouts()[index].name, style: new TextStyle(fontSize: 22.0)),
                  subtitle: new Text(_workout.instructorName , style: new TextStyle(fontStyle: FontStyle.italic)),
                  leading: new CircleAvatar(
                      child: new Text((index+1).toString())
                  )
              ),
            ),
          ),
        ) ;
      },
      padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
  */
}