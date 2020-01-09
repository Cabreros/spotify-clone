import 'package:flutter/material.dart';
import 'package:spotify_clone/components/search_tile.dart';

class MArtistsScreen extends StatefulWidget {
  @override
  _MArtistsScreenState createState() => _MArtistsScreenState();
}

class _MArtistsScreenState extends State<MArtistsScreen> {
  List<String> items;
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  void initState() {
    items = List<String>.generate(10, (i) => (i + 1).toString());
    super.initState();
    controller.addListener(
      () {
        setState(() {
          filter = controller.text;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff121212),
          child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return filter == null || filter == ""
                  ? new SearchTile()
                  : items[index].toLowerCase().contains(filter.toLowerCase())
                      ? new Text(items[index])
                      : new Container();
            },
          ),
        ),
      ),
    );
  }
}
