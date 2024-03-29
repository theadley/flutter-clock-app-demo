import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clock_app/clock/clock_face.dart';
import 'package:clock_app/clock/clock_dial_painter.dart';
import 'package:clock_app/clock/clock_hands.dart';

typedef TimeProducer = DateTime Function();

class Clock extends StatefulWidget {
  final Color circleColor;
  final Color shadowColor;
  final TimeProducer getCurrentTime;
  final Duration updateDuration;

  Clock(
      {this.circleColor = const Color(0XFFE1ECF7),
      this.shadowColor = const Color(0XFFD9E2ED),
      this.getCurrentTime = getSystemTime,
      this.updateDuration = const Duration(seconds: 1)});

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  State<StatefulWidget> createState() {
    return _Clock();
  }
}

class _Clock extends State<Clock> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(widget.updateDuration, setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1.0,
      child: buildClockCircle(context),
    );
  }

  Container buildClockCircle(BuildContext context) {
    return new Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          new BoxShadow(
            offset: new Offset(0.0, 5.0),
            blurRadius: 0.0,
            color: widget.shadowColor,
          ),

          new BoxShadow(
              offset: new Offset(0.0, 5.0),
              color: widget.circleColor,
              blurRadius: 10.0,
              spreadRadius: -8)
        ],
      ),
      child: Stack(
        children: <Widget>[
          new ClockFace(
            dateTime: dateTime,
          ),
          new Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25.0),
            child: new CustomPaint(
              painter: new ClockDialPainter(),
            ),
          ),
          new ClockHands(dateTime: dateTime),
        ],
      ),
    );
  }
}
