import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class NaviCam extends StatefulWidget {
  @override
  _NaviCamState createState() => _NaviCamState();
}

class _NaviCamState extends State<NaviCam> {
  ARKitController arkitController;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ARKitSceneView(
          detectionImagesGroupName: 'AR Resources',
          onARKitViewCreated: onARKitViewCreated,
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = onAnchorWasFound;
  }

  void onAnchorWasFound(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      final material = ARKitMaterial(
        lightingModelName: ARKitLightingModel.lambert,
        diffuse: ARKitMaterialProperty(image: 'images/earth.jpg'),
      );
      final sphere = ARKitSphere(
        materials: [material],
        radius: 0.06,
      );

      final earthPosition = anchor.transform.getColumn(3);
      final node = ARKitNode(
        geometry: sphere,
        position:
            vector.Vector3(earthPosition.x, earthPosition.y, earthPosition.z),
        eulerAngles: vector.Vector3.zero(),
      );
      arkitController.add(node);
    }
  }
}
