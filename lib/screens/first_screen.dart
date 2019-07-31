import 'package:flutter/material.dart';
import 'package:clock_app/clock/clock.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
//          height: 85, // margin-top: 85px;
          height: 50, // margin-top: 85px;
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Clock(),
        ),
        SizedBox(
          height: 85, // margin-top: 85px;
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "ALARM TIME",
                  style: TextStyle(
                    color: Color(0XFFFF0863),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.3
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                    "06:12PM",
                  style: TextStyle(
                    color: Color(0XFF2D386B),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "WAKEUP IN",
                  style: TextStyle(
                      color: Color(0XFFFF0863),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.3
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "08:00AM",
                  style: TextStyle(
                    color: Color(0XFF2D386B),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

          ],
        ),
      ],
    );
  }
}