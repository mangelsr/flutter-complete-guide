import 'package:flutter/material.dart';

import 'package:qr_scanner_app_new/widgets/scan_tiles.dart';

class LinksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScanTiles(type: 'http');
}
