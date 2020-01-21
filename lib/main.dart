import 'package:flutter/material.dart';
import 'package:flutter_europe_app/demo/face_tracking.dart';
import 'package:flutter_europe_app/demo/navicam.dart';
import 'package:flutter_europe_app/demo/sensorama.dart';
import 'package:flutter_europe_app/demo/sword_of_damocles.dart';
import 'package:flutter_europe_app/demo/widget_projection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Europ Demos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Europe Demos'),
        ),
        body: ListView(children: [
          DemoTile(title: 'Sword of Damocles', demo: SwordOfDamocles()),
          DemoTile(title: 'Sensorama', demo: Sensorama()),
          DemoTile(title: 'NaviCam', demo: NaviCam()),
          DemoTile(title: 'The Master Key', demo: FaceTracking()),
          DemoTile(title: 'Widget', demo: WidgetProjectionPage()),
        ]),
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  const DemoTile({Key key, this.title, this.demo}) : super(key: key);

  final String title;
  final Widget demo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => demo,
        ),
      ),
    );
  }
}
