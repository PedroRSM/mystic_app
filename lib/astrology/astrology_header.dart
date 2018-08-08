import 'package:flutter/material.dart';


enum TabsDemoStyle {
  iconsAndText,
  iconsOnly,
  textOnly
}

class _Page {
  const _Page({ this.icon, this.text });
  final IconData icon;
  final String text;
}

const List<_Page> _allPages = const <_Page>[
  const _Page(icon: Icons.grade, text: 'Horoscope'),
  const _Page(icon: Icons.playlist_add, text: 'Chinese Horoscope'),
  const _Page(icon: Icons.check_circle, text: 'Birth Chart'),
  const _Page(icon: Icons.question_answer, text: 'Moon'),
];

class AstrologyTabs extends StatefulWidget {
  static const String routeName = '/material/scrollable-tabs';

  @override
  AstrologyTabsState createState() => new AstrologyTabsState();
}

class AstrologyTabsState extends State<AstrologyTabs> with SingleTickerProviderStateMixin {
  TabController _controller;
  bool _customIndicator = false;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  Decoration getIndicator() {
    if (!_customIndicator)
      return const UnderlineTabIndicator();


        return new ShapeDecoration(
          shape: const StadiumBorder(
            side: const BorderSide(
              color: Colors.white24,
              width: 2.0,
            ),
          ) + const StadiumBorder(
            side: const BorderSide(
              color: Colors.transparent,
              width: 4.0,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor;
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Astrology'),
        bottom: new TabBar(
          controller: _controller,
          isScrollable: true,
          indicator: getIndicator(),
          tabs: _allPages.map((_Page page) {
                return new Tab(text: page.text);
          }).toList(),
        ),
      ),
      body: new TabBarView(
          controller: _controller,
          children: _allPages.map((_Page page) {
            return new SafeArea(
              top: false,
              bottom: false,
              child: new Container(
                key: new ObjectKey(page.icon),
                padding: const EdgeInsets.all(12.0),
                child: new Card(
                  child: new Center(
                    child: new Icon(
                      page.icon,
                      color: iconColor,
                      size: 128.0,
                      semanticLabel: 'Placeholder for ${page.text} tab',
                    ),
                  ),
                ),
              ),
            );
          }).toList()
      ),
    );
  }
}

