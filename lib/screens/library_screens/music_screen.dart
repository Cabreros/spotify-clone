import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/library_screens/music_albums_screen.dart';
import 'package:spotify_clone/screens/library_screens/music_artists_screen.dart';
import 'package:spotify_clone/screens/library_screens/music_playlist_screen.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
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
                          'Playlists',
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
                        'Artists',
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
                        'Album',
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
                      MPlaylistScreen(),
                      MArtistsScreen(),
                      MAlbumScreen(),
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
