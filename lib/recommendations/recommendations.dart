import '../../Utils/network_manager.dart';
import '../../models/track.dart';
import 'package:flutter/material.dart';
import '../customs/track_view.dart';

// * Recommendations page - shows recommended tracks based on key.
class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({Key? key}) : super(key: key);

  @override
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  // * Used future builder to build UI from async function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: FutureBuilder(
          future: getRecommendations("484129036"),
          builder: (context, AsyncSnapshot<List<Track>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Loading'));
            }

            return Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 3, top: 3),
                    child: Text('Songs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                  ),
                ),
                Container(height: 1, color: Colors.black),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, row) {
                        Track? track = snapshot.data?[row];
                        if (track != null) return TrackView(track: track);
                        return const Center(child: Text('Loading'));
                      },
                      separatorBuilder: (context, row) {
                        return Container(height: 1, color: Colors.black);
                      },
                      itemCount: snapshot.data?.length ?? 0),
                ),
              ],
            );
          }),
    );
  }
}
