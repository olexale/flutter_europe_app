import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';

class FaceTracking extends StatefulWidget {
  FaceTracking({Key key}) : super(key: key);

  @override
  _FaceTrackingState createState() => _FaceTrackingState();
}

class _FaceTrackingState extends State<FaceTracking> {
  String person = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ARKitSceneView(
            configuration: ARKitConfiguration.faceTracking,
            onARKitViewCreated: (c) => c.onUpdateNodeForAnchor = _updateFace,
          ),
          SafeArea(
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  person,
                  style: Theme.of(context).textTheme.display4.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  void _updateFace(ARKitAnchor anchor) {
    if (anchor is ARKitFaceAnchor) {
      final ARKitFaceAnchor faceAnchor = anchor;

      var mouthSmile = faceAnchor.blendShapes['mouthSmile_L'];
      if (mouthSmile > 0.5) {
        setState(() => person = 'Happy');
      } else if (mouthSmile < 0.00000001) {
        setState(() => person = 'Sad');
      } else {
        setState(() => person = '');
      }
    }
  }
}
