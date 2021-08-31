import 'package:exercise_asynchronous_programming/Utils/NetworkManager.dart';
import 'package:exercise_asynchronous_programming/Utils/recommendationResponse.dart';
import 'package:flutter/material.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({Key? key}) : super(key: key);

  @override
  _RecommendationsPageState createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends State<RecommendationsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: FutureBuilder(
          future: getRecommendations("484129036"),
          builder: (context, AsyncSnapshot<RecommendationResponse> snapshot) {
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
                        Track? track = snapshot.data?.tracks[row];
                        if (track != null) {
                          return Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.network(track.images.background,
                                    width: 80, height: 80),
                                Container(width: 20),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(track.title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text(track.subtitle,
                                          style: const TextStyle(fontSize: 16))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                        }

                        return const Center(child: Text('Loading'));
                      },
                      separatorBuilder: (context, row) {
                        return Container(height: 1, color: Colors.black);
                      },
                      itemCount: snapshot.data?.tracks.length ?? 0),
                ),
              ],
            );
          }),
    );
  }
}
