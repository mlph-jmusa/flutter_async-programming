import 'package:flutter/material.dart';
import '../models/track.dart';

class TrackView extends StatelessWidget {
  const TrackView({Key? key, required this.track}) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipOval(
            child:
                Image.network(track.images.background, width: 80, height: 80),
          ),
          Container(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(track.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(track.subtitle, style: const TextStyle(fontSize: 16))
              ],
            ),
          )
        ],
      ),
    );
  }
}
