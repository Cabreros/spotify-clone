import 'package:flutter/material.dart';
import 'package:spotify_clone/components/navbar_player.dart';
import 'package:spotify_clone/screens/landing_screen.dart';
import 'package:spotify_clone/screens/library_screen.dart';
import 'package:spotify_clone/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          LandingScreen(),
          SearchScreen(),
          LibraryScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomSheet: BottomPlayer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff282828),
          currentIndex: _currentTab,
          iconSize: 20,
          selectedFontSize: 14.0,
          selectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Search'),
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Your Library'),
              icon: Icon(
                Icons.line_weight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
