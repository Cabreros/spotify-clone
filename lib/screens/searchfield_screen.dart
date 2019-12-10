import 'package:flutter/material.dart';
import 'package:spotify_clone/components/search_tile.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            controller: controller,
          ),
          backgroundColor: Color(0xff282828),
        ),
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
