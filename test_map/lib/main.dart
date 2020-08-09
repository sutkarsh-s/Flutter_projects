import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "PlaceZ",
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// The State class is responsible for two things: holding some data you can
// update and building the UI using that data.
class _MyHomePageState extends State<MyHomePage> {
  // Whether the green box should be visible.
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // The green box goes here with some other Widgets.

    return Scaffold(
        body: Column(children: <Widget>[
      AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        // The green box must be a child of the AnimatedOpacity widget.
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
        ),
      ),
      FloatingActionButton(
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      )
    ]));
  }
}
