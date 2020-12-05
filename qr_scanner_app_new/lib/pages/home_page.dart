import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_scanner_app_new/pages/links_tab.dart';
import 'package:qr_scanner_app_new/pages/map_tab.dart';
import 'package:qr_scanner_app_new/providers/scan_list_provider.dart';
import 'package:qr_scanner_app_new/providers/ui_provider.dart';
import 'package:qr_scanner_app_new/widgets/custom_fab.dart';
import 'package:qr_scanner_app_new/widgets/custom_navbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteAllScans();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavbar(),
      floatingActionButton: CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (uiProvider.tabIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return MapTab();
      case 1:
        scanListProvider.loadScansByType('http');
        return LinksTab();
      default:
        return MapTab();
    }
  }
}
