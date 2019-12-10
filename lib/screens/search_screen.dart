import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.center,
              // Add one stop for each color. Stops should increase from 0 to 1

              colors: [Color(0x3f523e), Color(0xff121212)],
            ),
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  'Search',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/searchfield');
                  },
                  child: Container(
                    height: 50.0,
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        Text(
                          '  Artists, songs, or podcasts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
