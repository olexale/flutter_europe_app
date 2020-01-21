import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class Sensorama extends StatefulWidget {
  @override
  _SensoramaState createState() => _SensoramaState();
}

class _SensoramaState extends State<Sensorama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ARKitSceneView(onARKitViewCreated: (c) => onARViewCreated(c)),
    );
  }

  void onARViewCreated(ARKitController controller) {
    final node = ARKitNode(
      geometry: ARKitSphere(
        radius: 1,
        materials: [
          ARKitMaterial(
            diffuse: ARKitMaterialProperty(image: 'images/photo360.jpg'),
            doubleSided: true,
          ),
        ],
      ),
      position: Vector3.zero(),
    );
    controller.add(node);
  }
}
