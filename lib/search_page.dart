import 'dart:async';

import 'package:exercise_asynchronous_programming/Utils/network_manager.dart';
import 'package:exercise_asynchronous_programming/Utils/track.dart';
import 'package:flutter/material.dart';

// Search page - SHws searched tracks based on what user searched.
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = "";
  final tracksStream = StreamController<List<Track>>();

// * Used StreamBuilder to build UI from async request.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, bottom: 3, top: 3, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        onChanged: (e) {
                          searchText = e;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Search...")),
                  ),
                  Container(width: 7),
                  IconButton(
                      onPressed: () {
                        if (searchText != '') {
                          searchTracks(searchText)
                              .then((value) => tracksStream.add(value));
                        }
                      },
                      icon: const Icon(Icons.search),
                      iconSize: 25)
                ],
              ),
            ),
          ),
          StreamBuilder(
              stream: tracksStream.stream,
              builder: (context, AsyncSnapshot<List<Track>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Text(
                          searchText == '' ? 'Search something' : 'Loading'));
                }

                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, row) {
                        Track? track = snapshot.data?[row];
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
                      itemCount: snapshot.data?.length ?? 0),
                );
              }),
        ]));
  }
}
