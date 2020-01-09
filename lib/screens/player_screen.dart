import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  static bool favourited = true;
  static bool playing = false;
  static bool active = false;
  var time = 59.0;
  int currentTime = 0;
  var currentSec = 59;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1

            colors: [Color(0xff3E4852), Color(0xff121212)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Material(
                  elevation: 10.0,
                  child: Image.asset(
                    'assets/images/jcole-fhd.jpeg',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Intro',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'J. Cole',
                          style: TextStyle(fontSize: 19.0, color: Colors.grey),
                        ),
                      ],
                    ),
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
                  ],
                ),
                Slider(
                  onChanged: (newTime) {
                    setState(() {
                      time = newTime;
                      currentSec = time.toInt() % 60;
                      currentTime = time ~/ 60.0;
                    });
                  },
                  value: time,
                  min: 0,
                  max: 129,
                  inactiveColor: Colors.grey[700],
                  activeColor: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('$currentTime:$currentSec'),
                    Text('2:09')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.shuffle),
                    Icon(
                      Icons.skip_previous,
                      size: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          playing = !playing;
                        });
                      },
                      child: Icon(
                        playing
                            ? Icons.play_circle_filled
                            : Icons.pause_circle_filled,
                        size: 90.0,
                      ),
                    ),
                    Icon(
                      Icons.skip_next,
                      size: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          active = !active;
                        });
                      },
                      child: Icon(
                        Icons.repeat,
                        color: active ? Colors.green : Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.devices,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.list,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PLAYING FROM ALBUM',
              style: TextStyle(
                letterSpacing: 1.0,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
              ),
            ),
            Text('2014 Forest Hill Drive')
          ],
        ),
        backgroundColor: Color(0xff3E4852),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 40.0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              size: 30.0,
            ),
          )
        ],
      ),
    );
  }
}
