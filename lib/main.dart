import 'package:flutter/material.dart';
import 'package:jurnalku/exploreeeee.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku',
      home: const ExploreeeePage(),
    );
  }
}
