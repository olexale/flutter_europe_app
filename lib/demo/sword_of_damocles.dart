import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class SwordOfDamocles extends StatefulWidget {
  @override
  _SwordOfDamoclesState createState() => _SwordOfDamoclesState();
}

class _SwordOfDamoclesState extends State<SwordOfDamocles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ARKitSceneView(onARKitViewCreated: (c) => onARViewCreated(c)),
    );
  }

  void onARViewCreated(ARKitController controller) {
    final node = ARKitNode(
        geometry: ARKitBox(
          width: 0.06,
          height: 0.06,
          length: 0.06,
          materials: [
            ARKitMaterial(fillMode: ARKitFillMode.lines),
          ],
        ),
        position: Vector3(0, 0, -0.5));
    controller.add(node);
  }
}
