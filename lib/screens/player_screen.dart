import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  static bool favourited = true;
  static bool playing = false;

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
                        Text('SONG NAME'),
                        Text('ARTIST NAME')
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
        leading: Icon(
          Icons.keyboard_arrow_down,
          size: 40.0,
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
