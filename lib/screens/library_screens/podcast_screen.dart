import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/library_screens/podcast_downloads_screen.dart';
import 'package:spotify_clone/screens/library_screens/podcast_episode_screen.dart';
import 'package:spotify_clone/screens/library_screens/podcast_shows_screen.dart';

class PodcastScreen extends StatefulWidget {
  @override
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
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
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                        onTap: () {
                          controller.animateToPage(0,
                              duration: new Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Episodes',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.animateToPage(1,
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Downloads',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.animateToPage(2,
                            duration: new Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Shows',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: GestureDetector(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: <Widget>[
                      PEpisodeScreen(),
                      PDownloadScreen(),
                      PShowScreen()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
