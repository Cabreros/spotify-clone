import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/screens/home_screen.dart';
import 'package:spotify_clone/screens/player_screen.dart';
import 'package:spotify_clone/screens/searchfield_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.black),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/searchfield': (context) => SearchField(),
        '/playerscreen': (context) => PlayerScreen(),
      },
    );
  }
}
