import 'dart:async';

import 'package:qr_scanner_app/src/models/scan_model.dart';

class Validators {
  final validateGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (List<ScanModel> scans, EventSink sink) {
      final geoScans = scans.where((scan)=>scan.type=='geo').toList();
      sink.add(geoScans);
    }
  );

  final validateHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (List<ScanModel> scans, EventSink sink) {
      final httpScans = scans.where((scan)=>scan.type=='http').toList();
      sink.add(httpScans);
    }
  );
}