///There are some more information to get such as disposing an active ticker look onto it
///TickerProviderStateMixin is useful for implementing custom countdowns

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:floating_bubble/floating_bubble.dart';

class WorkoutAssistantExercisePage extends StatefulWidget{


  @override
  WorkoutAssistantExercisePageState createState() => WorkoutAssistantExercisePageState();

}

class WorkoutAssistantExercisePageState extends State<WorkoutAssistantExercisePage> with TickerProviderStateMixin{
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),  //Change the time in the middle from here
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[FloatingBubble(
          child: PreferredSize(
            preferredSize: Size(256.0, 256.0),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.loose,
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tight(Size(256.0, 256.0)),
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: AnimatedBuilder(
                                        animation: controller,
                                        builder: (BuildContext context, Widget child) {
                                          return CustomPaint(
                                              painter: TimerPainter(
                                                animation: controller,
                                                backgroundColor: Colors.white,
                                                color: themeData.indicatorColor,
                                              ));
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: FractionalOffset.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Count Down",
                                            style: themeData.textTheme.subhead,
                                          ),
                                          AnimatedBuilder(
                                              animation: controller,
                                              builder: (BuildContext context, Widget child) {
                                                return Text(
                                                  timerString,
                                                  style: themeData.textTheme.display4,
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            child: AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return Icon(controller.isAnimating
                                    ? Icons.pause
                                    : Icons.play_arrow);
                              },
                            ),
                            onPressed: () {
                              if (controller.isAnimating)
                                controller.stop();
                              else {
                                controller.reverse(
                                    from: controller.value == 0.0
                                        ? 1.0
                                        : controller.value);
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),]
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}