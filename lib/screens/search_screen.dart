import 'dart:convert';
import 'dart:math';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/services/genre_api.dart';

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
            child: Column(
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
                FutureBuilder(
                  future: getGenres(),
                  builder: (context, snapshot) {
                    // return Text(snapshot.data.body);
                    switch (snapshot.connectionState) {

                      ///when the future is null
                      case ConnectionState.none:
                        return Text(
                          'Press the button to fetch data',
                          textAlign: TextAlign.center,
                        );

                      case ConnectionState.active:
                        return Text('eskete');

                      ///when data is being fetched
                      case ConnectionState.waiting:
                        return CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue));

                      case ConnectionState.done:
                        List genres = jsonDecode(snapshot.data.body)['genres'];
                        List<Widget> genreWidgets = [];

                        ///task is complete with an error (eg. When you
                        ///are offline)
                        if (snapshot.hasError)
                          return Text(
                            'Error:\n\n${snapshot.error}',
                            textAlign: TextAlign.center,
                          );
                        if (genres != null) {
                          for (String genre in genres) {
                            genreWidgets.add(
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  StringUtils.capitalize(genre),
                                  style: TextStyle(
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                ),
                              ),
                            );
                          }

                          ///task is complete with some data
                          return Expanded(
                            child: GridView.count(
                              padding: EdgeInsets.all(12.0),
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              children: genreWidgets,
                              childAspectRatio: 1.6,
                            ),
                          );
                        } else {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Could not load data'),
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                ),
                              ],
                            ),
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
