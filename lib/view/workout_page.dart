/// Orderable list view dependency taken from
/// https://github.com/knopp/flutter_reorderable_list/blob/master/example/lib/main.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:gymnopolis/controller/Engine.dart';
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
  ItemData(this.key, this.day, this.trainer, this.reference);

  // Each item in reorderable list needs stable and unique key
  final Key key;
  final int day;
  final String trainer;
  final CollectionReference reference;
}

//This can be changed according to target audience
enum DraggingMode {
  iOS,
  Android,
}

class WorkoutState extends State<WorkoutPage> {
  List<Key> keys;

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return keys.indexOf(key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder position
    // if (newPositionIndex % 2 == 1)
    //   return false;

    final draggedItem = keys[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      keys.removeAt(draggingIndex);
      keys.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = keys[_indexOfKey(item)];
    debugPrint("Reordering finished for index $draggedItem");
  }

  //
  // Reordering works by having ReorderableList widget in hierarchy
  // containing ReorderableItems widgets
  //

  DraggingMode _draggingMode = DraggingMode.Android;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('workout_plans')
        .where('trainee', isEqualTo: Engine.user).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        if (snapshot.connectionState == ConnectionState.waiting)
          return new Text('Loading...');

        if (snapshot.data.documents.isEmpty)
          return Container();
        
        var workoutPlan = snapshot.data.documents[0];
        var trainer = workoutPlan.data['trainer'];
        var days = workoutPlan.data['days'];
        // setState(() {
          keys = List.generate(days, (i) => ValueKey(i));
        // });

        return ReorderableList(
          onReorder: this._reorderCallback,
          onReorderDone: this._reorderDone,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    var day = index + 1;
                    return Item(
                      data: ItemData(keys[index], day, trainer,
                        workoutPlan.reference.collection(day.toString())),
                      // first and last attributes affect border drawn during dragging
                      isFirst: index == 0,
                      isLast: index == days - 1,
                      draggingMode: _draggingMode,
                    );
                  },
                  childCount: days,
                )))]));
      }
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
    ) : Container();

    Widget content = Card(
      //color: Color(0xFFfbab66),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayPage(data.reference),
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
                            title: new Text('Day ${data.day}', style: new TextStyle(fontSize: 22.0)),
                            subtitle: new Text('Trainer: ${data.trainer}', style: new TextStyle(fontStyle: FontStyle.italic)),
                            leading: new CircleAvatar(
                              child: new Text(data.day.toString())
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
}