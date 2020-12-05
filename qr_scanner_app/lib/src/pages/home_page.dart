import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/utils/utils.dart';

import 'package:qrcode_reader/qrcode_reader.dart';

import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:qr_scanner_app/src/pages/addresses_page.dart';
import 'package:qr_scanner_app/src/pages/maps_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScansBloc scansBloc = ScansBloc();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scansBloc.deleteAllScans();
            },
          ),
        ],
      ),
      body: _loadPage(_currentIndex),
      bottomNavigationBar: _buildNavigation(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () {
          _scanQR(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        _currentIndex = index;
        setState(() {});
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          label: 'Directions',
        ),
      ],
    );
  }

  Widget _loadPage(int actualPage) {
    switch (actualPage) {
      case 0:
        return MapsPage();
      case 1:
        return AddressesPage();
      default:
        return MapsPage();
    }
  }

  void _scanQR(BuildContext context) async {
    String futureString = '';
    try {
      futureString = await QRCodeReader().scan();
    } catch (err) {
      futureString = err.toString();
    }
    if (futureString != null) {
      final newScan = ScanModel(value: futureString);
      scansBloc.addScan(newScan);
      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          openScan(context, newScan);
        });
      } else {
        openScan(context, newScan);
      }
    }
  }
}
