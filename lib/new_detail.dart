import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class NewDetail extends StatefulWidget {
  final String value;
  final String thumbnail;
  NewDetail({Key key, this.value, this.thumbnail}) : super (key: key);

  @override
  _NewDetailState createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("test"),
        ),
        body: new SingleChildScrollView(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Image.network("${widget.thumbnail}"),
                new HtmlView(data: "${widget.value}"),

              ],
            ),

          ),
        )

    );
  }

}