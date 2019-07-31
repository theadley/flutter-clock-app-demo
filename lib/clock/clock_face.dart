import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;

  ClockFace({this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new AspectRatio(
          aspectRatio: 0.75,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0XFFF4F9FD),
              boxShadow: [
                new BoxShadow(
                  offset: new Offset(8.0, 0.0),
                  blurRadius: 13.0,
                  color: Color(0xFFD3E0F0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
