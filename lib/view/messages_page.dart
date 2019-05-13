import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:gymnopolis/controller/Engine.dart';
import 'package:gymnopolis/utils/transformed_firestore_list.dart';
import 'package:gymnopolis/view/Page.dart';

class MessagesPage extends StatefulWidget with Page {
  static String tag = 'login-page'; //tag for router
  @override
  MessagesPageState createState() => MessagesPageState();

  List<Widget> topBar(BuildContext context) {
    return null;
  }
}

class Message {
  final String data;
  final MessageOwner owner;
  Message(this.data, this.owner);
}

class MessagesPageState extends State<MessagesPage> {
  static const _animationDuration = Duration(milliseconds: 300);
  final _scrollController = ScrollController();

  final _conversation = Firestore.instance.collection('conversation');
  final _textController = TextEditingController();
  var _query;

  @override
  void initState() {
    super.initState();
    /* All messages are retrieved now. As an optimization, an increasing number
     * of recent messages may be retrieved depending on the scrolling amount.
     */
    _query = _conversation.orderBy('date').snapshots();
  }

  void _onPressed() {
    _conversation.add({'date': Timestamp.now(), 'sender': Engine.user, 'text': _textController.text});
    _textController.clear();
  }
  void _hideKeyboard() => SystemChannels.textInput.invokeMethod('TextInput.hide');
  // void _hideKeyboard(BuildContext context) => FocusScope.of(context).requestFocus(new FocusNode());

  // List<Message> messages = [
  //   Message('You said this.', MessageOwner.other),
  //   Message('I said this.', MessageOwner.me),
  //   Message('I said an incredibly unusually abnormally long sentence.', MessageOwner.me)
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Flexible(
        child: GestureDetector(
          onTapDown: (_) => _hideKeyboard(),
          child: FirestoreTransformedList<Message>(
            padding: EdgeInsets.all(8),
            controller: _scrollController,
            duration: _animationDuration,
            onLoaded: (_) => SchedulerBinding.instance.addPostFrameCallback((_) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: _animationDuration);
            }),
            query: _query,
            transformer: (DocumentSnapshot snapshot) => Message(snapshot.data['text'],
              snapshot.data['sender'] == Engine.user ? MessageOwner.me : MessageOwner.other),
            itemBuilder: (_, List<Message> messages, int index, Animation<double> animation) {
              var message = messages[index];
              return LayoutBuilder(
                builder: (_, BoxConstraints constraints) =>
                Align(
                  alignment: message.owner == MessageOwner.me
                    ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 0.8 * constraints.maxWidth),
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: MessageWidget(
                        Text(message.data, style: TextStyle(fontSize: 16)),
                        message.owner, index + 1 >= messages.length
                          || messages[index + 1].owner != message.owner,
                        animation
                    ))));
            }))),
      Divider(height: 1.0),
      IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                // onSubmitted: _onSubmitted,
                decoration: InputDecoration.collapsed(hintText: "Send a message")
              )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS
                ? CupertinoButton(child: Text("Send"), onPressed: _onPressed)
                : IconButton(icon: Icon(Icons.send), onPressed: _onPressed)
            )]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[200]))) : null
        ))]);
  }
}

enum MessageOwner {me, other}

class MessageWidget extends StatelessWidget {
  final Widget content;
  final MessageOwner owner;
  /// Consecutive messages from the same person form a message group. One
  /// message from a message group is chosen as the holder of that group and
  /// represented differently. The holder is typically the first or last
  /// message and painted as a speech balloon, while the other messages are
  /// painted as rounded rectangles.
  final bool holder;
  final Animation<double> animation;
  MessageWidget(this.content, this.owner, this.holder, this.animation);

  static final Paint
    meStroke = Paint()..color = Colors.green,
    meFill = Paint()..color = Colors.lightGreen,
    otherStroke = Paint()..color = Colors.grey,
    otherFill = Paint()..color = Colors.white;

  static final double radius = 10;
  static final Size tipSize = Size(10, 10);

  @override
  Widget build(BuildContext context) {
    bool mine = owner == MessageOwner.me;
    return FadeTransition(
      opacity: animation,
      child: CustomPaint(
        painter: BalloonPainter(
          mine ? BalloonDirection.right : BalloonDirection.left,
          radius, tipSize, holder,
          mine ? meStroke : otherStroke,
          mine ? meFill : otherFill
        ),
        child: Padding(
          padding: EdgeInsets.all(radius) + (mine
            ? EdgeInsets.only(right: tipSize.width)
            : EdgeInsets.only(left: tipSize.width)),
          child: content
        ),
        isComplex: false,
        willChange: false
      ));
  }
}

enum BalloonDirection {left, right}

class BalloonPainter extends CustomPainter {
  final double radius;
  final Size tipSize;
  final bool tipVisible;
  final Paint stroke, fill;
  final BalloonDirection direction;

  // Default values
  // BalloonPainter(this.direction, {
  //   this.radius: 10,
  //   this.tipSize: const Size(10, 10),
  //   stroke, fill
  // }) : stroke = stroke ?? Paint()..color = Colors.grey,
  //      fill = fill ?? Paint()..color = Colors.white;

  BalloonPainter(
    this.direction,
    this.radius, this.tipSize, this.tipVisible,
    this.stroke, this.fill);
  //: assert(direction != null), ...;

  @override
  void paint(Canvas canvas, Size size) {
    if (tipVisible) {
      var oval = Size.fromRadius(radius);
      var path = Path();
      if (direction == BalloonDirection.left) path
        ..addArc(((size - oval) as Offset) & oval, 0.0, pi/2)
        ..arcTo(Offset(tipSize.width, size.height - oval.height) & oval, pi/2, pi/2, false)
        ..lineTo(0.0, size.height - oval.height - tipSize.height/2)
        ..lineTo(tipSize.width, size.height - oval.height - tipSize.height)
        ..arcTo(Offset(tipSize.width, 0) & oval, pi, pi/2, false)
        ..arcTo(Offset(size.width - oval.width, 0) & oval, 3*pi/2, pi/2, false)
        ..close();
      else path
        ..addArc(((size - (oval + Offset(tipSize.width, 0))) as Offset) & oval, 0, pi/2)
        ..arcTo(Offset(0, size.height - oval.height) & oval, pi/2, pi/2, false)
        ..arcTo(Offset.zero & oval, pi, pi/2, false)
        ..arcTo(Offset(size.width - oval.width - tipSize.width, 0) & oval, 3*pi/2, pi/2, false)
        ..lineTo(size.width - tipSize.width, size.height - oval.height - tipSize.height)
        ..lineTo(size.width, size.height - oval.height - tipSize.height/2)
        ..close();
      canvas.drawPath(path, fill..style = PaintingStyle.fill);
      canvas.drawPath(path, stroke..style = PaintingStyle.stroke);
    } else {
      var r = Radius.circular(radius);
      var rect = direction == BalloonDirection.left
        ? RRect.fromLTRBR(tipSize.width, 0, size.width, size.height, r)
        : RRect.fromLTRBR(0, 0, size.width - tipSize.width, size.height, r);
      canvas.drawRRect(rect, fill..style = PaintingStyle.fill);
      canvas.drawRRect(rect, stroke..style = PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}