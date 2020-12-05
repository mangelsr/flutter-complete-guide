import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner_app_new/providers/ui_provider.dart';

class CustomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: uiProvider.tabIndex,
      onTap: (int idx) => uiProvider.tabIndex = idx,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Links',
        ),
      ],
    );
  }
}
