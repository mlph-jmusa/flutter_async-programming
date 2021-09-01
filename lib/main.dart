import 'package:exercise_asynchronous_programming/recommendations.dart';
import 'package:exercise_asynchronous_programming/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('Main Page')),
          body: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.center,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecommendationsPage()));
                },
                child: const Text('Recommendations'),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size((size.width * 0.4).toDouble(), 55)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white))),
            Container(width: 15),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                child: const Text('Search'),
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                        Size((size.width * 0.4).toDouble(), 55)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)))
          ],
        ),
      ),
    );
  }
}
