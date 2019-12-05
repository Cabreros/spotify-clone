import 'package:flutter/material.dart';
import '../promo_assets.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.center,
              // Add one stop for each color. Stops should increase from 0 to 1

              colors: [Color(0xff3E4852), Color(0xff121212)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 17.0, 10.0, 0.0),
                      child: Icon(
                        Icons.settings,
                        size: 30.0,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Recently Played',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(albumData.values.elementAt(0))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
