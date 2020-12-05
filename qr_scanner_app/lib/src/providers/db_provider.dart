import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  Future initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'ScansDB.db');
    return await openDatabase(path, version: 1, onOpen: (Database db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY,'
          ' type TEXT,'
          ' value TEXT'
          ')');
    });
  }

  Future<int> addScanRaw(ScanModel newScan) async {
    final db = await database;
    final result = await db.rawInsert("INSERT INTO Scans (id, type, value) "
        "VALUES (${newScan.id}, '${newScan.type}', '${newScan.value}')");
    return result;
  }

  Future<int> addScan(ScanModel newScan) async {
    final db = await database;
    final result = await db.insert('Scans', newScan.toJson());
    return result;
  }

  Future<ScanModel> getScanById(int id) async {
    final db = await database;
    final result = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? ScanModel.fromJson(result.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final result = await db.query('Scans');
    return result.isNotEmpty
        ? result.map((item) => ScanModel.fromJson(item)).toList()
        : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final result = await db.rawQuery("SELECT * FROM Scans WHERE type='$type'");
    return result.isNotEmpty
        ? result.map((item) => ScanModel.fromJson(item)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final result = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return result;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final result = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final result = await db.rawDelete('DELETE FROM Scans');
    return result;
  }
}
