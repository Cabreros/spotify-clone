import 'package:flutter/material.dart';
import 'package:spotify_clone/promo_assets.dart';

class PlaylistList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //Shrinkwrap encloses the listview without it causes crashes with widget becoming oversized
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 12.0, 12.0, 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                albumData.values.elementAt(index),
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                albumData.keys.elementAt(index),
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              )
            ],
          ),
        );
      },
      itemCount: albumData.length,
    );
  }
}
