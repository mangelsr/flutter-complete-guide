import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;

  final center = LatLng(-2.1894, -79.8890);

  String selectedStyle = 'mapbox://styles/mangelsr/ckdmaq1zl1emp1inx4qf2z7qb';

  final darkStyle = 'mapbox://styles/mangelsr/ckdmaq1zl1emp1inx4qf2z7qb';
  final streetStyle = 'mapbox://styles/mangelsr/ckdmasgz900ee1ikvb7ehbweu';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    _onStyleLoaded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMapboxMap(),
      floatingActionButton: buildFabs(),
    );
  }

  void _onStyleLoaded() {
    addImageFromAsset("assetImage", "assets/custom-icon.png");
    addImageFromUrl("networkImage", "https://via.placeholder.com/100");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, String url) async {
    var response = await http.get(url);
    return mapController.addImage(name, response.bodyBytes);
  }

  Column buildFabs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Simbols
        FloatingActionButton(
          child: Icon(Icons.sentiment_dissatisfied),
          onPressed: () {
            mapController.addSymbol(SymbolOptions(
              geometry: center,
              textField: 'Test',
              textColor: '#fff',
              textOffset: Offset(0, 2),
              iconImage: 'networkImage',
              // iconSize: 3,
            ));
          },
        ),

        SizedBox(
          height: 5,
        ),

        // ZoomIn
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
        ),

        SizedBox(
          height: 5,
        ),

        // ZoomOut
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),

        SizedBox(
          height: 10,
        ),

        // Style changer
        FloatingActionButton(
            child: Icon(Icons.add_to_home_screen),
            onPressed: () {
              if (selectedStyle == darkStyle) {
                selectedStyle = streetStyle;
              } else {
                selectedStyle = darkStyle;
              }
              _onStyleLoaded();
              setState(() {});
            }),
      ],
    );
  }

  MapboxMap buildMapboxMap() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
    );
  }
}
