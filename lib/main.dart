import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystic_app/bottom_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mystic App',
      home: HomePage(),
    );
  }
}

