import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:qr_scanner_app/src/models/scan_model.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String mapType = 'streets';
  final List<String> mapTypes = [
    'streets',
    'dark',
    'light',
    'outdoors',
    'satellite'
  ];
  int index = 0;
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Coords'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapController.move(scan.getLatLng(), 15);
            },
          ),
        ],
      ),
      body: _buildMap(scan),
      floatingActionButton: _buildFab(context),
    );
  }

  FloatingActionButton _buildFab(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.repeat),
      onPressed: () {
        if (index == mapTypes.length - 1) {
          index = 0;
        } else {
          index++;
        }
        setState(() {});
      },
    );
  }

  Widget _buildMap(ScanModel scan) {
    return FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: scan.getLatLng(),
          zoom: 15.0,
        ),
        layers: <LayerOptions>[
          _buildLayers(),
          _buildMarkers(scan),
        ]);
  }

  TileLayerOptions _buildLayers() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken': '',
          'id': 'mapbox.${mapTypes[index]}',
        });
  }

  _buildMarkers(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (BuildContext context) {
            return Container(
              child: Icon(
                Icons.location_on,
                size: 60.0,
                color: Theme.of(context).primaryColor,
              ),
            );
          }),
    ]);
  }
}
