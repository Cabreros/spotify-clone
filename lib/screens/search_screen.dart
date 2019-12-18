import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

                        ///task is complete with an error (eg. When you
                        ///are offline)
                        if (snapshot.hasError)
                          return Text(
                            'Error:\n\n${snapshot.error}',
                            textAlign: TextAlign.center,
                          );

                        ///task is complete with some data
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: Text(genres[index]),
                              );
                            },
                            itemCount: genres.length,
                          ),
                        );
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
