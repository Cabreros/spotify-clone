import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/library_screens/music_screen.dart';
import 'package:spotify_clone/screens/library_screens/podcast_screen.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xff121212),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {
                          controller.animateToPage(0,
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Music',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.animateToPage(1,
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Podcasts',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    MusicScreen(),
                    PodcastScreen(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
