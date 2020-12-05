import 'package:flutter/material.dart';
import 'package:qr_scanner_app_new/widgets/scan_tiles.dart';

class MapTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScanTiles(type: 'geo');
}
