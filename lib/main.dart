import 'package:flutter/material.dart';
import 'package:uas/ui_awal/name.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Name(),
      ),
    );
  }
}
