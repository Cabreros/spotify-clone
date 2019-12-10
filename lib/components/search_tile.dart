import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  'assets/images/jcole-fhd.jpeg',
                  width: 60.0,
                  height: 60.0,
                ),
              ),
              SizedBox(
                width: 14.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Post Malone',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Artist',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          Icon(
            Icons.clear,
            size: 30.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
