import 'package:flutter/material.dart';
import 'package:spotify_clone/components/navbar_player.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text('landing'),
        ),
      ),
    );
  }
}
