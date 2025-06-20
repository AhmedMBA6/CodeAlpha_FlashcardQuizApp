import 'package:flutter/material.dart';

void main({String flavor = 'prod'}) {
  runApp(MyApp(flavor: flavor));
}

class MyApp extends StatelessWidget {
  final String flavor;
  const MyApp({super.key, required this.flavor});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World ($flavor)')),
        body: Center(child: Text('Hello World - $flavor')),
      ),
    );
  }
}
