import 'package:flutter/material.dart';

class BottomPlayer extends StatefulWidget {
  @override
  _BottomPlayerState createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  static bool favourited = true;
  static bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff282828),
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  favourited = !favourited;
                });
              },
              child: Icon(
                favourited ? Icons.favorite : Icons.favorite_border,
                size: 30.0,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Heartless',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(' - '),
                    Text(
                      'The Weeknd',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.cast,
                      size: 20.0,
                    ),
                    Text(
                      ' Devices Available',
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  playing = !playing;
                });
              },
              child: Icon(
                playing
                    ? Icons.play_circle_outline
                    : Icons.pause_circle_outline,
                size: 35.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
