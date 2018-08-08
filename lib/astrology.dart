import 'package:flutter/material.dart';

class AstrologyHoroscopeToday extends StatefulWidget {
  @override
  _AstrologyHoroscopeTodayState createState() =>
      _AstrologyHoroscopeTodayState();
}

class _AstrologyHoroscopeTodayState extends State<AstrologyHoroscopeToday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Center(
          child: new Container(
        child: new Text("hello"),
      )),
    );
  }
}
